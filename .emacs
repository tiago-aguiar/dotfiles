;; WINDOWS:
;; 1. Copy the .emacs and .emacs.d into c:\
;; 2. Set 'user variable environment': HOME=c:\

;;
;; variables
;;
(setq is-macosx (eq system-type 'darwin))
(setq is-linux (featurep 'x))
(setq is-win32 (not (or is-macosx is-linux)))

(defvar taguiar/themes '(taguiar-light taguiar-dark casey jon))

(setq backup-directory-alist '(("." . "~/.emacs.d/.saves")))
(setq create-lock-files nil)
(setq auto-save-default nil)
(setq gc-cons-threshold (* 1024 1024 100))

(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t)

;;
;; UI
;;
(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode t)
(electric-pair-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode t)
(global-font-lock-mode 1)
(global-visual-line-mode t)
(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

;;
;; custom OS
;;
(when is-macosx
  (message "is-macosx")
  (setq taguiar-todo-file "~/today.org")
  (setq taguiar-sourcekit "/usr/local/bin/sourcekittend")
  (setq taguiar-launchscript "./launch.sh")
  (setq taguiar-makescript "./build.sh")
  (setq exec-path (append exec-path '("~/kotlin/server/bin")))
  (setq mac-command-modifier 'meta)
  (when (member "SF Mono" (font-family-list))
    (message "Loaded SF Mono Font")
    (set-face-attribute 'default nil :font "SF Mono-13" :bold nil)))

(when is-win32
  (message "is-win32")
  (setq taguiar-launchscript "launch.bat")
  (setq taguiar-makescript "build.bat")

  ;; (when (member "Lucida Console" (font-family-list))
    ;; (message "Loaded Lucida Console Font")
    ;; (set-face-attribute 'default nil :font "Lucida Console-11" :bold nil)))

  ;; (when (member "Consolas" (font-family-list))
    ;; (message "Consolas")
    ;; (set-face-attribute 'default nil :font "Consolas-12" :bold nil)))

  (when (member "Fragment Mono" (font-family-list))
    (message "Loaded Fragment Mono Font")
    (set-face-attribute 'default nil :font "Fragment Mono-11" :bold nil)))

;;
;; auto mode
;;
(setq auto-mode-alist
      (append
       '(("\\.cpp$"    . c++-mode)
         ("\\.h$"      . c++-mode)
         ("\\.c$"      . c++-mode)
         ("\\.cc$"     . c++-mode)
         ("\\.txt$"    . indented-text-mode)
         ("\\.emacs$"  . emacs-lisp-mode)
         ("\\emacs$"   . emacs-lisp-mode)
         ("\\.m$"      . objc-mode)
         ("\\.mm$"     . objc-mode)
         ("\\.env$"    . dotenv-mode)
         ("\\.templ$"  . go-mode)
         ("\\.env.debug$" . dotenv-mode)
         ("\\.env.test$"  . dotenv-mode)
         ) auto-mode-alist))

;;
;; Theme
;;
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/scripts")

(defvar taguiar/current-theme-index 1)
(defun taguiar/cycle-theme ()
  (interactive)
  ;; Descarregar o tema atual
  (mapc #'disable-theme custom-enabled-themes)
  ;; Calcular o próximo índice de tema
  (setq taguiar/current-theme-index (mod (1+ taguiar/current-theme-index) (length taguiar/themes)))
  ;; Carregar o novo tema
  (load-theme (nth taguiar/current-theme-index taguiar/themes) t))

;; Get the current time
(setq current-time (current-time))
(setq current-hour (nth 2 (decode-time current-time)))

;; Set the threshold hour (6 PM in 24-hour format)
(setq threshold-hour 18)

;; Compare the current hour with the threshold hour
(if (>= current-hour threshold-hour)
    (load-theme 'casey t) ;; night
  (load-theme (nth taguiar/current-theme-index taguiar/themes) t)) ;; day

;; if zweilight, force green comments
;; (if (string= (car custom-enabled-themes) "zweilight")
    ;; (progn
      ;; (custom-set-faces

       ;; '(font-lock-doc-face     ((t (:foreground "Green"))))
       ;; '(font-lock-comment-face ((t (:foreground "Green")))))))

;;
;; Todo Highlight
;;
(setq fixme-modes '(emacs-lisp-mode prog-mode c++-mode c-mode objc-mode go-mode))
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-study-face)
(make-face 'font-lock-test-face)
(make-face 'font-lock-important-face)
(make-face 'font-lock-note-face)
(make-face 'font-lock-doing-face)
(mapc (lambda (mode)
 (font-lock-add-keywords
  mode
  '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
    ("\\<\\(STUDY\\)" 1 'font-lock-study-face t)
    ("\\<\\(TEST\\)" 1 'font-lock-test-face t)
    ("\\<\\(IMPORTANT\\)" 1 'font-lock-important-face t)
    ("\\<\\(DOING\\)" 1 'font-lock-doing-face t)
    ("\\<\\(NOTE\\)" 1 'font-lock-note-face t))))
fixme-modes)
(modify-face 'font-lock-fixme-face     "Red"        nil nil t nil t nil nil)
(modify-face 'font-lock-study-face     "Blue"       nil nil t nil t nil nil)
(modify-face 'font-lock-test-face      "Red"        nil nil t nil t nil nil)
(modify-face 'font-lock-important-face "Yellow"     nil nil t nil t nil nil)
(modify-face 'font-lock-note-face      "Dark Green" nil nil t nil t nil nil)
(modify-face 'font-lock-doing-face     "Orange"     nil nil t nil t nil nil)

;;
;; Packages
;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)
(setq use-package-expand-minimally t)

(use-package evil
  :init
  (setq evil-insert-state-cursor '(box "Green"))
  (setq evil-normal-state-cursor '(box "Cyan"))
  :config
  (evil-mode 1))


;; selection color
(set-face-background 'region "transparent")
(set-face-foreground 'region "gray60")

;; IF yasnippet not working, try M-x yas-load-directory
;; IMPORTANT: required!!!
;;  M-x package-install RET yasnippet-snippets
(use-package yasnippet
  :config
  (yas-global-mode 1))

;; language packages
(use-package kotlin-mode)
(use-package markdown-mode)
(use-package swift-mode)
(use-package dotenv-mode)
(use-package go-mode)
(use-package yaml-mode)

(use-package try)
(use-package ag)

;; (use-package lsp-mode
  ;; :disabled t
  ;; :hook (kotlin-mode . lsp-deferred)
  ;; :commands (lsp lsp-deferred))

(use-package ivy
  :config
  (ivy-mode 1)
  (define-key ivy-minibuffer-map    (kbd "C-j") 'ivy-next-line)
  (define-key ivy-minibuffer-map    (kbd "C-k") 'ivy-previous-line)
  (define-key ivy-switch-buffer-map (kbd "C-j") 'ivy-next-line)
  (define-key ivy-switch-buffer-map (kbd "C-k") 'ivy-previous-line)
  (define-key ivy-switch-buffer-map (kbd "C-d") 'ivy-switch-buffer-kill)) 

(use-package org-roam
  :bind (("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n c" . org-roam-capture)
	 ("C-c n p" . org-publish-all)
	 ("C-c n r" . org-roam-db-sync)
	 ("C-c n s" . org-roam-ui-mode)
	 ("C-c n t" . org-roam-tag-add)
	 ("C-c n d" . org-roam-dailies-capture-date)
	 :map org-mode-map
	 ("C-SPC" . completion-at-point))
  :config
  (setq org-roam-directory (file-truename "~/brain"))
  (org-roam-db-autosync-mode))

(setq org-roam-capture-templates
      '(("z" "zettel" plain
         "%?"
         :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+created: %U\n#+filetags: :undefined:\n#+status: #zettel/fleeting\n#+STARTUP: showall indent\n#+OPTIONS: toc:nil num:nil\n* References:\n")
         :unnarrowed t)

	("p" "public post" plain
	 (file "~/brain/templates/public_post.org")
	 :if-new (file+head "%<%Y-%m-%d>-${slug}.org"
			    "")
	 :unnarrowed t)))

(use-package org-roam-ui)

(use-package eglot
  :config
  (setq eldoc-echo-area-use-multiline-p nil)
  (setq eglot-events-buffer-size 0)
  (setq eglot-ignored-server-capabilities '(:hoverProvider :documentHighlightProvider :textDocument/definition))
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'go-mode-hook 'eglot-ensure)
  (add-hook 'objc-mode-hook 'eglot-ensure)
  (add-hook 'python-mode-hook 'eglot-ensure)
  (add-hook 'eglot-managed-mode-hook (lambda ()
				       (eglot-inlay-hints-mode -1))))  ;; disable param hint
(setq eglot-stay-out-of '(idle-change))

(defun conditionally-disable-abbrev ()
  "Disable abbrev when enter at minibuffer."
    (define-key global-map [tab] 'nil)
    (abbrev-mode -1))


(setq org-hide-emphasis-markers t)
(setq org-startup-with-inline-images t)
(setq org-image-actual-width nil)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda ()
                             (org-bullets-mode 1)
			     (setq org-log-done 'time))))

;; Github Flavored Markdown exporter for Org Mode
(use-package ox-gfm
  :ensure t)

(use-package auto-virtualenv
  :ensure t
  :init
  (use-package pyvenv
    :ensure t)
  :config
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv))

(use-package company
  :config
  (add-hook 'c++-mode-hook 'global-company-mode)
  (add-hook 'go-mode-hook 'global-company-mode)
  (add-hook 'objc-mode-hook 'global-company-mode)
  (setq company-minimum-prefix-length 3)
  (setq company-idle-delay 0.0))


;; flymake color - required to be here!
(set-face-attribute 'flymake-error nil   :foreground "red"    :weight 'bold)
(set-face-attribute 'flymake-warning nil :foreground "orange" :weight 'bold)


;; org block color
;; (set-face-attribute 'org-block nil :background
                    ;; (color-darken-name
                     ;; (face-attribute 'default :background) 3))


;;
;; Suggestion on find-file
;;
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;
;; Key Mapping
;;
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-c =")    'align-regexp)
(global-set-key (kbd "C-c w")    'taguiar/build-wiki)
(global-set-key (kbd "C-s")      'ag-project)

(define-key evil-insert-state-map (kbd "C-o") 'yas-expand)

(define-key global-map "\el" 'evil-window-right)
(define-key global-map "\eh" 'evil-window-left)
(define-key global-map "\eL" 'evil-window-move-far-right)
(define-key global-map "\eH" 'evil-window-move-far-left)
(define-key global-map "\e0" 'delete-other-windows)
(define-key global-map "\eb" 'switch-to-buffer)
(define-key global-map "\ek" 'kill-current-buffer)
(define-key global-map "\ed" 'dired)
(define-key global-map "\eo" 'project-find-file)
(define-key global-map "\eF" 'project-find-file)
(define-key global-map "\ef" 'find-file)
(define-key global-map "\es" 'save-buffer)
(define-key global-map "\ei" 'xref-find-definitions)
(define-key global-map "\eu" 'xref-find-references)
(define-key global-map "\em" 'make-without-asking)
(define-key global-map "\eM" 'recompile)
(define-key global-map "\er" 'launch-without-asking)
(define-key global-map "\e/" 'comment-line)
(define-key global-map "\ej" 'imenu)
(define-key global-map "\et" 'shell)
(define-key global-map "\ev" 'evil-window-vsplit)

(define-key global-map [f1]  'load-todo)
(define-key global-map [f2]  'next-error)
(define-key global-map [f5]  'revert-buffer)
(define-key global-map [f6]  'org-publish-all)
(define-key global-map [f8]  'taguiar/cycle-theme)
(define-key global-map [f12] 'eval-buffer)

(define-key eglot-mode-map (kbd "M-<f6>") 'eglot-rename)
(define-key eglot-mode-map (kbd "M-RET") 'eglot-code-action-quickfix)
  
(define-key company-active-map (kbd "C-j") 'company-select-next)
(define-key company-active-map (kbd "C-k") 'company-select-previous)
(define-key company-active-map [tab] 'company-complete-selection)

;;(define-key company-active-map (kbd "SPC") 'company-complete-selection)

;; Function para desativar o Evil mode no shell
(defun disable-evil-mode-in-shell ()
  (when (string-match-p "\\*shell\\*" (buffer-name))
    (turn-off-evil-mode)
    (local-set-key (kbd "<up>") 'comint-previous-input)
    (local-set-key (kbd "<down>") 'comint-next-input)
    ))

(add-hook 'shell-mode-hook 'disable-evil-mode-in-shell)

;;
;; Buffer text completion
;;
;;(abbrev-mode 0)
;; (global-set-key (kbd "C-SPC") 'dabbrev-completion)
;; (global-set-key (kbd "C-SPC") 'completion-at-point)

(define-key global-map [S-tab] 'indent-for-tab-command)
(define-key org-mode-map [S-tab] 'org-cycle)
;(define-key global-map [tab] 'dabbrev-expand)

;; (define-key global-map [tab] 'indent-for-tab-command)

;; Disable temporarily abbrev-mode with TAB when searching from 'counsel-find-file
(add-hook 'minibuffer-setup-hook 'conditionally-disable-abbrev)
(add-hook 'minibuffer-exit-hook (lambda ()
				  (abbrev-mode 1)
				  (define-key global-map [tab] 'dabbrev-expand)))


(defun taguiar/go-hook ()
  (message "Go Hook loaded")
  (c-set-offset 'case-label '+) ; ident switch/case
  (setq tab-width 4))

(defun taguiar/build-wiki ()
  (interactive)
  (org-publish "org-wiki"))



(defun cpp-highlight-if-0/1 ()
  "Modify the face of text in between #if 0 ... #endif."
  (interactive)
  (setq cpp-known-face '(foreground-color . "gray40"))
  (setq cpp-unknown-face 'default)
  (setq cpp-face-type 'dark)
  (setq cpp-known-writable 't)
  (setq cpp-unknown-writable 't)
  (setq cpp-edit-list
        '(
          (#("0" 0 1
             (fontified nil))
           (foreground-color . "gray40")
           nil
           both nil)))
  (cpp-highlight-buffer t))

(defun taguiar/c-hook ()
  "Styling cpp."
  (setq c-basic-offset 4)
  (c-set-offset 'case-label '+) ; ident switch/case
  (setq c-indent-level 4)
  (setq tab-width 4)

  (cpp-highlight-if-0/1)
  (add-hook 'after-save-hook 'cpp-highlight-if-0/1 'append 'local)

  (defun taguiar-header-format ()
     "Format the given file as a header file."
     (interactive)
     (setq BaseFileName (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
     (insert "#ifndef ")
     (push-mark)
     (insert BaseFileName)
     (upcase-region (mark) (point))
     (pop-mark)
     (insert "_H\n")
     (insert "#define ")
     (push-mark)
     (insert BaseFileName)
     (upcase-region (mark) (point))
     (pop-mark)
     (insert "_H\n")
     (insert "//\n")
     (insert "// DEFINITIONS\n")
     (insert "//\n\n")
     (insert "//\n")
     (insert "// MACROS\n")
     (insert "//\n\n")
     (insert "//\n")
     (insert "// PROTOTYPES\n")
     (insert "//\n")
     (insert "#endif // ")
     (push-mark)
     (insert BaseFileName)
     (upcase-region (mark) (point))
     (pop-mark)
     (insert "_H\n"))

  (defun taguiar-source-format ()
     "Format the given file as a source file."
     (interactive)
     (setq BaseFileName (file-name-sans-extension (file-name-nondirectory buffer-file-name))))

  (cond ((file-exists-p buffer-file-name) t)
        ((string-match "[.]h" buffer-file-name)   (taguiar-header-format))
        ((string-match "[.]cpp" buffer-file-name) (taguiar-source-format))))

(add-hook 'c-mode-common-hook 'taguiar/c-hook)
(add-hook 'go-mode-hook 'taguiar/go-hook)

(setq compilation-error-regexp-alist
    (cons '("^\\([0-9]+>\\)?\\(\\(?:[a-zA-Z]:\\)?[^:(\t\n]+\\)(\\([0-9]+\\)) : \\(?:fatal error\\|warnin\\(g\\)\\) C[0-9]+:" 2 3 nil (4))
     compilation-error-regexp-alist))
(setq compilation-directory-locked nil)
(setq compilation-context-lines 0)

(defun find-project-directory-recursive (filepath)
  "Recursively search for a makefile."
  (interactive)
  (message "try find: %s" filepath)
  (if (file-exists-p filepath) t
      (cd "../")
      (find-project-directory-recursive filepath)))

(defun find-project-directory (filepath)
  "Find the project directory."
  (interactive)
  (setq find-project-from-directory default-directory)
  (switch-to-buffer-other-window "*compilation*")
  (if compilation-directory-locked (cd last-compilation-directory)
  (cd find-project-from-directory)
  (find-project-directory-recursive filepath)
  (setq last-compilation-directory default-directory)))

(defun make-without-asking ()
  "Make the current build."
  (interactive)
  (if (find-project-directory taguiar-makescript) (compile taguiar-makescript))
  (other-window 1))

(defun launch-without-asking ()
  "Make the current build."
  (interactive)
  (if (find-project-directory taguiar-launchscript) (compile taguiar-launchscript))
  (other-window 1))

(defun load-todo ()
  "Loading a todo file."
  (interactive)
  (find-file taguiar-todo-file))

(require 'org-export)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bbb3452e71b83fa7c7e1f6da00b086bdd948e86a8ce1125b11c54137aff258f8" "e9f6d29c701a8d786a1cfdd6dd2b4467148030383b1ff08e96e2d285ef496e12" "604197dec66a629e62849ace2dbad825098d9df51a027757d02c8efa50f4e8a9" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
