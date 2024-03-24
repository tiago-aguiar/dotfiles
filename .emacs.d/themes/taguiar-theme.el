
(deftheme taguiar
  "taguiar theme")

(custom-theme-set-faces
 'taguiar
  '(default ((t (:background "#161616" :foreground "bisque1"))))
  ;'(font-lock-comment-face ((t (:foreground "gray40"))))
  '(font-lock-comment-face ((t (:foreground "gold1"))))
  '(font-lock-string-face ((t (:foreground "turquoise1"))))
  '(font-lock-builtin-face ((t (:foreground "white"))))
  '(font-lock-keyword-face ((t (:foreground "GhostWhite"))))
  '(font-lock-function-name-face ((t (:bold nil :foreground "white"))))
  '(font-lock-variable-name-face ((t (:foreground "LightYellow"))))
  '(font-lock-type-face ((t (:foreground "DarkSeaGreen2"))))
  '(font-lock-doc-face ((t (:foreground "turquoise4"))))
  '(font-lock-preprocessor-face ((t (:foreground "DeepPink"))))
  '(font-lock-contant-face ((t (:foreground "Yellow"))))
  '(show-paren-match ((t (:bold nil :foreground "Green"))))
)


(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'taguiar)
