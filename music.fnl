(local general (love.audio.newSource "assets/Forest 02.ogg" "stream"))
(local cave (love.audio.newSource "assets/Cave 01.ogg" "stream"))
;; (local general (love.audio.newSource "assets/forest_02.mid" "stream"))
;; (local cave (love.audio.newSource "assets/cave_01.mid" "stream"))
(general:setVolume 0.5)
(cave:setVolume 0.5)

(local tracks {:general general
               :cave cave})

(fn play-track [key]
  (each [k t (pairs tracks)]
    (if (= k key)
        (when (not (t:isPlaying)) (love.audio.play t))
        (love.audio.stop t))))

(fn stop-all-tracks []
  (each [_ t (pairs tracks)]
    (love.audio.stop t)))

{: general
 : cave
 : play-track
 : stop-all-tracks}
