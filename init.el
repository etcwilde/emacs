;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Filename $HOME/.emacs.d/initi.el
;; Author:  Evan Wilde
;; Date:    July 17, 2017
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(package-initialize) -- handled by packages.org

;; Log starting time
(defvar etcw-el-start-time (current-time) "Time when init.el was started")

;; Custom configurations
(defvar emacs-conf-dir user-emacs-directory "Root configuration directory for emacs")
(defvar etcw-conf-dir (concat user-emacs-directory "etcw/") "My configurations")
(if (not (member "~/.emacs.d/themes" 'custom-theme-load-path))
    (add-to-list 'custom-theme-load-path "~/.emacs.d/themes"))

;; Set paths to org-mode
;; Different version of org-mode, not elpa
(add-to-list 'load-path (concat emacs-conf-dir "contrib/org-mode/lisp/"))
(add-to-list 'load-path (concat emacs-conf-dir "contrib/org-mode/contrib/lisp/"))
(require 'org)

;; Set paths to use-package
(add-to-list 'load-path (concat emacs-conf-dir "contrib/use-package/"))

;; Load up the base functions for everything else
(org-babel-load-file (concat etcw-conf-dir "base.org"))

;; Load private personal settings
(add-hook
 'after-init-hook
 (lambda ()
   (let ((private-file (concat emacs-conf-dir "private.el")))
     (when (file-exists-p private-file)
       (load-file private-file)))))

;; Load other configurations
(load-conf (concat etcw-conf-dir "functions.org")) ;; Helper functions
(load-conf (concat etcw-conf-dir "themes/zenburn.org")) ;; Zenburn theme
(load-conf (concat etcw-conf-dir "packages.org"))  ;; Package Management
(load-conf (concat etcw-conf-dir "config.org"))    ;; Personal settings

;; Show the Time taken to 'boot' emacs
(message "Configurations started in %f seconds" (float-time (subtract-time
                                                             (current-time)
                                                             etcw-el-start-time)))
