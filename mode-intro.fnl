(local music (require :music))
(var cover-image nil)
(var counter 0)
(var toggle? true)

(fn activate []
  (love.graphics.setDefaultFilter "nearest" "nearest" 0)
  (love.graphics.setNewFont "assets/Silkscreen-Regular.ttf" 8)
  (set cover-image (love.graphics.newImage "assets/cover.png")))

(fn draw [message]
  (local canvas (love.graphics.getCanvas))
  (local w (canvas:getWidth))
  (love.graphics.clear 0.2235 0.2078 0.2549)
  (love.graphics.draw cover-image 40 10 0 3)
  ;; (love.graphics.printf "Shelter Creek" 0 460 (/ w 4) :center 0 4)
  (when toggle?
    (love.graphics.printf "Press <X> to start"
                          0 500 (/ w 3) :center 0 3)))
(fn update [dt set-mode]
  (music.play-track :general)
  (if (< counter 60)
      (set counter (+ counter 1))
      (do (set counter 0)
          (set toggle? (not toggle?)))))

(fn keypressed [key set-mode]
  (case key
    "x" (set-mode :mode-game)))

;; Side effect on reload
(activate)

{: activate 
 : draw
 : update
 : keypressed}
