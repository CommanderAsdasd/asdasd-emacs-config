(use-package project
  :straight (:type built-in)
  :config )

(use-package projectile
  :config )

(use-package todo-projectile
  :straight (:host github :repo "WolfeCub/todo-projectile"))


(use-package context-navigator
  :straight (context-navigator
             :type git
             :host github
             :repo "11111000000/context-navigator")
  :commands
  (context-navigator-start
   context-navigator-mode
   context-navigator-sidebar-open
   context-navigator-refresh
   context-navigator-context-load
   context-navigator-context-save
   context-navigator-context-unload)
  :init
  ;; Recommended session defaults
  (setq context-navigator-autoload t   ;; auto-load context on project switch
        context-navigator-autosave t)  ;; autosave after model refresh
  :config
  ;; Enable the global mode and open the sidebar on demand
  (context-navigator-mode 1))