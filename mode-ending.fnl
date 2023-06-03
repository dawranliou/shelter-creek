(local music (require :music))
(var timer 0)
(var frame 0)

(fn init []
  (music.stop-all-tracks)
  (set frame 0)
  (set timer 0))

(fn draw []
  (local canvas (love.graphics.getCanvas))
  (local w (canvas:getWidth))
  (love.graphics.printf "Credits:" 0 150 (/ w 3) :center 0 3)
  (love.graphics.printf "Code: Daw-Ran Liou" 0 180 (/ w 3) :center 0 3)
  (love.graphics.printf "Art: Daw-Ran Liou" 0 210 (/ w 3) :center 0 3)
  (love.graphics.printf "Music: TODO" 0 240 (/ w 3) :center 0 3)
  (love.graphics.printf "SFX: TODO" 0 270 (/ w 3) :center 0 3)

  (love.graphics.printf "The end" 0 350 (/ w 3) :center 0 3)

  (when (and (< 3 timer) (< frame 30))
    (love.graphics.printf "press 'x' to restart" 0 450 (/ w 3) :center 0 3)))

(fn update [dt]
  (music.play-track :general)
  (set frame (+ frame 1))
  (when (= frame 60)
    (set frame 0))
  (set timer (+ timer dt)))

(fn keypressed [key set-mode]
  (when (< 3 timer)
    (case key
      "x" (set-mode :mode-intro))))

;; load time side effect
(init)

{: draw
 : update
 : keypressed}
