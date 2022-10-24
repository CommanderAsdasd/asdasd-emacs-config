;; (modular-)

(general-define-key
 :states '(normal visual insert emacs)
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "r" '(rgrep :which-key "rgrep")
 "e" '(end-of-buffer :which-key "go buffer end")
 "f" '(asdasd-hydra-frames/body :which-key "frame")
 "t" '(beginning-of-buffer :which-key "go buffer top")
  "'" '(iterm-focus :which-key "iterm")
  "?" '(iterm-goto-filedir-or-home :which-key "iterm - goto dir")
  "/" '(counsel-ag :wich-key "ag")
  "TAB" '(ivy-switch-buffer :which-key "prev buffer")
  "." '(avy-goto-word-or-subword-1  :which-key "go to word")
  "SPC" '(counsel-M-x :which-key "M-x")
  "a" '(hydra-launcher/body :which-key "Applications")
  "b" '(asdasd-hydra-buffer/body t :which-key "Buffer")
  "c" '(:ignore t :which-key "Comment")
  "cl" '(comment-or-uncomment-region-or-line :which-key "comment line")
  "w" '(hydra-window/body :which-key "Window")
  "F" '(:ignore t :which-key "Files")
  "fd" '(counsel-git :which-key "find in git dir")
  )
(defhydra asdasd-hydra-buffer (:color blue :columns 3)
  "
  Buffers :
  "
  ("n" next-buffer "next" :color red)
  ("b" ivy-switch-buffer "switch")
  ("B" ibuffer "ibuffer")
  ("p" previous-buffer "prev" :color red)
  ("C-b" buffer-menu "buffer menu")
  ("N" evil-buffer-new "new")
  ("d" kill-this-buffer "delete" :color red)
  ;; don't come back to previous buffer after delete
  ("D" (progn (kill-this-buffer) (next-buffer)) "Delete" :color red)
  ("s" save-buffer "save" :color red))

(defhydra asdasd-hydra-frames (:color green  :columns 3)
  "frames:"
  ("n" make-frame "make new frame" :color red)
  )
