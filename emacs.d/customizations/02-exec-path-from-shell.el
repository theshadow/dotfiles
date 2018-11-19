;;; 02-exec-path-from-shell.el --- Summary
;;; Commentary:
;;; Code:
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(provide '02-exec-path-from-shell)
;;; 02-exec-path-from-shell.el ends here
