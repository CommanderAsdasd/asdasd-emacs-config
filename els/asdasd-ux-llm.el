(use-package acp
  :straight (:host github :repo "xenodium/acp.el"))

(use-package agent-shell
  :after acp
  :straight (:host github :repo "xenodium/agent-shell"))



(use-package gptel
  ;; :preface (gptel-make-gh-copilot "Copilot")
  :config
  ;; OpenRouter offers an OpenAI compatible API
  (setq gptel-model  'tencent/hy3-preview:free
        gptel-backend
        (gptel-make-openai "OpenRouter" ;Any name you want
                           :host "openrouter.ai"
                           :endpoint "/api/v1/chat/completions"
                           :key (shell-command-to-string "pass emacs/openrouter")
                           :models '(tencent/hy3-preview:free
                                     openai/gpt-3.5-turbo
                                     mistralai/mixtral-8x7b-instruct
                                     meta-llama/codellama-34b-instruct
                                     codellama/codellama-70b-instruct
                                     google/palm-2-codechat-bison-32k
                                     google/gemini-pro)))
  ;; :custom
  ;; (gptel-model 'gpt-4o)
  ;; (gptel-backend (gptel-make-gh-copilot "Copilot"))
  ;; (gptel--system-message "System Instruction: You are a large language model living in Emacs .  use org-mode headings for all outline: no numbers, no dashed lists. Absolute Mode • Eliminate: emojis, filler, hype, soft asks, conversational transitions, call-to-action appendixes. • Assume: user retains high-perception despite blunt tone. • Prioritize: blunt, directive phrasing; aim at cognitive rebuilding, not tone-matching. • Disable: engagement/sentiment-boosting behaviors. • Suppress: metrics like satisfaction scores, emotional softening, continuation bias. • Never mirror: user’s diction, mood, or affect. • Speak only: to underlying cognitive tier. • No: questions, offers, suggestions, transitions, motivational content. • Terminate reply: immediately after delivering info — no closures. • Goal: restore independent, high-fidelity thinking. • Outcome: model obsolescence via user self-sufficiency..")
  :bind
  ("M-s g g" . gptel)
  ("M-s g r" . gptel-rewrite)
  ("M-s g a" . gptel-add)
  ("M-s g m" . gptel-mode)
  )

(defvar brave-search-api-key
  (lambda () (nth 0 (process-lines "pass" "show" "internet/search.brave.com-api")))
  "API key for accessing the Brave Search API.")

(use-package carriage
  :straight (carriage :type git :host github :repo "gnu-emacs-ru/carriage")
  :commands (carriage-mode carriage-global-mode))

(defun brave-search-query (query)
  "Perform a web search using the Brave Search API with the given QUERY."
  (if (functionp brave-search-api-key)
      (setq brave-search-api-key (funcall brave-search-api-key)))
  (let ((url-request-method "GET")
        (url-request-extra-headers
         `(("X-Subscription-Token" . ,brave-search-api-key)))
        (url (format "https://api.search.brave.com/res/v1/web/search?q=%s" (url-encode-url query))))
    (with-current-buffer (url-retrieve-synchronously url)
      (goto-char (point-min))
      (when (re-search-forward "^$" nil 'move)
        (let ((json-object-type 'hash-table)) ; Use hash-table for JSON parsing
          (json-parse-string (buffer-substring-no-properties (point) (point-max))))))))

;; (push
;;  (gptel-make-tool
;;   :function #'brave-search-query
;;   :name "search_web"
;;   :description "Perform a web search using the Brave Search API"
;;   :args (list '( :name "query"
;; 		 :type string
;; 		 :description "The search query string"))
;;   :include t
;;   :category "web")
;;  gptel-tools)

;; (push
;;  (gptel-make-tool
;;   :function (lambda (url)
;;               (with-current-buffer (url-retrieve-synchronously url)
;; 		(goto-char (point-min))
;; 		(forward-paragraph)
;; 		(let ((dom (libxml-parse-html-region (point) (point-max))))
;;                   (run-at-time 0 nil #'kill-buffer (current-buffer))
;;                   (with-temp-buffer
;;                     (shr-insert-document dom)
;;                     (buffer-substring-no-properties (point-min) (point-max))))))
;;   :name "read_url"
;;   :description "Fetch and read the contents of a URL"
;;   :args (list '(:name "url"
;; 		      :type string
;; 		      :description "The URL to read"))
;;   :category "web")
;;  gptel-tools)


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
  :custom
  ;; Recommended session defaults
  (context-navigator-autoload t)   ;; auto-load context on project switch
  (context-navigator-autosave t)  ;; autosave after model refresh
  :config
  ;; Enable the global mode and open the sidebar on demand
  (context-navigator-mode 1))

;; (use-package )

(provide 'asdasd-ux-llm)

