(deftheme taguiar-retro
  "taguiar retro theme")

(custom-theme-set-faces
 'taguiar-retro
  '(default ((t (:background "#292929" :foreground "bisque1"))))
  '(font-lock-comment-face ((t (:foreground "gold1"))))
  '(font-lock-string-face ((t (:foreground "Gray"))))
  '(font-lock-builtin-face ((t (:foreground "white"))))
  '(font-lock-keyword-face ((t (:foreground "GhostWhite"))))
  '(font-lock-function-name-face ((t (:bold t :foreground "white"))))
  '(font-lock-variable-name-face ((t (:foreground "LightYellow"))))
  '(font-lock-type-face ((t (:foreground "DarkSeaGreen2"))))
  '(font-lock-doc-face ((t (:foreground "Grey40"))))
  '(font-lock-preprocessor-face ((t (:foreground "#baddbc"))))
  '(font-lock-contant-face ((t (:foreground "Yellow"))))
  ;;'(show-paren-match ((t (:bold t :foreground "Green"))))
  '(show-paren-match ((t (:background "blue"))))
  '(show-paren-mismatch ((((class color)) (:background "red" :foreground "white"))))
  (set-face-attribute 'region nil :background "blue3")

)

(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'taguiar-retro)
