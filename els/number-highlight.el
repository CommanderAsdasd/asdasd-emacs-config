(define-minor-mode number-highlight-mode
  "Minor mode for highlighting numbers."
  nil "" nil
  (font-lock-remove-keywords nil number-highlight-keywords)
  (when font-lock-mode
    (font-lock-fontify-buffer))
  (when number-highlight-mode
    (font-lock-add-keywords nil number-highlight-keywords)))

(defconst number-highlight-keywords
  '(("\\(\\b[-+]?[0-9]*\\.?[0-9]+(?:[eE][-+]?[0-9]+)?\\b\\)" 
     1 font-lock-warning-face prepend)))

(provide 'number-highlight)

