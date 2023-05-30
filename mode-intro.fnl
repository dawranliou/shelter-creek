;; (love.graphics.setNewFont 30)

(local (major minor revision) (love.getVersion))

{:draw (fn draw [message]
         (local canvas (love.graphics.getCanvas))
         (local w (canvas:getWidth))
         (love.graphics.printf "Shelter Creek" 0 10 w :center)
         (love.graphics.printf "Press any key to start" 0 30 w :center))
 ;; :update (fn update [dt set-mode]
 ;;           (if (< counter 65535)
 ;;               (set counter (+ counter 1))
 ;;               (set counter 0))
 ;;           (incf time dt)
 ;;           (when (> time 3)
 ;;             (love.event.quit)))
 :keypressed (fn keypressed [key set-mode]
               (set-mode :mode-game))}
