;; M-x:     describe-function command
;; C-h v:   describe-variable
;; C-x C-e: eval last expression

;; list-faces-display:  show colors used
;; list-colors-display: palette colors

;; ALT-s:   save file
;; ALT-k:   kill buffer
;; ALT-b:   switch buffer
;; ALT-B:   switch buffer (new window)
;; ALT-f:   open file
;; ALT-F:   open file (new window)

;; C-y: Yank emacs
;; C-w: Cut emacs

;; F10 - Open init.el
;; F12 - Refresh (eval-buffer)

;; EVIL MODE
;; C-w v:    Split vertically
;; C-w q:    Close window
;; C-w hjkl: Move to window

;; PROJECTILE
;; C-c p: open command map
;; C-c p p: Switch to project
;; C-c p f: Find files

;; TODO: Anotar todos os comandos mais utilizados no workflow

;; global variables
(setq is-macos (eq system-type 'darwin))
(setq is-linux (featurep 'x))
(setq is-win32 (not (or is-macos is-linux)))
(setq emacs-file "~/dotfiles/emacs.d/init.el")

(setq inhibit-startup-message t)         ;; disable splash screen
(setq initial-scratch-message nil)       ;; disable scratch
(setq mouse-wheel-progressive-speed nil) ;; fluid scroll 

(scroll-bar-mode -1)               ;; disable scroll bar
(tool-bar-mode -1)                 ;; disable toolbar 
(menu-bar-mode -1)                 ;; disable menubar
(column-number-mode t)             ;; enable line and column at modeline (bar)
(show-paren-mode t)                ;; enable pair brackets/parentheses
(global-hl-line-mode -1)           ;; disable highlight current line
(display-time)

(when (not is-macos)
  (setq visible-bell t)) ;; flash screen hit end line

;; change font (height = percent)
(when (member "Fira Code Retina" (font-family-list)) 
 (set-face-attribute 'default nil :font "Fira Code Retina" :height 120))

(when (member "Inconsolata for Powerline" (font-family-list)) 
 (set-face-attribute 'default nil :font "Inconsolata for Powerline" :height 180))

;; change yes-no to y-n
(defalias 'yes-or-no-p 'y-or-n-p)

;; startup fullscreen
(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

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

;; highlight parentheses on elisp
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; suggestion for emacs command C-x
(use-package which-key
  :init (which-key-mode)
  :diminish wich-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; tuning for ivy
(use-package counsel
  :bind (("M-x" . counsel-M-x)))

;; documentation for emacs commands
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package modus-themes
  :init
  (setq modus-themes-mode-line '(borderless (padding . 4) (height . 0.9))
        modus-themes-region '(bg-only no-extend))
  (modus-themes-load-themes)
  :config
  (modus-themes-load-vivendi)) ;; OR (modus-themes-load-operandi)

;; (load-theme 'wheat-grass) ;; load a theme
(add-to-list 'custom-theme-load-path (file-name-as-directory "."))
(load-theme 'taguiar t t)
(enable-theme 'taguiar)

;; run when evil is ready
(defun rune/evil-hook ()
  (dolist (mode '(custom-mode
		  eshell-mode
		  term-mode))
    (add-to-list 'evil-emacs-state-modes mode))) ;; disable evil-mode for this list modes

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-insert-state-cursor '(box "green"))
  (setq evil-normal-state-cursor '(box "red"))
  (setq evil-want-C-i-jump nil)
  ;;:hook (evil-mode . rune/evil-hook)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state) ;; return to normal mode
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join) ;; backspace with C-h

  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom (projectile-completion-system 'ivy)
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package counsel-projectile
  :config (counsel-projectile-mode))


;; TODO: try to install emacs 28 for magit 
;; (use-package magit)

;; (use-package evil-magit
;;   :after magit)

;; (use-package evil-collection
;;   :after evil
;;   :config
;;   (evil-collection-init))


;;
;; Bright COMMENTS
;;
(setq fixme-modes '(c++-mode c-mode emacs-lisp-mode))
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-study-face)
(make-face 'font-lock-test-face)
(make-face 'font-lock-important-face)
(make-face 'font-lock-note-face)
(mapc (lambda (mode)
 (font-lock-add-keywords
  mode
  '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
    ("\\<\\(STUDY\\)" 1 'font-lock-study-face t)
    ("\\<\\(TEST\\)" 1 'font-lock-test-face t)
    ("\\<\\(IMPORTANT\\)" 1 'font-lock-important-face t)
           ("\\<\\(NOTE\\)" 1 'font-lock-note-face t))))
fixme-modes)
(modify-face 'font-lock-fixme-face "Red" nil nil t nil t nil nil)
(modify-face 'font-lock-study-face "Blue" nil nil t nil t nil nil)
(modify-face 'font-lock-test-face "#ff00ff" nil nil t nil t nil nil)
(modify-face 'font-lock-important-face "Yellow" nil nil t nil t nil nil)
(modify-face 'font-lock-note-face "Orange" nil nil t nil t nil nil)



(setq mac-command-modifier 'meta) ;; switch Option to Command key (meta)

;; make ESC quit
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "<f10>") (lambda () (interactive)
				(find-file emacs-file)
				(message "Opened: %s" (buffer-name))))

(global-set-key (kbd "<f12>") (lambda () (interactive)
				(eval-buffer)
				(message "Refresh: %s" (buffer-name))))

(define-key global-map "\el" 'evil-window-right)
(define-key global-map "\eh" 'evil-window-left)

(define-key global-map "\es" 'save-buffer)
(define-key global-map "\ek" 'kill-current-buffer)

(define-key global-map "\eb" 'counsel-switch-buffer) ;; OR counsel-ibuffer
(define-key global-map "\eB" 'ivy-switch-buffer-other-window)

(define-key global-map "\ef" 'find-file)
(define-key global-map "\eF" 'find-file-other-window)
