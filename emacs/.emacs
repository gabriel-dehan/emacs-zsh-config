(require 'cl)
(push "/usr/local/bin" exec-path)

(defvar emacs-directory "~/.emacs.d/"
  "The directory containing the emacs configuration files.")
(pushnew (expand-file-name emacs-directory) load-path)

(setq custom-file "~/.emacs.d/emacs.el")
(load custom-file)


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
