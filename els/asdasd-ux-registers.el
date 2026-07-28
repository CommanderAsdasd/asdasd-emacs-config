(require 'cl-lib)

(require 'consult)

(defvar my/window-registers (make-hash-table :test 'equal))

(defun my--hash-values (ht)
  (let (vals)
    (maphash (lambda (_k v) (push v vals)) ht)
    vals))

(defun my--free-register ()
  (let ((used (my--hash-values my/window-registers)))
    (cl-loop for c from ?a to ?z
             unless (memq c used)
             return c)))

(defun my/save-window-config (name)
  (let ((reg (my--free-register)))
    (unless reg (error "No free registers"))
    (window-configuration-to-register reg)
    (puthash name reg my/window-registers)))

(defun my/load-window-config (name)
  (let ((reg (gethash name my/window-registers)))
    (unless reg (error "Unknown window config: %s" name))
    (jump-to-register reg)))

(defun my--hash-keys (ht)
  (let (keys)
    (maphash (lambda (k _v) (push k keys)) ht)
    (nreverse keys)))

(defun my/consult-window-config ()
  (interactive)
  (let* ((names (my--hash-keys my/window-registers))
         (choice (consult--read names
                                :prompt "Window config: "
                                :require-match nil
                                :sort nil)))
    (if (member choice names)
        (my/load-window-config choice)
      (my/save-window-config choice))))

(defun my/consult-delete-window-config ()
  (interactive)
  (let* ((names (my--hash-keys my/window-registers))
         (choice (consult--read names
                                :prompt "Delete window config: "
                                :require-match t
                                :sort nil)))
    (remhash choice my/window-registers)))

(defun my/consult-rename-window-config ()
  (interactive)
  (let* ((names (my--hash-keys my/window-registers))
         (old (consult--read names
                             :prompt "Rename window config: "
                             :require-match t
                             :sort nil))
         (reg (gethash old my/window-registers))
         (new (consult--read names
                             :prompt (format "Rename '%s' to: " old)
                             :require-match nil
                             :sort nil)))
    (unless reg (error "Unknown window config: %s" old))
    (when (and (gethash new my/window-registers) (not (equal new old)))
      (error "Name already exists: %s" new))
    (remhash old my/window-registers)
    (puthash new reg my/window-registers)))

(defun my/consult-save-window-config ()
  (interactive)
  (let* ((names (my--hash-keys my/window-registers))
         (choice (consult--read names
                                :prompt "Save window config: "
                                :require-match nil
                                :sort nil)))
    (if (gethash choice my/window-registers)
        (let ((reg (gethash choice my/window-registers)))
          (window-configuration-to-register reg))
      (my/save-window-config choice))))


;; (my/save-window-config "coding")
;; (my/save-window-config "org-review")
;; (my/load-window-config "coding")

