(use-package ediff
  :custom ediff-window-setup-function 'ediff-setup-windows-plain)

(defun get-words-from-buffer (buffer)
  "Extract unique words from BUFFER as a hash table."
  (with-current-buffer buffer
    (let ((word-hash (make-hash-table :test 'equal)))
      ;; Split content into words and store in hash table
      (dolist (line (split-string (buffer-string) "\n"))
        (dolist (word (split-string line "[^[:alnum:]]+"))
          (when (> (length word) 0)
            (puthash word t word-hash))))
      word-hash)))

(defun find-common-words (buffer1 buffer2)
  "Find words that exist in both BUFFER1 and BUFFER2.
Returns a hash table of common words."
  (let ((words1 (get-words-from-buffer buffer1))
        (words2 (get-words-from-buffer buffer2)))
    (let ((common-words (make-hash-table :test 'equal)))
      ;; Find intersection of words
      (maphash (lambda (word _)
                 (when (gethash word words2)
                   (puthash word t common-words)))
               words1)
      common-words)))

(defun display-common-words (buffer1 buffer2)
  "Display words common to BUFFER1 and BUFFER2 in a new buffer."
  (interactive "bBuffer 1: \nbBuffer 2: ")
  (let ((common-words (find-common-words buffer1 buffer2)))
    (with-output-to-temp-buffer "*Common Words*"
      (with-current-buffer standard-output
        (insert "Words common to both buffers:\n\n")
        (maphash (lambda (word _) (insert (format "%s\n" word))) common-words)))))

(defun highlight-common-words (buffer1 buffer2)
  "Highlight common words in both BUFFER1 and BUFFER2.
Uses face 'highlight' for highlighting."
  (interactive "bBuffer 1: \nbBuffer 2: ")
  (let ((common-words (find-common-words buffer1 buffer2)))
    (dolist (buf (list buffer1 buffer2))
      (with-current-buffer buf
        (save-excursion
          (goto-char (point-min))
          (deactivate-mark)
          (remove-overlays)
          
          (maphash (lambda (word _)
                    (let ((case-fold-search nil))
                      (while (search-forward word nil t)
                        (overlay-put
                         (make-overlay (match-beginning 0) (match-end 0))
                         'face 'highlight))))
                  common-words))))))
