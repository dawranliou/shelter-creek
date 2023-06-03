(local general (love.audio.newSource "assets/Forest 02.ogg" "stream"))
(local cave (love.audio.newSource "assets/Cave 01.ogg" "stream"))
(local sfx-collect (love.audio.newSource "assets/sfx.mid" "static"))
;; (local general (love.audio.newSource "assets/forest_02.mid" "stream"))
;; (local cave (love.audio.newSource "assets/cave_01.mid" "stream"))
(general:setVolume 0.5)
(cave:setVolume 0.5)
(sfx-collect:setVolume 0.1)

(local tracks {:general general
               :cave cave})
(local sfxs {:collect sfx-collect})

(fn play-track [key]
  (each [k t (pairs tracks)]
    (if (= k key)
        (when (not (t:isPlaying)) (love.audio.play t))
        (love.audio.stop t))))

(fn stop-all-tracks []
  (each [_ t (pairs tracks)]
    (love.audio.stop t)))

(fn sfx [key]
  (let [track (. sfxs key)]
    (love.audio.play track)))

{: play-track
 : stop-all-tracks
 : sfx}
