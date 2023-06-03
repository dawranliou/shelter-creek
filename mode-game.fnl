(local fennel (require "lib/fennel"))
(local sti (require "lib/sti"))
(local Camera (require "lib/camera"))
(local anim8 (require "lib/anim8"))
(local bump (require "lib/bump"))

(var DEBUG false)

(var time 0)

;; nil :in :out
(var transition? nil)
(var transition-to nil)
(var transition-pct 0)

(local camera (Camera 0 0 2))
(var player nil)
(var guides {})
(var active-dialog nil)
(var mushrooms {})
(var portals {})
(local portal-location
       {:cabin "assets/map-cabin.lua"
        :forest "assets/map-forest.lua"
        :cave "assets/map-cave.lua"
        :peak "assets/map-peak.lua"})

(local sprite (love.graphics.newImage "assets/spritesheet.png"))
(local shroomdex-quad (love.graphics.newQuad 0 (* 9 16) (* 9 16) (* 6 16)
                                             (sprite:getWidth)
                                             (sprite:getHeight)))
(local left-quad (love.graphics.newQuad 0 (* 5 16) 16 16
                                        (sprite:getWidth)
                                        (sprite:getHeight)))
(local right-quad (love.graphics.newQuad 16 (* 5 16) 16 16
                                         (sprite:getWidth)
                                         (sprite:getHeight)))
(local dialog-quad (love.graphics.newQuad (* 9 16) (* 2 16) (* 8 16) (* 4 16)
                                          (sprite:getWidth)
                                          (sprite:getHeight)))
(local q-quad (love.graphics.newQuad 16 16 16 16
                                     (sprite:getWidth)
                                     (sprite:getHeight)))

(local animations {:idle {:left nil
                          :right nil}
                   :walk {:left nil
                          :right nil}
                   :fall {:left nil
                          :right nil}})
(local grid (anim8.newGrid 32 32
                           (sprite:getWidth) (sprite:getHeight)
                           32 0))
(set animations.idle.right
     (anim8.newAnimation (grid "1-3" 1) [0.4 0.1 0.2]))
(set animations.walk.right
     (anim8.newAnimation (grid "1-2" 2) [0.3 0.3]))
(set animations.fall.right
     (anim8.newAnimation (grid "1-3" 3) [0.05 0.05 0.4] "pauseAtEnd"))
(set animations.idle.left (doto (animations.idle.right:clone) (: :flipH)))
(set animations.walk.left (doto (animations.walk.right:clone) (: :flipH)))
(set animations.fall.left (doto (animations.fall.right:clone) (: :flipH)))


(var shroomdex-mode? false)
(var shroomdex-idx 1)
(var shroomdex [{:name "twin shroom"
                 :description "Grows in the middle of two identical trees."
                 :quad (love.graphics.newQuad 0 0 16 16
                                              (sprite:getWidth)
                                              (sprite:getHeight))
                 :collected? false}
                {:name "sky shroom"
                 :description "Found in the highest peak in the forest of Shelter Creek."
                 :quad (love.graphics.newQuad 16 0 16 16
                                              (sprite:getWidth)
                                              (sprite:getHeight))
                 :collected? false}
                {:name "rock shroom"
                 :description "Usually found in the caves. They are a fan of rock n rolls. Researchers need to 'rock' pretty hard to lure them out."
                 :quad (love.graphics.newQuad 0 16 16 16
                                              (sprite:getWidth)
                                              (sprite:getHeight))
                 :collected? false}
                {:name "shy shroom"
                 :description "This variety is pretty shy. Some researchers say you need to be 'brave' to find them."
                 :quad (love.graphics.newQuad 0 32 16 16
                                              (sprite:getWidth)
                                              (sprite:getHeight))
                 :collected? false}
                {:name "crowd shroom"
                 :description "The most mythical shroom of all shrooms in shelter creek. They only show up near cabin when you collect all the other shrooms."
                 :quad (love.graphics.newQuad 0 48 16 16
                                              (sprite:getWidth)
                                              (sprite:getHeight))
                 :collected? false}])
(set _G.shroomdex shroomdex)

