;;; 02-org-mode.el --- Summary
;;; Commentary:
;;; Code:
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (emacs-lisp . t)
   (shell . t)
   (js . t)
   (gnuplot . t)
   (plantuml . t)
   (sql . t)
   (ditaa . t)
   (haskell . t)
   (C . t)
   (latex . t)
   (R . t)
   ))

(add-to-list 'load-path (concat user-emacs-directory "customizations/org-reveal/"))

(provide '02-org-mode)
;;; 02-org-mode.el ends here
