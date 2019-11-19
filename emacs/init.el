;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-refresh-contents)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-completion-style (quote emacs))
 '(package-selected-packages
   (quote
    (zenburn-theme helm-projectile projectile flycheck go-mode dired-k helm dracula-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'after-init-hook 'global-flycheck-mode)

(add-hook 'go-mode-hook 'lsp-deferred)
(add-hook 'go-mode-hook 'gofmt-before-save)

(defun jack-flycheck-next-error(&optional n)
  (interactive)
  (flycheck-list-errors)
  (flycheck-next-error))

(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)
(define-key evil-normal-state-map (kbd "SPC n") 'jack-flycheck-next-error)
(define-key evil-normal-state-map (kbd "SPC N") 'flycheck-list-errors)
(define-key evil-normal-state-map (kbd "g e") 'flycheck-error-list-goto-error)

(setq projectile-project-search-path '("~/" "~/workspace/"))
(projectile-global-mode)
(projectile-mode +1)

(require 'helm-config)
(helm-mode 1)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)

(load-theme 'zenburn t)

(global-display-line-numbers-mode)

;; Per-mode configs
(eval-after-load 'go-mode
    (define-key evil-normal-state-map (kbd "g d") 'godef-jump)
    (define-key evil-normal-state-map (kbd "g D") 'godef-jump-other-window))
