;;; package --- Summary;
;;; Commentary:
;;; Code:
(deftheme taguiar-light
  "taguiar-light theme")

(custom-theme-set-faces
 'taguiar-light
  '(default ((t (:background "white" :foreground "black"))))

  '(font-lock-builtin-face        ((t (:foreground "RosyBrown4"))))
  '(font-lock-constant-face       ((t (:foreground "DarkGoldenrod4"))))
  '(font-lock-function-name-face  ((t (:foreground "DarkGoldenrod4"))))
  '(font-lock-variable-name-face  ((t (:foreground "black"))))
  '(font-lock-comment-face        ((t (:foreground "gray50"))))
  '(font-lock-keyword-face        ((t (:foreground "DarkOrchid4"))))
  '(font-lock-preprocessor-face   ((t (:foreground "LightSalmon4"))))
  '(font-lock-type-face           ((t (:foreground "VioletRed4"))))
  '(font-lock-doc-face            ((t (:foreground "gray50"))))
  '(font-lock-string-face         ((t (:foreground "tan4"))))
  '(flycheck-error ((t (:background "red3" :foreground "wheat1"))))
  '(ivy-current-match ((t (:background "black" :foreground "white"))))
  '(ivy-subdir         ((t (:foreground "DarkOrchid4"))))
  '(button ((t (:underline nil :background nil :foreground "LemonChiffon4")))) ; #include string
  '(show-paren-match              ((t (:bold t :foreground "dark cyan"))))

  ;; org-mode
  '(org-done ((t (:foreground "dark green" :weight bold))))
  '(org-level-1 ((t (:foreground "Purple4" :weight bold))))
  '(org-level-2 ((t (:foreground "green4"  :weight bold))))
  '(org-level-3 ((t (:foreground "Blue1"   :weight bold))))
  '(org-level-4 ((t (:foreground "SpringGreen4" :weight bold))))
  '(org-todo ((t (:foreground "red" :weight bold))))
  '(org-headline-todo ((t (:foreground "red"))))
  '(org-headline-done ((t (:foreground "dark green"))))
)

(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'taguiar-light)
;;; taguiar-light-theme.el ends here

