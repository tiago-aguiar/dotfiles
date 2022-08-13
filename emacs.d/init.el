
;; NOTE: Access Desktop files from MacOS: Emacs.app actually launches using a ruby script. As a result, MacOS Catalina uses the permissions set for ruby,
;; not the permissions for Emacs.app. Open General Settings -> Security & Privacy -> Privacy,
;; select Full Disk Access in the left pane, then click + and add /usr/bin/ruby to resolve your issue.

;; M-x:     describe-function command
;; C-h v:   describe-variable
;; C-x C-e: eval last expression

;; list-faces-display:  show colors used
;; list-colors-display: palette colors

;; C-y: Yank emacs
;; C-w: Cut emacs
;; C-x C-; Comment current line
;; C-c C-c Comment block

;; PROJECTILE
;; C-c p: open command map


;; ALT-;     Comment line
;; ALT-s:    save file
;; ALT-k:    kill buffer
;; ALT-b:    switch buffer
;; ALT-f:    find file
;; ALT-hjkl: switch buffer
;; ALT-HL:   swap buffer
;; ALT-SHIFT-O:    find file (projectile)

;; F2:  Open eshell
;; F10: Open init.el
;; F12: Refresh (eval-buffer)

;; C-s: search text in file
;; C-x C-+ : increase font
;; C-x C-- : decrease font
;; C-x C-0 : reset font

;; PROJECTILE
;; C-c p p: Switch to project
;; C-c p f: Find files (inside project dir)

;; EVIL MODE
;; C-w v:      Split vertically
;; C-w q:      Close window
;; C-w hjkl:   Switch to window
;; C-w S-hjkl: Swap window

;

