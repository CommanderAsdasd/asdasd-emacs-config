; Upon drag-and-drop to a frame (OSX window): Find the file in the frame,
;   with shift: insert filename(s), space-separated;
;   with control: insert filename(s) as lines, repeating the beginning of the line;
;   with meta: insert file contents
                                        ; note that the emacs window must be activated (CMD-TAB) for the modifiers to register
;; <S-drag-n-drop>

(global-set-key (kbd "C-c h") 'highlight-symbol)
(global-set-key (kbd "C-c C-n") 'highlight-symbol-next)

(use-package bookmark-view
  :ensure t)

(use-package workgroups2)

(require 'asdasd-ux-keys)
(provide 'asdasd-ux)
