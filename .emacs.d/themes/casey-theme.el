
(deftheme casey
  "casey theme")

(custom-theme-set-faces
 'casey
  '(default ((t (:background "#161616" :foreground "burlywood3"))))
  '(font-lock-builtin-face        ((t (:foreground "burlywood3"))))
  ;'(font-lock-constant-face       ((t (:foreground "olive drab"))))
  '(font-lock-constant-face       ((t (:foreground "White"))))
  '(font-lock-doc-face            ((t (:foreground "SeaGreen3"))))
  '(font-lock-comment-face        ((t (:foreground "SeaGreen3"))))
  '(font-lock-function-name-face  ((t (:foreground "burlywood3"))))
  '(font-lock-keyword-face        ((t (:foreground "White"))))
  '(font-lock-string-face         ((t (:foreground "olive drab"))))
  '(font-lock-type-face           ((t (:foreground "burlywood3"))))
  '(font-lock-variable-name-face  ((t (:foreground "burlywood3"))))
  '(font-lock-preprocessor-face   ((t (:foreground "burlywood3"))))

  '(show-paren-match              ((t (:bold t :foreground "Cyan"))))
)

(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'casey)
;;; casey-theme.el ends here
