(let ((ignored-paths '("./" "../" ".git/" "node_modules/")))
  (labels ((print-file (directory-pathname)
             (if (map nil (lambda (ignored-path)
                             (let ((current-directory-name (car (last (pathname-directory directory-pathname)))))
                               (print ignored-path)
                               (print current-directory-name)
                               (unless (eq current-directory-name :UP)
                                 (or (search ignored-path current-directory-name))
                                 (eql ignored-path current-directory-name)))) ignored-paths) (return))
               (format t "~A~%" directory-pathname)
               (let ((files (uiop:directory-files directory-pathname)))
                 (dolist (file files)
                   (format t "~A~A~:[~;~:*.~A~]~%"
                           directory-pathname
                           (pathname-name file)
                           (pathname-type file))))))
    (uiop:collect-sub*directories "../" t t #'print-file)))
