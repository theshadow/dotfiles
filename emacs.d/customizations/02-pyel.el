;;; Init --- Summary
;;; Commentary: Provides the settings for the python mode (pyel) https://github.com/mschuldt/pyel
;;; Code:
(require 'ert)

(straight-use-package
 '(el-patch :type git :host github :repo "mschuldt/pyel" :ref "master"))

(add-to-list 'load-path "~/.emacs.d/packages/pyel/")

(require 'pyel)

(provide '02-pyel)
;;; 02-pyel.el ends here
