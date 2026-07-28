

(use-package recentf
  :custom (recentf-save-file (expand-file-name "recentf-save.el" asdasd-globals-cache-dir))
  :config (recentf-mode))

(use-package savehist
  :custom (savehist-file (expand-file-name "savehist.el" asdasd-globals-cache-dir))
  :config
  (savehist-mode 1)
  (setq savehist-additional-variables '(kill-ring
                                        recentf-list
                                        search-ring
                                        regexp-search-ring
                                        org-capture--prompt-history
                                        org-id-locations
                                        org-mem--dir<>bare-files
                                        org-mem--id<>entry
                                        org-mem--file<>entries
                                        org-mem--id<>roam-refs                       
                                        org-mem--internal-entry-id<>links            
                                        org-mem--key<>subtable                       
                                        org-mem--roam-ref<>id                        
                                        org-mem--roam-ref<>type                      
                                        org-mem--target<>links                       
                                        org-mem--title<>id                           
                                        org-mem--truename<>content                   
                                        org-mem--truename<>entries                   
                                        org-mem--truename<>metadata                  
                                        org-mem--wild-filename<>truename             
                                        org-mem-updater--id-or-ref-target<>old-links)))
