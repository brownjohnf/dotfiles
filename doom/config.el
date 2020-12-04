;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Jack Brown"
      user-mail-address "jack@brownjohnf.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-tlype t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; Consider_underscores_part of a single word
(modify-syntax-entry ?_ "w")

;; Whitespace
;; Show trailing whitespace in files
(setq-default show-trailing-whitespace t)
;; Delete any trailing whitespace prior to save
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Show trailing whitespace and tabs
;;(setq-default whitespace-style '(trailing tabs tab-mark))
;; make indentation commands use space only (never tab character)
(setq-default indent-tabs-mode nil)
;; Display tab width of 2 spaces by default
(setq-default tab-width 2)

;; Column width
(setq-default auto-fill-function 'do-auto-fill)
(setq-default fill-column 80)
(setq-default turn-on-fci-mode t)

(+global-word-wrap-mode)

(after! projectile
  :config
  (setq-default projectile-project-search-path '("~/" "~/workspace/" "/data")))

(add-hook! lsp-ui-mode
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-hover t)
  ;;(setq lsp-ui-peek-mode t)
  ;;(setq lsp-ui-peek-enable t)
  ;;(setq lsp-ui-peek-always-show t)
  (setq lsp-ui-doc-enable t)
(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
)

(add-hook! org-mode
  :config
  (setq-default org-todo-keywords
    '((sequence "TODO(t)" "STARTED(s!)" "BLOCKED(b@/!)" "|" "DONE(d!)"))))

;; This is to avoid poor performance in the rustic lib
(add-hook! rustic-mode
  (setq syntax-propertize-function nil))

;; Disable smartparens because it's very irritating
;;(after! smartparens
;;  (smartparens-global-mode -1))
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;; Use rust-analyzer instead of rls
(setq rustic-lsp-server 'rust-analyzer)

;; Keybindings
(map! :leader
  :desc "Run recipes from Makefile"
  "m" #'+make/run)

