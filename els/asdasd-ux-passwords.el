;; (use-package pass)                      ; old and crude
;; (require 'auth-source)

;; (setq auth-sources
;;       '("~/.authinfo"
;;         "~/.authinfo.gpg"))

;; (use-package auth-source-pass
;;   :straight (:type built-in)
;;   :config
;;   (auth-source-pass-enable))

;; (use-package password-menu)

(use-package password-store
  :custom (password-store-executable "pass"))