(var scene "assets/map-cabin.lua")
(var world (bump.newWorld 16))

(var w (love.graphics.getWidth))
(var h (love.graphics.getHeight))
(var screen-w (/ w camera.scale))
(var screen-h (/ h camera.scale))
(var map (sti scene ["bump"]))
(var world-w (* map.width map.tilewidth))
(var world-h (* map.height map.tileheight))

(fn draw-sprites-layer [self]
  (: (. animations player.state player.dir)
     :draw
     player.sprite
     (math.floor player.x)
     (math.floor player.y)
     0 1 1 (if (= player.dir :right) 13 10) 16)
  (each [key shroom (pairs mushrooms)]
    (when (not= shroom.state :collected)
      (love.graphics.draw sprite
                          (. shroomdex shroom.shroomidx :quad)
                          (math.floor shroom.x)
                          (math.floor shroom.y))))

  (when DEBUG
    (love.graphics.print player.state
                         (- (math.floor player.x) 5)
                         (- (math.floor player.y) 20))
    (love.graphics.print (: "(%d, %d)" :format player.x player.y)
                         (- (math.floor player.x) 5)
                         (- (math.floor player.y) 40))
    ;; (love.graphics.setPointSize 5)
    ;; (love.graphics.points (math.floor player.x)
    ;;                       (math.floor player.y))
    ))

(var collect-timer 0)
(var collect-target nil)

(fn collect-mushroom [mushroom]
  (when (not= mushroom.state :collected)
    (set mushroom.state :collected)
    (when DEBUG
      (print (fennel.view mushroom)))
    (tset shroomdex mushroom.shroomidx :collected? true)))

(fn run-collect-system [player entities]
  (each [key entity (pairs entities)]
    (when (bump.rect.detectCollision
           player.x player.y player.width player.height
           entity.x entity.y entity.width entity.height)
      (collect-mushroom entity))))

(fn show-guidance [guide]
  (when (not= guide.state :active)
    (set guide.state :active)
    (set active-dialog guide)))

(fn dismiss-guidance [guide]
  (when (and active-dialog (= active-dialog.name guide.name))
    (set guide.state :inactive)
    (set active-dialog nil)))

(fn run-guidance-system [player entities]
  (each [key entity (pairs entities)]
    (if (bump.rect.detectCollision
         player.x player.y player.width player.height
         entity.x entity.y entity.width entity.height)
        (show-guidance entity)
        (dismiss-guidance entity))))

(fn enter-portal [portal]
  (when (not= portal.state :entered)
    (set portal.state :entered)
    (print "entering:" portal.target)
    (let [target-map (. portal-location portal.target)
          spawn-point portal.spawn-point
          spawn-dir portal.spawn-dir]
      (set transition-to [target-map spawn-point spawn-dir])
      (set transition? :out))))

(fn run-portal-system [player entities]
  (each [key entity (pairs entities)]
    (when (bump.rect.detectCollision
           player.x player.y player.width player.height
           entity.x entity.y entity.width entity.height)
      (enter-portal entity))))

(fn update-sprites-layer [self dt]
  (local prev-state player.state)

  (var target-x player.x)

  ;; X
  (set player.moving? false)
  (when (and (not shroomdex-mode?) (love.keyboard.isDown "left" "a"))
    (set player.dir :left)
    (set player.moving? true)
    (set target-x (- target-x 2)))
  (when (and (not shroomdex-mode?) (love.keyboard.isDown "right" "d"))
    (set player.dir :right)
    (set player.moving? true)
    (set target-x (+ target-x 2)))

  ;; Y
  (var target-y player.y)
  (when (and (not shroomdex-mode?)
             (love.keyboard.isDown "space" "x")
             (not= prev-state :fall))
    (set player.v (- player.v 6)))
  ;; gravity
  (if (< player.v 4)
      (set player.v (+ player.v 0.25))
      (set player.v 4))
  (set target-y (+ target-y player.v))

  ;; Collision
  (local (actual-x actual-y _cols _len)
         (world:move player target-x target-y))
  (set player.x actual-x)
  (set player.y actual-y)

  (set player.grounded? (and (<= 0 player.v)
                             (< actual-y target-y)))
  (when player.grounded?
    (set player.v 0))

  (run-collect-system player mushrooms)
  (run-guidance-system player guides)
  (run-portal-system player portals)

  ;; animation state
  (if (not player.grounded?) (set player.state :fall)
      player.moving? (set player.state :walk)
      :else (set player.state :idle))

  (if (not= prev-state player.state)
      (doto (. animations player.state player.dir)
        (: :gotoFrame 1)
        (: :resume))
      :else
      (: (. animations player.state player.dir) :update dt)))

