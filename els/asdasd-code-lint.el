;; (use-package auto-fix)

(use-package flymake

  :straight (:type built-in)                         ;cuz of eglot [2025-08-08 17:38]
  :custom (elisp-flymake-byte-compile-load-path load-path))

(use-package flycheck
  :config )
