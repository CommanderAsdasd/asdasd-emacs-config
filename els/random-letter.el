(defun rand-letter (arg)
  (interactive "P")
  (if arg (self-insert-command arg (seq-random-elt (number-sequence 99 122)))
    (self-insert-command 1 (seq-random-elt (number-sequence 99 122))))
  )

lexems valid used processing output number-sequence header causes java-snippets when

(general-define-key "M-q M-l" 'rand-letter)
