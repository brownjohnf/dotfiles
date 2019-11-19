(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-completion-style (quote emacs))
 '(package-selected-packages
   (quote
    (flycheck-inline flycheck-rust fill-column-indicator zenburn-theme helm-projectile projectile flycheck go-mode rust-mode helm dracula-theme evil))))
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

;; If we hit an error, enable debug. This is useful for
;; debugging this file, and probably doesn't work for other langs
(setq-default debug-on-error 1)

;; EVIL
;; Set up EVIL first, so that if anything goes wrong the vim bindings
;; are working, at least
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)
(define-key evil-normal-state-map (kbd "SPC n") 'jack-flycheck-next-error)
(define-key evil-normal-state-map (kbd "SPC N") 'flycheck-list-errors)
(define-key evil-normal-state-map (kbd "g e") 'flycheck-error-list-goto-error)

;; Theme stuff
(load-theme 'zenburn t)

;; General, built-in settings and keybinding mods

;; Follow symlinks to source-controlled repos, but warn
(setq-default vc-follow-symlinks nil)

;; Consider underscores part of a single word
(modify-syntax-entry ?_ "w")

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

;; Enable line numbers
(global-display-line-numbers-mode)

;; Projectile
(setq projectile-project-search-path '("~/" "~/workspace/" "/data"))
(projectile-global-mode)
(projectile-mode +1)

;; Helm
(require 'helm-config)
(helm-mode 1)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)

;; Flycheck
(add-hook 'after-init-hook 'global-flycheck-mode)
(defun jack-flycheck-next-error(&optional n)
  (interactive)
  (evil-goto-first-line)
  (flycheck-next-error))
(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

;; Go
(add-hook 'go-mode-hook 'lsp-deferred)
(add-hook 'go-mode-hook 'gofmt-before-save)
(add-hook 'go-mode-hook
          (lambda
            (define-key evil-normal-state-map (kbd "g d") 'godef-jump)
            (define-key evil-normal-state-map (kbd "g D") 'godef-jump-other-window)))

;; Rust
(add-hook 'rust-mode-hook 'rust-enable-format-on-save)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
