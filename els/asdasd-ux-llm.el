(use-package agent-shell
  :straight (:host github :repo "xenodium/agent-shell"))

(use-package gptel
              :config
              ;; OpenRouter offers an OpenAI compatible API
              (setq gptel-model  'arcee-ai/trinity-large-preview:free
                          gptel-backend
                          (gptel-make-openai "OpenRouter"               ;Any name you want
                                 :host "openrouter.ai"
                                 :endpoint "/api/v1/chat/completions"
                                 :key "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"
                                 :models '(openai/gpt-3.5-turbo
                                           arcee-ai/trinity-large-preview:free
                                           mistralai/mixtral-8x7b-instruct
                                           meta-llama/codellama-34b-instruct
                                           codellama/codellama-70b-instruct
                                           google/palm-2-codechat-bison-32k
                                           google/gemini-pro))))

(use-package carriage
  :straight (carriage :type git :host github :repo "gnu-emacs-ru/carriage"))

(use-package carriage
  :straight nil
  :load-path "d:/git/carriage/lisp"
  :commands (carriage-mode carriage-global-mode))

(provide 'asdasd-ux-llm)

;; (use-package )