(fn setup-scene [scene-path spawn-point spawn-dir]
  ;; Cleanup entities
  (set mushrooms [])
  (set guides [])
  (set portals [])
  (when (and world player)
    (world:remove player)
    (set player nil))
  (set world nil)
  (set map nil)

  (print "Loading map:" scene-path)
  (set scene scene-path)
  (set world (bump.newWorld 16))

  (set w (love.graphics.getWidth))
  (set h (love.graphics.getHeight))
  (set screen-w (/ w camera.scale))
  (set screen-h (/ h camera.scale))
  (set map (sti scene-path ["bump"]))
  (set _G.map map)
  (set world-w (* map.width map.tilewidth))
  (set world-h (* map.height map.tileheight))
  (when DEBUG
    (print "Res:" w h)
    (print "Screen:" screen-w screen-h)
    (print "World:" world-w world-h))
  (map:bump_init world)

  (each [key object (pairs map.objects) &until player]
    (when (and (= object.name "Player")
               (= object.properties.spawnpoint spawn-point))
      (set player {:sprite sprite
                   :state :fall
                   :dir (or spawn-dir :right)
                   :grounded? false
                   :moving? false
                   :jumps 0
                   :animation {:idle nil
                               :walk nil
                               :fall nil}
                   :width 11
                   :height 16
                   :v 0
                   :x (- object.x 16)
                   :y (- object.y 16)})
      (set _G.player player)
      (world:add player
                 player.x player.y player.width player.height)))
  (when DEBUG
    (print "player:" (fennel.view player)))

  (each [key object (pairs map.objects)]
    (case object.type
      "guide" (table.insert guides {:name object.name
                                    :x object.x
                                    :y object.y
                                    :width object.width
                                    :height object.height
                                    :text object.properties.text})
      "mushroom" (let [idx object.properties.shroomidx]
                   (table.insert mushrooms
                                 {:name object.name
                                  :x object.x
                                  :y object.y
                                  :width object.width
                                  :height object.height
                                  :state (if (. shroomdex idx :collected?)
                                             :collected
                                             :idle)
                                  :shroomidx idx}))
      "portal" (table.insert portals {:name object.name
                                      :target object.properties.target
                                      :spawn-point object.properties.spawnpoint
                                      :spawn-dir object.properties.spawndir
                                      :x object.x
                                      :y object.y
                                      :width object.width
                                      :height object.height})
      _ :skip))
  (set _G.mushrooms mushrooms)
  (set _G.guides guides)
  (set _G.portals portals)

  (doto (map:addCustomLayer "sprites")
    (tset :draw draw-sprites-layer)
    (tset :update update-sprites-layer))

  (map:removeLayer "spawn point"))