;; global variables
(setq is-macos (eq system-type 'darwin))
(setq is-linux (featurep 'x))
(setq is-win32 (not (or is-macos is-linux)))
(setq emacs-file "~/dotfiles/emacs.d/init.el")
(setq log-file "~/daily.org")
(setq backup-directory-alist `(("." . "~/.saves")))
(setq compilation-scroll-output t)

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

(when is-win32
  (setq taguiar-launchscript "launch.bat")
  (setq taguiar-makescript "build.bat"))

(when is-macos
  (setq mac-command-modifier 'meta) ;; switch Option to Command key (meta)
  (setq taguiar-launchscript "./launch.sh")
  (setq taguiar-makescript "./build.sh"))

(when (not is-macos)
  (setq visible-bell t)) ;; flash screen hit end line

;; change font (height = percent)

(when (member "Inconsolata for Powerline" (font-family-list)) 
 (message "Load Inconsolata")
 (set-face-attribute 'default nil :font "Inconsolata for Powerline" :height 166))

(when (member "Fira Code Retina" (font-family-list))
 (message "Load Fira Code")
 (set-face-attribute 'default nil :font "Fira Code Retina" :height 120))

(when (member "Liberation Mono" (font-family-list)) 
 (message "Load Liberation Mono")
 (set-face-attribute 'default nil :font "Liberation Mono" :height 120))

(when (member "Lucida Console" (font-family-list))
 (message "Load Lucida Console")
  (setq-default line-spacing 1)
  (set-face-attribute 'default nil :font "Lucida Console" :height 140))

;; ;; change yes-no to y-n
(defalias 'yes-or-no-p 'y-or-n-p)

;; startup fullscreen
;; (add-hook 'emacs-startup-hook 'toggle-frame-maximized)

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

;; highlight parentheses
;; (use-package rainbow-delimiters
;;  :hook (prog-mode . rainbow-delimiters-mode))

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

(add-to-list 'custom-theme-load-path (file-name-as-directory "."))

;; load a theme
(load-theme 'taguiar-retro t t)
(enable-theme 'taguiar-retro)

;; run when evil when is ready
(defun rune/evil-hook ()
  (dolist (mode '(custom-mode
		  eshell-mode
		  vterm-mode
		  term-mode))
    (add-to-list 'evil-emacs-state-modes mode))) ;; disable evil-mode for this list modes

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-insert-state-cursor '(box "LightGreen"))
  (setq evil-normal-state-cursor '(box "White"))
  (setq evil-want-C-i-jump nil)
  ;; :hook (evil-mode . rune/evil-hook)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state) ;; return to normal mode
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join) ;; backspace with C-h

  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

;; project management
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom (projectile-completion-system 'ivy)
  :bind-keymap
  ("C-c p" . projectile-command-map))

;; tips for project management
(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package org
  :config
  (setq org-hide-emphasis-markers t))

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package dotenv-mode)

(use-package kotlin-mode)

;; windows does not support vterm, so use standard eshell
(when (not is-win32)
  (use-package vterm))

;; enable line-wrap when is org-mode
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; setup c mode
(defun taguiar/c-hook ()
  (setq c-basic-offset 4)
  (setq c-indent-level 4) 
  (setq tab-width 4)
  (setq indent-tabs-mode nil)

  ; Handle super-tabbify (TAB completes, shift-TAB actually tabs)
  (setq dabbrev-case-replace t)
  (setq dabbrev-case-fold-search t)
  (setq dabbrev-upcase-means-case-search t)
  (abbrev-mode 1)

  (define-key c-mode-map "\t" 'dabbrev-expand)
  (define-key c-mode-map [S-tab] 'indent-for-tab-command)
  (define-key c-mode-map "\C-y" 'indent-for-tab-command)
  (define-key c-mode-map [C-tab] 'indent-region)
  (define-key c-mode-map "	" 'indent-region)
  (define-key c-mode-map "\ej" 'imenu)
  (define-key c-mode-map "\e/" 'c-mark-function)
)

(add-hook 'c-mode-common-hook 'taguiar/c-hook)

(defun insert-timeofday ()
  (interactive "*")
  (insert (format-time-string "* %d/%m/%y: %I:%M%p ===============")))

(defun load-log ()
  (interactive)
  (find-file log-file)
  (end-of-buffer)
  (newline-and-indent)
  (insert-timeofday)
  (end-of-buffer))

;; TODO: try to install emacs 28 for magit 
;; (use-package magit)

;; (use-package evil-magit
;;   :after magit)

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init 'dired))

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

;; make ESC quit
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "<f10>") (lambda () (interactive)
				(find-file emacs-file)
				(message "Opened: %s" (buffer-name))))

(global-set-key (kbd "<f12>") (lambda () (interactive)
				(eval-buffer)
				(message "Refresh: %s" (buffer-name))))

(global-set-key (kbd "<f2>") (lambda () (interactive)
			       (if (not (or is-macos is-linux))
				   (let ((buf (eshell)))
				     (message "Open shell: %s" (buffer-name))
				     (switch-to-buffer (other-buffer buf))
				     (switch-to-buffer-other-window buf))

				 (let ((buf (projectile-run-vterm)))
				   (message "Open vterm: %s" (buffer-name))
				   (switch-to-buffer (other-buffer buf))
				   (switch-to-buffer-other-window buf)))))

(defun launch-app ()
  "Launch the application."
  (interactive)
  (compile taguiar-launchscript)
  (other-window 1))

(setq compilation-directory-locked nil)

(defun find-project-directory-recursive ()
  "Recursively search for a makefile."
  (interactive)
  (if (file-exists-p taguiar-makescript) t
      (cd "../")
      (find-project-directory-recursive)))

(defun find-project-directory ()
  "Find the project directory."
  (interactive)
  (setq find-project-from-directory default-directory)
  (switch-to-buffer-other-window "*compilation*")
  (if compilation-directory-locked (cd last-compilation-directory)
  (cd find-project-from-directory)
  (find-project-directory-recursive)
  (setq last-compilation-directory default-directory)))

(defun make-without-asking ()
  "Make the current build."
  (interactive)
  (if (find-project-directory) (compile taguiar-makescript))
  (other-window 1))


(define-key global-map "\el" 'evil-window-right)
(define-key global-map "\eh" 'evil-window-left)

(define-key global-map "\eL" 'evil-window-move-far-right)
(define-key global-map "\eH" 'evil-window-move-far-left)

(define-key global-map "\es" 'save-buffer)
(define-key global-map "\ek" 'kill-current-buffer)

(define-key global-map "\eb" 'counsel-switch-buffer) ;; OR counsel-ibuffer
(define-key global-map "\eB" 'ivy-switch-buffer-other-window)

(define-key global-map "\ef" 'find-file)
(define-key global-map "\eF" 'find-file-other-window)
(define-key global-map "\eO" 'projectile-find-file)

(define-key global-map "\ed" 'projectile-dired)
(define-key global-map "\eD" 'dired)

(define-key global-map "\em" 'projectile-compile-project)
(define-key global-map "\eM" 'make-without-asking)
(define-key global-map "\en" 'next-error)
(define-key global-map "\eT" 'load-log)

(define-key global-map "\e0" 'delete-other-windows)

(define-key global-map "\eR" 'launch-app)
(define-key global-map "\e;" 'comment-line)
