(use-package web-mode
  :straight t
  )

(require 'seq)
;; (require 'pp)

(use-package enlive
   :straight t
  )

(defun ar/scrape-links-from-clipboard-url (url)
  "Scrape links from clipboard URL and return as a list. Fails if no URL in clipboard."
  
  (thread-last (enlive-query-all (enlive-fetch url) [a])
               (mapcar (lambda (element)
                         (string-remove-suffix "/" (enlive-attr element 'href))))
               (seq-filter (lambda (link)
                             (and (string-prefix-p "http" link)
                                 (string-suffix-p "mid" link))))
               (seq-uniq)
               (seq-sort (lambda (l1 l2)
                           (string-lessp (replace-regexp-in-string "^http\\(s\\)*://" "" l1)
                                         (replace-regexp-in-string "^http\\(s\\)*://" "" l2))))))

;; (pp (ar/scrape-links-from-clipboard-url "https://commons.wikimedia.org/w/index.php"))

(defun ar/view-completing-links-at-url (url)
  "Scrape links from clipboard URL and open all in external browser."
  (interactive "Murl: ") 
  (browse-url (completing-read "links: "
                               (ar/scrape-links-from-clipboard-url url))))

(use-package simple-httpd
  :straight t)

(use-package skewer-mode
  :after simple-httpd)

(use-package impatient-mode)

(use-package typescript-mode)

(provide 'asdasd-code-web)