(fn draw [message]
  ;; (camera:attach)
  (love.graphics.clear 0.0980 0.1020 0.1216)
  (love.graphics.setColor 1 1 1)
  (map:draw (- camera.x) (- camera.y) camera.scale camera.scale)
  (when active-dialog
    (love.graphics.setColor 1 1 1)
    (love.graphics.draw sprite dialog-quad 45 20 0 4)
    (love.graphics.setColor 0 0 0)
    (love.graphics.printf active-dialog.text 110 80 120 :left 0 3))
  (when shroomdex-mode?
    (love.graphics.setColor 0 0 0 0.95)
    (love.graphics.rectangle :fill 0 0 w h)
    (love.graphics.setColor 1 1 1)
    (love.graphics.draw sprite shroomdex-quad 20 20 0 4)
    (when (< 1 shroomdex-idx)
      (love.graphics.draw sprite left-quad 40 400 0 4))
    (when (< shroomdex-idx (length shroomdex))
      (love.graphics.draw sprite right-quad 520 400 0 4))
    (let [shroom (. shroomdex shroomdex-idx)]
      (love.graphics.setColor 0 0 0)
      (love.graphics.print (: "#%d" :format shroomdex-idx) 120 190 0 3)
      (love.graphics.printf (if shroom.collected? shroom.name "?????")
                            120 220 60 :left 0 3)
      (love.graphics.printf shroom.description 340 100 80 :left 0 2)
      (love.graphics.setColor 0.2235 0.2078 0.2549)
      (love.graphics.rectangle :fill 120 108 80 80)
      (when (not shroom.collected?)
        (love.graphics.setColor 1 1 1)
        (love.graphics.draw sprite q-quad 120 108 0 5))
      (when (or shroom.collected? DEBUG)
        (love.graphics.setColor 1 1 1)
        (love.graphics.draw sprite shroom.quad 120 108 0 5))))
  (when transition?
    (love.graphics.setColor 0 0 0 transition-pct)
    (love.graphics.rectangle :fill 0 0 w h))
  (when DEBUG
    (love.graphics.setColor 1 0 0)
    (map:bump_draw (* -1 camera.x) (* -1 camera.y) camera.scale camera.scale)
    (love.graphics.setColor 1 1 1)
    (love.graphics.print (love.timer.getFPS) 10 10))
  ;; (camera:detach)
  ;; (love.graphics.print "game" 0 10)
  )

(fn clamp [x min max]
  (or (when (< max x) max)
      (when (< x min) min)
      x))

(fn update [dt set-mode]
  (case transition?
    :out (do (set transition-pct (+ transition-pct 0.02))
             (when (<= 1 transition-pct)
               (setup-scene (unpack transition-to))
               (set transition? :in)
               (set transition-pct 1)))
    :in (do (set transition-pct (- transition-pct 0.02))
            (when (<= transition-pct 0)
              (set transition? nil)
              (set transition-pct 0)))
    nil (map:update dt))
  (camera:lockX (clamp
                 (- player.x
                    (/ w camera.scale 2)
                    ;; (if (= player.dir :right) -10 10)
                    )
                 0 (- world-w screen-w))
                ;; (Camera.smooth.damped 10)
                )
  (camera:lockY (clamp
                 (- player.y (/ h camera.scale 2))
                 0 (- world-h screen-h))
                ;; (Camera.smooth.damped 10)
                ))

(fn set-zoom-to [n]
  (camera:zoomTo n)
  (set screen-w (/ w camera.scale))
  (set screen-h (/ h camera.scale))
  (set world-w (* map.width map.tilewidth))
  (set world-h (* map.height map.tileheight))
  (when DEBUG
    (print "Screen:" screen-w screen-h)
    (print "World:" world-w world-h))
  )

(fn keypressed [key set-mode]
  ;; (set-mode :mode-intro)
  ;;(love.event.quit)
  (when shroomdex-mode?
    (case key
      "left" (when (< 1 shroomdex-idx)
               (set shroomdex-idx (- shroomdex-idx 1)))
      "a" (when (< 1 shroomdex-idx)
            (set shroomdex-idx (- shroomdex-idx 1)))
      "right" (when (< shroomdex-idx (length shroomdex))
                (set shroomdex-idx (+ shroomdex-idx 1)))
      "d" (when (< shroomdex-idx (length shroomdex))
            (set shroomdex-idx (+ shroomdex-idx 1)))))
  (case key
    "z" (set shroomdex-mode? (not shroomdex-mode?))
    "escape" (set shroomdex-mode? false)
    ;; house-keeping
    "1" (set-zoom-to 1)
    "2" (set-zoom-to 2)
    "0" (set DEBUG (not DEBUG)))
  )

;; side effect on load
(love.graphics.setNewFont "assets/Silkscreen-Regular.ttf" 8)
(setup-scene "assets/map-cabin.lua" 1 :right)

{: draw
 : update
 : keypressed}
