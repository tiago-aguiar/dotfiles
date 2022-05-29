;; M-x: describe-function command
;; C-h v: describe-variable

(setq inhibit-startup-message t) ;; disable splash screen
(scroll-bar-mode -1)             ;; disable scroll bar
(tool-bar-mode -1)               ;; disable toolbar 
(menu-bar-mode -1)               ;; disable menubar
(setq visible-bell t)            ;; flash screen hit end line

;; change font (height = percent)
(set-face-attribute 'default nil :font "Fira Code Retina" :height 120)

;; (load-theme 'wheat-grass) ;; load a theme

;; make ESC quit
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; initialize package sources
(require 'package)

;; set new package repositories
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")
			 ("elpa"  . "https://elpa.gnu.org/packages")))


(package-initialize)

;; check new packages
(unless package-archive-contents
  (package-refresh-contents))

;; initialize use-package if not exists
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; enable use-package
(require 'use-package)
(setq use-package-always-ensure t)

;; package to search in file
(use-package swiper)

;; vertical interactive for completion mechanism
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)              ;; search in file
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)        ;; done
	 ("C-l" . ivy-alt-done)        ;; done
	 ("C-j" . ivy-next-line)       ;; move-down
	 ("C-k" . ivy-previous-line)   ;; move-up
	 :map ivy-switch-buffer-map
	 ("C-j" . ivy-next-line)      
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-switch-buffer-kill) ;; delete buffer
	 )
  
  :config
  (ivy-mode 1))
