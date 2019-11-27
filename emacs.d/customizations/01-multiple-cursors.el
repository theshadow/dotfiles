;;; Init --- Summary
;;; Commentary: Provides all of the set up for multiple cursors
;;; Code:

(straight-use-package 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(provide '01-multiple-cursors)
;;; 01-multiple-cursors.el ends here
