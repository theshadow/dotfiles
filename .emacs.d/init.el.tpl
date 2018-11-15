;;; Init --- Summary
;;; Commentary:
;;; Code:

(require 'cask "CP/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(mapc 'load (directory-files "~/.emacs.d/customizations" t "^[0-9]+.*\.el$"))

(provide 'init)

;;; init.el ends here
