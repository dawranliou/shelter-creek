(local general (love.audio.newSource "assets/Forest 02.ogg" "stream"))
(local cave (love.audio.newSource "assets/Cave 01.ogg" "stream"))

;; (local general (love.audio.newSource "assets/forest_02.mid" "stream"))
;; (local cave (love.audio.newSource "assets/cave_01.mid" "stream"))

(local tracks {:general general
               :cave cave})

(fn play-track [key]
  (let [track (. tracks key)
        other-tracks (icollect [k t (pairs tracks)]
                       (if (not= k key) t))]
    (each [_ t (ipairs other-tracks)]
      (love.audio.stop t))
    (when (not (track:isPlaying))
      (love.audio.play track))))

(fn stop-all-tracks []
  (each [_ t (pairs tracks)]
    (love.audio.stop t)))

{: general
 : cave
 : play-track
 : stop-all-tracks}
