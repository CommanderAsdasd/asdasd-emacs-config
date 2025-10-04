(require 's)

(use-package path-helper)


(defun asdasd-os-path-windize-region ()
  "turn path to win"
  (interactive)
  (let* ((buffer-substring-no-properties (region-beginning) (region-end))
         (string-path (asdasd-os-path-windize )))
    (delete-region (region-beginning) (region-end))
    (insert string-path)))

(defun asdasd-os-path-windize-emacs (&optional path)
  ""
  (interactive "MPath:")
  (let ((return-path (s-capitalize (string-replace "/" "\\" path))))
    (if (interactive-p) (kill-new return-path) return-path)))

(defun asdasd-os-path-de-mingwfy-root (&optional path)
  "appends mingw installation dir to trimmed mingw path"
  (interactive "MPath:")
  (let ((return-path (concat "C:/msys64" path)))
    (if (interactive-p) (kill-new return-path) return-path)))

(defun asdasd-os-path-mingwfy-emacs (&optional path)
  "turn windows emacs format into mingw"
  (interactive "MPath:")
  (let ((return-path (concat "/" (string-replace ":" "" (string-replace "\\" "/" path)))))
    (if (interactive-p) (kill-new return-path) return-path)))


;; (kill-new ( (asdasd-os-path-windize "c:/Users/asdasd/Saved Games/xonotic/data/dlcache")))


 ;; [2025-07-05 18:44]+ TODO - make interactive with consult
(defun asdasd-os-path-add-to-path (&optional dir prepend )
  "appends DIR to path. If NOSET then only return resulting path"
  (interactive (list (read-directory-name "add to PATH")))
  (let ((new-path (concat (getenv "PATH") ";" dir)))
    (add-to-list 'load-path dir)
    ;; (if noset new-path ))
    (setenv "PATH" new-path)))

(defun asdasd-os-path-kill-path ()
  ""
  (interactive)
  (kill-new (getenv "PATH"))
  )


(defun asdasd-os-path-current-dir-to-path (dir)
  ""
  (interactive (list default-directory))
  (setenv "PATH" (concat (getenv "PATH") dir)))





(provide 'asdasd-os-path)
