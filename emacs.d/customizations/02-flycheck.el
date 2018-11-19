;;; 02-flycheck.el --- Summary
;;; Commentary:
;;; Code:

(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))
(require 'go-flymake)
(require 'go-flycheck)

(global-flycheck-mode)

(require 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(with-eval-after-load 'flycheck
  (flycheck-title-mode))

(provide '02-flycheck)
;;; 02-flycheck.el ends here
