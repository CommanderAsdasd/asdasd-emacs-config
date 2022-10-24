
(use-package hammy
  :ensure t
  ;; :quelpa (hammy :fetcher github :repo "alphapapa/hammy.el")
  )

;; We name the timer with the Unicode TOMATO character, and propertize
;; it with a tomato-colored face.
(hammy-define (propertize "🍅" 'face '(:foreground "tomato"))
  :documentation "The classic pomodoro timer."
  :intervals
  (list
   (interval :name "Work"
             :duration "25 minutes"
             :before (do (announce "Starting work time.")
                         (notify "Starting work time."))
             :advance (do (announce "Break time!")
                          (notify "Break time!")))
   (interval :name "Break"
             :duration (do (if (and (not (zerop cycles))
                                    (zerop (mod cycles 3)))
                               ;; If a multiple of three cycles have
                               ;; elapsed, the fourth work period was
                               ;; just completed, so take a longer break.
                               "30 minutes"
                             "5 minutes"))
             :before (do (announce "Starting break time.")
                         (notify "Starting break time."))
             :advance (do (announce "Break time is over!")
                          (notify "Break time is over!")))))

