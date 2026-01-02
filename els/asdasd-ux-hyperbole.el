(use-package hyperbole)

(use-package hyperbole
  :straight ()
  :custom
  (hbmap:dir-user howm-directory)
  (hyrolo-file-list `(,howm-keyword-file))
  (hyrolo-date-format "%Y-%m-%d %H:%M:%S"))