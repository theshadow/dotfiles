;;; 02-flycheck.el --- Summary
;;; Commentary:
;;; Code:
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))
(require 'go-flycheck)

(global-flycheck-mode)

(provide '02-flycheck)
;;; 02-flycheck.el ends here
