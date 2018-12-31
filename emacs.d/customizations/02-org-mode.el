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

(use-package org
  :config
  (progn
    (defun imalison:org-inline-css-hook (exporter)
      "Insert custom inline css to automatically set the
background of code to whatever theme I'm using's background"
      (when (eq exporter 'html)
        (let* ((my-pre-bg (face-background 'default))
               (my-pre-fg (face-foreground 'default)))
          (setq
           org-html-head-extra
           (concat
            org-html-head-extra
            (format "<style type=\"text/css\">\n pre.src {background-color: %s; color: %s;}</style>\n"
                    my-pre-bg my-pre-fg))))))

    (add-hook 'org-export-before-processing-hook 'imalison:org-inline-css-hook)))

(provide '02-org-mode)
;;; 02-org-mode.el ends here
