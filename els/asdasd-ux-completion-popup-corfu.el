(use-package popup
  :config )

(use-package corfu
  :custom
  (corfu-cycle t)                  ; Allows cycling through candidates
  (corfu-auto nil)                   ; Enable auto completion
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.1)
  (corfu-popupinfo-delay '(0.4 . 0.2))
  (corfu-preview-current 'insert)   ; Do not preview current candidate
  (corfu-preselect-first nil)
  (corfu-on-exact-match nil)       ; Don't auto expand tempel snippets
  :straight t
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode))

use-package-verbose
