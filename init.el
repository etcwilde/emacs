;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Filename $HOME/.emacs.d/initi.el
;; Author:  Evan Wilde
;; Date:    July 17, 2017
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Log starting time
(defvar etcw-el-start-time (current-time) "Time when init.el was started")

;; Root filepath
(defvar emacs-conf-dir "~/.emacs.d/" "Root configuration Directory")
(defvar etcw-conf-dir (concat emacs-conf-dir "etcw/") "My configurations")

;; (package-initialize)
;; (setq package-enable-at-startup nil)"

;; Set paths to org-mode
;; Different version of org-mode, not elpa
(add-to-list 'load-path (concat emacs-conf-dir "contrib/org-mode/lisp/"))
(add-to-list 'load-path (concat emacs-conf-dir "contrib/org-mode/contrib/lisp/"))
(require 'org)

;; Load up the base functions for everything else
(org-babel-load-file (concat etcw-conf-dir "base.org"))

;; Load other configurations
(load-conf (concat etcw-conf-dir "config.org"))

;; Show the Time taken to 'boot' emacs
(message "Configurations started in %f seconds" (float-time (subtract-time (current-time) etcw-el-start-time)))
