;; (use-package number-highlight
;;   :config )

(require 'number-highlight)

(use-package rainbow-delimiters)
(use-package color-identifiers-mode)

(use-package region-occurrences-highlighter)

(use-package highlight-symbol)



(use-package rainbow-blocks-bg
  :straight (:repo "https://github.com/seanirby/rainbow-blocks-bg"))

(use-package idle-highlight-mode
  :custom)

(use-package idle-highlight-mode
  :config )

(use-package prism
  :config )

(defun asdasd-ui-highlight-region (face)
  (interactive (list (read-face-name "Choose face for highlighting: ")))
  (when (use-region-p)
    (let ((region-text (buffer-substring-no-properties (region-beginning) (region-end))))
      (highlight-phrase region-text face))))