(local sti (require "lib/sti"))
(local Camera (require "lib/camera"))
(local anim8 (require "lib/anim8"))
(local bump (require "lib/bump"))

(var DEBUG false)
(var shroomdex-mode? false)

(local camera (Camera 0 0 2))
(var player nil)

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

(var scene "assets/map-cabin.lua")
(var world (bump.newWorld 16))

(var w (love.graphics.getWidth))
(var h (love.graphics.getHeight))
(var screen-w (/ w camera.scale))
(var screen-h (/ h camera.scale))
(var map (sti scene ["bump"]))
(var world-w (* map.width map.tilewidth))
(var world-h (* map.height map.tileheight))

(fn draw-player-layer [self]
  (: (. animations player.state player.dir)
     :draw
     player.sprite
     (math.floor player.x)
     (math.floor player.y)
     0 1 1 (if (= player.dir :right) 13 10) 16)
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

(fn update-player-layer [self dt]
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
             (love.keyboard.isDown "space" "z")
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

(fn setup-scene [scene-path]
  (set scene scene-path)
  (set world (bump.newWorld 16))

  (set w (love.graphics.getWidth))
  (set h (love.graphics.getHeight))
  (set screen-w (/ w camera.scale))
  (set screen-h (/ h camera.scale))
  (set map (sti scene-path ["bump"]))
  (set world-w (* map.width map.tilewidth))
  (set world-h (* map.height map.tileheight))
  (print "Res:" w h)
  (print "Screen:" screen-w screen-h)
  (print "World:" world-w world-h)
  (map:bump_init world)

  (each [key object (pairs map.objects) &until player]
    (if (= object.name "Player")
        (do
          (print "Player:" object.x object.y)
          (set player {:sprite sprite
                       :state :fall
                       :dir :right
                       :grounded? false
                       :moving? false
                       :jumps 0
                       :animation {:idle nil
                                   :walk nil
                                   :fall nil}
                       :width object.width
                       :height object.height
                       :v 0
                       :x object.x
                       :y object.y})
          (set _G.player player)
          (world:add player
                     player.x player.y player.width player.height))))

  (doto (map:addCustomLayer "player")
    (tset :draw draw-player-layer)
    (tset :update update-player-layer))

  (map:removeLayer "spawn point"))

(fn draw [message]
  ;; (camera:attach)
  (love.graphics.clear (/ 25 255) (/ 26 255) (/ 31 255))
  (love.graphics.setColor 1 1 1)
  (map:draw (- camera.x) (- camera.y) camera.scale camera.scale)
  (love.graphics.push)
  (love.graphics.scale 3)
  (when shroomdex-mode?
    (love.graphics.setColor 0 0 0 0.95)
    (love.graphics.rectangle :fill 0 0 screen-w screen-h)
    (love.graphics.setColor 1 1 1)
    (love.graphics.draw sprite shroomdex-quad 10 5)
    (love.graphics.draw sprite left-quad 20 115)
    (love.graphics.draw sprite right-quad 125 115)
    )
  (love.graphics.pop)
  (when DEBUG
    (love.graphics.setColor 1 0 0)
    (map:bump_draw (* -1 camera.x) (* -1 camera.y) camera.scale camera.scale)
    (love.graphics.setColor 1 1 1)
    (love.graphics.print (love.timer.getFPS) 10 10))
  ;; (camera:detach)
  ;; (love.graphics.print "game" 0 10)
  )

(fn clamp [x min max]
  (or (when (< x min) min)
      (when (< max x) max)
      x))

(fn update [dt set-mode]
  (map:update dt)
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
  (case key
    "x" (set shroomdex-mode? (not shroomdex-mode?))
    "1" (set-zoom-to 1.5)
    "2" (set-zoom-to 2)
    "0" (set DEBUG (not DEBUG)))
  )

;; side effect on load
(setup-scene "assets/map-cabin.lua")

{: draw
 : update
 : keypressed}
