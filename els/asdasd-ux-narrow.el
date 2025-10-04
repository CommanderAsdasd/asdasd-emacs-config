(use-package narrow-indirect
  :init (defun asdasd-ux-narrow-ni-to-org-element ()
          ""
          (interactive)
          (org-mark-element)
          
          (ni-narrow-to-region-indirect-other-window (region-beginning) (region-end) 0))
  
  
  :bind* ("C-x n n" . ni-narrow-to-region-indirect-other-window)
  ("C-x n e" . asdasd-ux-narrow-ni-to-org-element)
  ("C-x n E" . org-narrow-to-element))


(use-package float-narrow-indirect
  :straight (:host github :repo "yibie/float-narrow-indirect"))


