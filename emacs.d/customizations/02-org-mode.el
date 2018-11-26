;;; 02-org-mode.el --- Summary
;;; Commentary:
;;; Code:
(require 'plantuml-mode)
(with-eval-after-load "org"
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml)))
(provide '02-org-mode)
;;; 02-org-mode.el ends here
