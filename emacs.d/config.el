;;; init.el --- Summary
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t; -*-

(setq gc-cons-threshold (* 50 1000 1000))

;; Disable package.el in favor of straight.el
(setq package-enable-at-startup nil)

(defun customizations/system-settings-get (setting)
  (alist-get setting customizations/system-settings))

(require 'map)

(setq customizations/system-settings
      (map-merge
        'list
        '((desktop/dpi . 180)
          (emacs/default-face-size . 220)
          (emacs/variable-face-size . 245)
          (emacs/fixed-face-size . 200)
          (polybar/height . 35)
          (polybar/font-0-size . 18)
          (polybar/font-1-size . 14)
          (polybar/font-2-size . 20)
          (polybar/font-3-size . 13)
          (dunst/font-size . 20)
          (dunst/max-icon-size . 88)
          (vimb/default-zoom 180)
          (qutebrowser/default-zoom . 200))))

(unless (featurep 'straight))

(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package exec-path-from-shell
  :straight t)

(when (memq window-system '(mac ns x))
(exec-path-from-shell-initialize))

(setq debug-on-error 1)

(use-package dracula-theme
  :straight t
  :init
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (load-theme 'dracula t))

(pcase system-type
  ((or 'gnu/linux 'windows-nt 'cygwin)
   (set-face-attribute 'default nil
		       :font "JetBrains Mono"
		       :weight 'light
		       :height (customizations/system-settings-get 'emacs/default-face-size)))
  ('darwin (set-face-attribute 'default nil :font "Fira Code" :height 170)))

(set-face-attribute 'fixed-pitch nil
	  :font "JetBrains Mono"
	  :weight 'light
	  :height (customizations/system-settings-get 'emacs/fixed-face-size))

(set-face-attribute 'variable-pitch nil
		    :font "JetBrains Mono"
		    :weight 'light
		    :height (customizations/system-settings-get 'emacs/fixed-face-size))

(set-face-attribute 'variable-pitch nil
		    :font "Iosevka Aile"
		    :height (customizations/system-settings-get 'emacs/fixed-face-size)
		    :weight 'light)

(push "~/.emacs.d/customizations" load-path)

(server-start)

(set-default-coding-systems 'utf-8)

(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(dolist (mode '(text-mode-hook
		prog-mode-hook
		conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1)
		   (setq display-line-numbers-type 'relative))))

(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))


(setq display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

(setq large-file-warning-threshold nil)

(setq vc-follow-symlinks t)

(setq ad-redefinition-action 'accept)

(use-package emojify
  :straight t)

(setq display-time-format "%l:%M %p %b %y"
      display-time-default-load-average nil)

(use-package all-the-icons
  :straight t)

(use-package minions
  :straight t)

(use-package doom-modeline
  :straight t
  :init
  (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 15)
  (doom-modeline-bar-width 6)
  (doom-modeline-lsp t)
  (doom-modeline-github nil)
  (doom-modeline-mu4e nil)
  (doom-modeline-minor-modes t)
  (doom-modeline-persp-name nil)
  (doom-modeline-buffer-file-name-style 'truncate-except-project)
  (doom-modeline-major-mode-icon nil))

;; look into doom-modeline-github, it requires ghub and async
(custom-set-faces '(mode-line ((t (:height 0.85))))
		  '(mode-line-inactive ((t (:height 0.85)))))

(use-package diminish
  :straight t)

(use-package super-save
  :straight t
  :custom
  (super-save-auto-mode-when-idle t)
  :init
  (super-save-mode +1)
  (diminish 'super-save-mode))

(setq global-auto-revert-non-file-buffers t)
(global-hl-line-mode 1)
(global-auto-revert-mode 1)

(setq display-time-world-list
      '(("Etc/UTC" "UTC")
	("America/Denver" "Denver")
	("America/Los_Angeles" "Los Angeles")
	("America/New_York" "New York")))
(setq display-time-world-time-format "%a, %d %b %I:%M %p %Z")

(setq-default indent-tabs-mode nil)

;;  (use-package ws-butler
;;    :straight t
;;    :hook
;;    (text-mode . ws-butler-mode)
;;    (prog-mode . ws-butler-mode))

(use-package which-key
  :straight t
  :init
  (diminish 'which-key-mode)
  (which-key-mode)
  :custom (which-key-idle-delay 0.3))

(use-package vterm
    :straight t
    :custom
    (vterm-max-scrollback 100000)
    :bind
    ( :map vterm-mode-map
    ("C-c C-e" . vterm-copy-mode)
    ("C-c C-n" . customizations/vterm-next-prompt)
    ("C-c C-p" . customizations/vterm-previous-prompt)
    ;; Disabled vterm keybindings: (in order to use their global values)
    ("M-m" . nil)
    ("M-u" . nil)
    ("M-j" . nil)
    ("<f1>" . nil)
    ("C-M-s" . nil)
    :map vterm-copy-mode-map
    ("C-c C-e" . vterm-copy-mode)
    ("C-c C-c" . vterm-copy-mode)
;;    ("M-n" . customizations/vterm-next-prompt)
;;    ("M-p" . customizations/vterm-previous-prompt))
    :hook
    (vterm-mode . (lambda () (setq-local global-hl-line-mode nil
                                         show-trailing-whitespace nil)))
    (vterm-mode . hack-dir-local-variables-non-file-buffer)
    (vterm-copy-mode . (lambda ()
                       (call-interactively 'hl-line-mode))))

(use-package projectile
  :straight t
  :custom
  (projectile-auto-discover nil)
  (projectile-project-search-path (directory-files (concat (getenv "HOME") "/Projects") t "[^.]"))
  (projectile-kill-buffers-filter 'kill-only-files)
  :bind*
  ("C-M-t" . customizations/projectile-vterm)
  :hook
  (dashboard-after-initialize . projectile-mode)
  :config
  (defun customizations/projectile-vterm ()
  "Open `vterm' in project root directory."
  (interactive)
  (let* ((default-directory (or (projectile-project-root) default-directory))
         (project-name (projectile-project-name default-directory))
         (buffer-name (format "vterm @%s" project-name))
         (buffer (get-buffer buffer-name)))
    (if (or (not buffer) (eq buffer (current-buffer)))
        (vterm buffer-name)
      (switch-to-buffer buffer)))))

(use-package origami
  :straight t
  :hook (yaml-mode . origami-mode))

(use-package lsp-mode
  :straight t
  :commands lsp
  :hook
  (elisp-mode . lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration))

(use-package lsp-ui
  :straight t
  :after lsp-mode
  :custom
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-update-mode 'line)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-sideline-delay 0.5)
  (lsp-ui-peek-always-show t)
  (lsp-ui-peek-fontify 'always))

(use-package company
  :straight t
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 3)
  (company-tooltip-align-annotations t)
  (company-dabbrev-other-buffers t)
  :bind
    (:map company-active-map
          ("RET" . nil)
          ([return] . nil)
          ("C-w" . nil)
          ("TAB" . company-complete-selection)
          ("<tab>" . company-complete-selection))
  :hook
  (dashboard-after-initialize . global-company-mode)
  :config
  (add-to-list 'company-begin-commands 'backward-delete-char-untabify))

(use-package flycheck
    :straight t
    :custom (flycheck-emacs-lisp-load-path 'inherit)
    :init
    (add-hook 'after-init-hook #'global-flycheck-mode))
;;    (add-hook 'after-init-hook #'global-company-mode))

(use-package python
    :straight t)

(use-package go-mode
  :straight t)

(add-hook 'go-mode-hook #'lsp-deferred)
;;    :hook
;;    (go-mode . 'lsp-deferred))
;;    (go-mode . 'company-mode))
;;    (go-mode . #'yas-minor-mode))

(use-package markdown-mode
  :straight t)

(use-package yaml-mode
  :straight t)

(use-package json-mode
  :straight t)

(use-package make-mode
  :straight t)
