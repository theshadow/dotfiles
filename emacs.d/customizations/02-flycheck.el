;;; 02-flycheck.el --- Summary
;;; Commentary:
;;; Code:
(require 'flycheck)
(require 'flycheck-color-mode-line)

(global-flycheck-mode)

(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(with-eval-after-load 'flycheck
  (flycheck-title-mode))

(provide '02-flycheck)
;;; 02-flycheck.el ends here
