(el-get-bundle imdb
    :url "https://github.com/larsmagne/imdb.el"
  )

(use-package telega
  :config
  (setq telega-chat-show-avatars nil)
  (setq telega-root-show-avatars nil)
  (setq telega-photo-show-avatars nil)
  (setq telega-user-show-avatars nil)
  )


(use-package w3m
  :ensure t)


(provide 'asdasd-internet)
