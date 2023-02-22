;;; package --- Summary;
;;; Commentary:
;;; Code:
(deftheme once
  "once theme")

(custom-theme-set-faces
 'once
  '(default ((t (:background "#161616" :foreground "NavajoWhite1"))))
  '(font-lock-builtin-face        ((t (:foreground "NavajoWhite1"))))
  '(font-lock-constant-face       ((t (:foreground "NavajoWhite1"))))
  '(font-lock-function-name-face  ((t (:foreground "YellowGreen"))))
  '(font-lock-variable-name-face  ((t (:foreground "NavajoWhite1"))))
  '(font-lock-comment-face        ((t (:foreground "PeachPuff4"))))
  '(font-lock-keyword-face        ((t (:foreground "YellowGreen"))))
  '(font-lock-preprocessor-face   ((t (:foreground "YellowGreen"))))
  '(font-lock-type-face           ((t (:foreground "NavajoWhite2"))))
  '(font-lock-doc-face            ((t (:foreground "DimGray"))))
  '(font-lock-string-face         ((t (:foreground "snow3"))))
  '(show-paren-match              ((t (:bold t :foreground "spring green"))))
)

(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'once)
;;; once-theme.el ends here

