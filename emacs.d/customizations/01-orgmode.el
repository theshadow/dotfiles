;;; Init --- Summary
;;; Commentary: Provides all of the set up for Org Mode
;;; Code:

(require 'org)

;; set up org agenda
(setq org-agenda-files (directory-files-recursively "~/Documents/agenda" "^.*\.org$"))

;; set up default org stuff
(setq org-startup-indented t
      org-startup-folded "showeverything"
      org-startup-with-inline-images t
      org-use-speed-commands t
      org-hide-emphasis-markers t)

;; set up org-babel stuff
(setq org-babel-min-lines-for-block-output 1)

;; https://org-babel.readthedocs.io/en/latest/header-args/
(add-to-list 'org-babel-default-header-args '(:noweb . "yes"))
(add-to-list 'org-babel-default-header-args '(:exports . "both"))
(add-to-list 'org-babel-default-header-args '(:results . "output verbatim replace"))

;; enable auto-fill-mode while in this mode
(add-hook 'org-mode-hook 'auto-fill-mode)
;; set the default column widge to be 80 characters long
(setq-default fill-column 80)

(global-set-key (kbd "C-c a") 'org-agenda)

(provide '01-orgmode)
;;; 01-orgmode.el ends here
