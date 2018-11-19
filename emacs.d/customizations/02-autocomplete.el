;;; 02-autocomplete.el --- Summary
;;; Commentary:
;;; Code:
(require 'auto-complete)
(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/nsf/gocode/emacs"))
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
;;; 02-autocomplete.el end here
