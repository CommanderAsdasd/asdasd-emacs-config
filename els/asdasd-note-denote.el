(use-package denote
  :hook (dired-mode . denote-dired-mode)
  :bind-keymap
  :bind*
  (
   ("C-c n n" . denote)
   ("C-c n r" . denote-rename-file)
   ("C-c n l" . denote-link)
   ("C-c n b" . denote-backlinks)
   ("C-c n d" . denote-dired)
   ("C-c n g" . denote-grep))
  :config
  (setq denote-directory (expand-file-name "~/howm/")))
