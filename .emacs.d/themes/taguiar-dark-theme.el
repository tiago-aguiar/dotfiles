;;; package --- Summary;
;;; Commentary:
;;; Code:
(deftheme taguiar-dark
  "taguiar-dark theme")

(custom-theme-set-faces
 'taguiar-dark
  '(default ((t (:background "black" :foreground "burlywood2"))))

  '(mode-line ((t (:background "wheat" :foreground "black"))))
  '(mode-line-buffer-id ((t (:background "wheat" :foreground "black"))))
  '(mode-line-mousable ((t (:background "wheat" :foreground "black"))))
  '(mode-line-mousable-minor-mode ((t (:background "wheat" :foreground "black"))))
 
  '(font-lock-builtin-face        ((t (:foreground "RosyBrown4"))))
  '(font-lock-constant-face       ((t (:foreground "OliveDrab3"))))
  '(font-lock-function-name-face  ((t (:foreground "DarkOliveGreen3"))))
  '(font-lock-variable-name-face  ((t (:foreground "wheat3"))))
  '(font-lock-comment-face        ((t (:foreground "gray50"))))
  '(font-lock-keyword-face        ((t (:foreground "OliveDrab3"))))
  '(font-lock-preprocessor-face   ((t (:foreground "OliveDrab3"))))
  '(font-lock-type-face           ((t (:foreground "RosyBrown4"))))
  '(font-lock-doc-face            ((t (:foreground "DimGray"))))
  '(font-lock-string-face         ((t (:foreground "yellow4"))))
  '(flycheck-error ((t (:background "dark red" :foreground "gray80"))))
  '(ivy-current-match ((t (:background "green" :foreground "black"))))
  '(ivy-subdir         ((t (:foreground "dark cyan"))))
  '(button ((t (:underline nil :background unspecified :foreground "dark khaki")))) ; #include string
  '(show-paren-match              ((t (:bold t :foreground "spring green"))))
)

(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'taguiar-dark)
;;; taguiar-dark-theme.el ends here

