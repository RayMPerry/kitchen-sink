;; Name: simple-haxe-mode
;; Author: Ray Perry
;; Date: 11/1/19
;; Version: 26.1

(setq haxe-keywords
  '("break" "case" "cast" "catch" "continue" "default" "do" "dynamic" "else" "extern" "false" "final" "for" "if" "in" "inline" "macro" "new" "null" "return" "switch" "this" "throw" "true" "try" "var" "while"))

(setq haxe-literals
  '("abstract" "class" "enum" "extends" "function" "implements" "import" "interface" "operator" "overload" "override" "package" "private" "public" "static" "typedef" "untyped" "using"))

(setq simple-haxe-highlights
  `((,(regexp-opt haxe-literals 'words) . font-lock-builtin-face)
     (,(regexp-opt haxe-keywords 'words) . font-lock-keyword-face)))

(defvar simple-haxe-mode-map nil "Keymap for `simple-haxe-mode'.")

(cl-defun shm/indent (&optional (indentation-level 2))
  "Indents the line by INDENTATION-LEVEL spaces."
  (interactive)
  (insert (make-string indentation-level ? )))

(progn
  (setq simple-haxe-mode-map (make-sparse-keymap))
  (define-key simple-haxe-mode-map (kbd "RET") 'newline-and-indent)
  (define-key simple-haxe-mode-map (kbd "<tab>") 'shm/indent))

(define-derived-mode simple-haxe-mode fundamental-mode "simple-haxe"
  "Major mode for editing Haxe source code with colors.

\\{simple-haxe-mode-map}"
  (setq font-lock-defaults '(simple-haxe-highlights)))