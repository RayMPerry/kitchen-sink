(defun print-files-recursively (directory-path traversal-level)
  (let ((ignored-paths '("." ".." ".git" "love" "target" "node_modules" "dist" ".dub"))
         (indentation-width 2))
    (dolist (file (directory-files directory-path))
      (unless (member file ignored-paths)
        (let ((is-directory (f-directory-p (concat directory-path "/" file))))
          (insert
            (propertize
              (concat (make-string (* indentation-width traversal-level) ?\s) file "\n")
              'font-lock-face
              (if is-directory 'font-lock-keyword-face 'font-lock-builtin-face)))
          (when is-directory
            (print-files-recursively
              (concat directory-path "/" file)
              (1+ traversal-level))))))))

(defun prompt-for-path (current-directory)
  "Prompt for CURRENT-DIRECTORY and list files."
  (interactive "sPath to list out: ")
  (kill-buffer "*File Listing*")
  (switch-to-buffer-other-window "*File Listing*")
  (print-files-recursively current-directory 0)
  (special-mode)
  (font-lock-mode))
