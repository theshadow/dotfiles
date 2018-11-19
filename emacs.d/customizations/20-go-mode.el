;;; 20-go-mode.el --- Summary
;;; Commentary:
;;; Code:
(require 'go-mode)
(add-hook 'go-mode-hook 'go-eldoc-setup)

(add-to-list 'yas-snippet-dirs "~/.emacs.d/customizations/go-errorcheck")

(provide '20-go-mode)
;;; 20-go-mode.el ends here
