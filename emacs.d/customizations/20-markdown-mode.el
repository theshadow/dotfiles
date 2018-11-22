;;; 20-markdown-mode.el --- Summary
;;; Commentary:
;;; Code:
(setq markdown-command "pandoc -c file://~/.emacs.d/customizations/markdown-mode/github-pandoc.css --quiet --from gfm -t html5 --highlight-style pygments --standalone")
(provide '20-markdown-mode)
;;; 20-markdown-mode.el ends here
