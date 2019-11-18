;;; Init --- Summary
;;; Commentary: Provides all of the set up for Org Mode
;;; Code:

(setq org-agenda-files (directory-files-recursively "~/Documents/agenda" "^.*\.org$"))

(add-hook 'org-mode-hook 'auto-fill-mode)
(setq-default fill-column 80)

(global-set-key (kbd "C-c a") 'org-agenda)

;;; 01-orgmode.el ends here
