(use-package cheatsheet
:config
  (cheatsheet-add          
               :group 'Common
                :key "C-x C-c"
                :description "leave Emacs.")
  (cheatsheet-add :group 'Test
                :key "test"
                :description "leave Emacs.")               
  
  :bind (:map mq-map
              ("c" . cheatsheet-show)
         )
           )
  

(provide 'asdasd-cheatsheet)
