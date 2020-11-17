;;; init.el --- An Emacs config file

;;; Commentary: My config.

;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("cdb4ffdecc682978da78700a461cdc77456c3a6df1c1803ae2dd55c59fa703e3" "947190b4f17f78c39b0ab1ea95b1e6097cc9202d55c73a702395fc817f899393" default)))
 '(global-company-mode t)
 '(helm-completion-style (quote emacs))
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(org-agenda-files (list org-directory))
 '(org-directory "~/org")
 '(package-selected-packages
   (quote
    (helm-ag vimrc-mode ox-pandoc treemacs-projectile treemacs-evil dracula-theme git-gutter protobuf-mode ace-window dockerfile-mode cargo magit taskrunner company-lsp company ox-slack yaml-mode htmlize spacemacs-theme helm-spotify ox-gfm evil-org lsp-ui yasnippet lsp-mode which-key flycheck-inline flycheck-rust fill-column-indicator helm-projectile projectile flycheck go-mode rust-mode helm dracula-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Fetch the list of packages in archive unless it's present
(unless package-archive-contents
    (package-refresh-contents))

;; Install any missing packages
(dolist (package package-selected-packages)
  (unless (package-installed-p package)
    (package-install package)))
(package-autoremove)

;; If we hit an error, enable debug. This is useful for
;; debugging this file, and probably doesn't work for other langs
(setq-default debug-on-error 1)

;; EVIL
;; Set up EVIL first, so that if anything goes wrong the vim bindings
;; are working, at least
(require 'evil)
(evil-mode 1)
;; Enable pasting from ctrl-c in X
(setq-default x-select-enable-clipboard t)
;; Enable pasting from highlighting text with the mouse in X
(setq-default x-select-enable-primary t)
;; Disable evil in term-mode
(dolist (mode '(term-mode))
  (add-to-list 'evil-emacs-state-modes mode))
(define-key evil-normal-state-map (kbd "C-s") 'shell)

;; Theme stuff
(load-theme 'spacemacs-dark t)

;; General, built-in settings and keybinding mods

;; Update PATH to find tools that we use. This was fixed by putting the right
;;paths in ~/.zshenv. Leaving this here in case I need to add something in the
;; future.
;;(setenv "PATH" (concat (getenv "PATH") ":~/dotfiles/bin"))
;;(dolist (dir '("~/dotfiles/bin/", "~/go/bin"))
;;  (add-to-list 'exec-path dir))

;; Disable gui cruft
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Always show (line,col) position in status bar
(column-number-mode 1)

;; Follow symlinks to source-controlled repos, but warn
(setq-default vc-follow-symlinks nil)

;; Consider underscores part of a single word
(modify-syntax-entry ?_ "w")

;; Auto-scroll compilation buffer
(setq-default compilation-scroll-output t)

;; Jump to a terminal
(global-set-key (kbd "C-c t") 'term)

;; Whitespace
;; Show trailing whitespace in files
(setq-default show-trailing-whitespace t)
;; Delete any trailing whitespace prior to save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Show trailing whitespace and tabs
(setq-default whitespace-style '(trailing tabs tab-mark))
;; make indentation commands use space only (never tab character)
(setq-default indent-tabs-mode nil)
;; Display tab width of 2 spaces by default
(setq-default tab-width 2)

;; Column width
(setq-default auto-fill-function 'do-auto-fill)
(setq-default fill-column 80)
(require 'fill-column-indicator)
(turn-on-fci-mode)

;; Search customization
(setq lazy-highlight-cleanup nil)
(setq lazy-highlight-max-at-a-time nil)
(setq lazy-highlight-initial-delay 0)

;; Enable line numbers
(global-display-line-numbers-mode)

;; Treemacs
(define-key evil-normal-state-map (kbd "C-n") 'treemacs)

;; Auto-complete
(add-hook 'after-init-hook 'global-company-mode)
(setq-default company-idle-delay 1)
(setq-default company-minimum-prefix-length 0)
(setq-default company-tooltip-limit 50)
(setq-default company-show-numbers t)

;; Projectile
(setq-default projectile-project-search-path '("~/" "~/workspace/" "/data"))
(projectile-mode)
(projectile-mode +1)

;; Helm
(require 'helm-config)
(helm-mode 1)
(setq-default projectile-completion-system 'helm)
(helm-projectile-on)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile-find-file)
(define-key evil-normal-state-map (kbd "M-p") 'helm-projectile-switch-project)
(define-key evil-normal-state-map (kbd "?") 'helm-projectile-ag)

;; Ace-window
(define-key evil-normal-state-map (kbd "C-w C-w") 'ace-window)
(define-key evil-normal-state-map (kbd "C-w d") 'ace-delete-window)

;; Enable keybinding hinting
(which-key-mode)

;; Flycheck
(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))
(setq-default flycheck-display-errors-delay 0)
(define-key evil-normal-state-map (kbd "SPC n") 'flycheck-next-error)
(define-key evil-normal-state-map (kbd "SPC N") 'flycheck-previous-error)
(add-hook 'after-init-hook 'global-flycheck-mode)

;; LSP
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-peek-enable t)
(setq lsp-ui-peek-always-show t)
(define-key evil-normal-state-map (kbd "g d") 'lsp-ui-peek-find-definitions)
(define-key evil-normal-state-map (kbd "g D") 'lsp-ui-peek-find-references)

;; Go
(setq gofmt-command "goimports")
(add-hook 'go-mode-hook 'lsp-deferred)
(with-eval-after-load 'go-mode
  (add-hook 'before-save-hook #'gofmt-before-save))

;; Rust
(add-hook 'rust-mode-hook 'rust-enable-format-on-save)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook 'lsp-deferred)
;; This adds some integration via flycheck-rust with cargo and project
;; layouts, etc.
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; Org-mode configs
(eval-after-load "org"
  '(require 'ox-gfm nil t))
(setq-default org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s!)" "BLOCKED(b@/!)" "|" "DONE(d!)")))

;; Active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)))
;; Don't prompt prior to running code blocks
(setq-default org-confirm-babel-evaluate nil)
(add-hook 'org-mode-hook #'toggle-word-wrap)
(defun org-config-fill-prefix ()
  "Set `fill-prefix' to the empty string."
  (setq fill-prefix ""))
(add-hook 'org-mode-hook #'org-config-fill-prefix)

(setq-default org-export-initial-scope 'buffer)
(setq-default org-M-RET-may-split-line nil)
(require 'evil-org-agenda)
(with-eval-after-load 'evil
    (evil-define-key 'normal outline-mode-map (kbd "<tab>") #'org-cycle)
    (evil-define-key 'normal outline-mode-map (kbd "TAB") #'org-cycle))
(evil-org-agenda-set-keys)
(add-hook 'org-mode-hook 'evil-org-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'evil-org-mode-hook
        (lambda ()
            (evil-org-set-key-theme)))
(setq-default org-default-notes-file (concat org-directory "/notes.org"))
(global-set-key (kbd "C-c c") 'org-capture)

;; Custom functions for common tasks
(defun tio-ship-predev ()
  (interactive)
  (compile "cd /home/jackb/workspace/tio/api && make ship && cd ../cli && make ship"))

(defun tio-ship-prod ()
  (interactive)
  (compile "cd /home/jackb/workspace/tio/api && make ship && cd ../cli && make ship"))

;; git-gutter
(global-git-gutter-mode +1)
