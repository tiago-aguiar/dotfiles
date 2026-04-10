(deftheme taguiar-light
  "taguiar-light theme")

(custom-theme-set-faces
 'taguiar-light
  '(default ((t (:background "white" :foreground "black"))))

  '(mode-line ((t (:background "black" :foreground "white"))))
  '(mode-line-inactive ((t (:background "white" :foreground "black"))))
  '(mode-line-buffer-id ((t (:background "black" :foreground "white"))))
  '(mode-line-mousable ((t (:background "white" :foreground "black"))))
  '(mode-line-mousable-minor-mode ((t (:background "black" :foreground "wheat"))))
 

  '(font-lock-builtin-face        ((t (:foreground "RosyBrown4"))))
  '(font-lock-constant-face       ((t (:foreground "DarkGoldenrod4"))))
  '(font-lock-function-name-face  ((t (:foreground "DarkGoldenrod4"))))
  '(font-lock-variable-name-face  ((t (:foreground "black"))))
  '(font-lock-comment-face        ((t (:foreground "gray50"))))
  '(font-lock-keyword-face        ((t (:foreground "DarkOrchid4"))))
  '(font-lock-preprocessor-face   ((t (:foreground "LightSalmon4"))))
  '(font-lock-type-face           ((t (:foreground "VioletRed4"))))
  '(font-lock-doc-face            ((t (:foreground "gray50"))))
  '(font-lock-string-face         ((t (:foreground "green4"))))
  '(flycheck-error ((t (:background "red3" :foreground "wheat1"))))
  '(ivy-current-match ((t (:background "black" :foreground "white"))))
  '(ivy-subdir         ((t (:foreground "DarkOrchid4"))))
  '(button ((t (:underline nil :background nil :foreground "LemonChiffon4")))) ; #include string
  '(show-paren-match              ((t (:bold t :foreground "dark cyan"))))

  ;; org-mode
  '(org-done ((t (:foreground "green2" :background "gray20" :weight normal))))
  '(org-todo ((t (:foreground "white" :background "red" :weight normal))))
  '(org-level-1 ((t (:foreground "Purple4" :weight normal))))
  '(org-level-2 ((t (:foreground "black" :weight normal))))
  '(org-level-3 ((t (:foreground "black" :weight normal))))
  '(org-level-4 ((t (:foreground "black" :weight normal))))
  '(org-todo ((t (:foreground "red" :weight normal))))
  '(org-headline-todo ((t (:foreground "red"))))
  '(org-headline-done ((t (:foreground "black"))))

  '(org-block ((t (:background "wheat" :weight normal))))
)

(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'taguiar-light)
;;; taguiar-light-theme.el ends here
