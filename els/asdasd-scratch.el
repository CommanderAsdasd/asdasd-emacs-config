(use-package persistent-scratch
  :custom (persistent-scratch-save-file (expand-file-name "persistent-scratch.el" asdasd-globals-cache-dir))
  :config
  (persistent-scratch-save)
  (persistent-scratch-autosave-mode))

