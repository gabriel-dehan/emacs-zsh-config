;;; General config

(fset 'yes-or-no-p 'y-or-n-p)

; Duplicate line via C-c C-d
(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y")

; No more .ext~ files
(setq make-backup-files nil)

(setq auto-save-default nil)

; Use space instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

; Delete startup message
(setq inhibit-startup-message t)

(line-number-mode t)
(column-number-mode t)

(display-time-mode t)

(transient-mark-mode 1)
(delete-selection-mode t)
(show-paren-mode 1)
(setq search-highlight t)

; Trailing whitespaces
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; DoRemi CMD
(add-to-list 'load-path "~/.emacs.d/doremi")
(require 'doremi)
(require 'doremi-cmd)
(require 'setup-keys)

;; Window resizing
(defun xor (b1 b2)
       "Exclusive or of its two arguments."
       (or (and b1 b2)
           (and (not b1) (not b2))))

     (defun move-border-left-or-right (arg dir)
       "General function covering move-border-left and move-border-right. If DIR is
     t, then move left, otherwise move right."
       (interactive)
       (if (null arg) (setq arg 5))
       (let ((left-edge (nth 0 (window-edges))))
         (if (xor (= left-edge 0) dir)
          (shrink-window arg t)
          (enlarge-window arg t))))

     (defun move-border-left (arg)
       "If this is a window with its right edge being the edge of the screen, enlarge
     the window horizontally. If this is a window with its left edge being the edge
     of the screen, shrink the window horizontally. Otherwise, default to enlarging
     horizontally.

     Enlarge/Shrink by ARG columns, or 5 if arg is nil."
       (interactive "P")
       (move-border-left-or-right arg t))

     (defun move-border-right (arg)
       "If this is a window with its right edge being the edge of the screen, shrink
     the window horizontally. If this is a window with its left edge being the edge
     of the screen, enlarge the window horizontally. Otherwise, default to shrinking
     horizontally.

     Enlarge/Shrink by ARG columns, or 5 if arg is nil."
       (interactive "P")
       (move-border-left-or-right arg nil))

     (global-set-key (kbd "M-[") 'move-border-left)
     (global-set-key (kbd "M-]") 'move-border-right)

(defun v-resize (key)
   "interactively resize the window verticaly"
   (interactive "cHit ]/[ to enlarge/shrink")
     (cond
       ((eq key (string-to-char "["))
          (enlarge-window 1)
          (call-interactively 'v-resize))
       ((eq key (string-to-char "]"))
          (enlarge-window -1)
          (call-interactively 'v-resize))
       (t (push key unread-command-events))))

  (global-set-key "\C-c+" 'v-resize)



;;Select windows mode
(defun select-next-window ()
  "Switch to the next window"
  (interactive)
  (select-window (next-window)))

(defun select-previous-window ()
  "Switch to the previous window"
  (interactive)
  (select-window (previous-window)))

;(global-set-key (kbd "M-<right>") 'select-next-window)
;(global-set-key (kbd "M-n") 'select-next-window)
;(global-set-key (kbd "M-<left>")  'select-previous-window)
;(global-set-key (kbd "M-p")  'select-previous-window)

;(global-set-key (kbd "M-"

;; Mode hooks

;; Mode hooks
(defun ruby-mode-hook ()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-hook 'ruby-mode-hook '(lambda ()
                               (add-hook 'local-write-file-hooks
                                         '(lambda()
                                            (save-excursion
                                              (untabify (point-min) (point-max))
                                              (delete-trailing-whitespace)
                                              )))
                               (define-key ruby-mode-map "\C-m" 'newline-and-indent)
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation)
                               (local-set-key (kbd "C-c .") 'ac-complete-rsense)
                               (require 'ruby-electric)
                               (ruby-electric-mode t)
                               (add-to-list 'ac-sources 'ac-source-rsense-method)
                               (add-to-list 'ac-sources 'ac-source-rsense-constant)
                               (require 'ruby-block)
                               (require 'ruby-block t)
                               ;; do overlay
                               (setq ruby-block-highlight-toggle 'overlay)
                               ;; display to minibuffer
                               (setq ruby-block-highlight-toggle 'minibuffer)
                               ;; display to minibuffer and do overlay
                               (setq ruby-block-highlight-toggle t)
                               (define-key ruby-mode-map "\M-3" 'comment-or-uncomment-region)
                               (define-key ruby-mode-map "\C-ctf" 'rspec-verify)
                               (define-key ruby-mode-map "\C-ctu" 'rspec-verify-single)
                               )))

(defun rhtml-mode-hook ()
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda ()
                           (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))
(defun yaml-mode-hook ()
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode)))
(defun css-mode-hook ()
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2))))
(defun sass-mode-hook ()
  (autoload 'sass-mode "sass-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.sass$" . scss-mode))
  (add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode)))

;; Comment uncomment line
(defadvice comment-or-uncomment-region (before slick-comment activate compile)
  "When called interactively with no active region, comment a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; Emacs package manager
(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
              (lambda (s) (goto-char (point-max)) (eval-print-last-sexp))))
(require 'el-get)

(setq el-get-sources
      '(auto-complete
        haml-mode
        emacs-w3m
        (:name ruby-mode
               :type elpa
               :load "ruby-mode.el"
               :after (lambda() (ruby-mode-hook)))
        (:name inf-ruby  :type elpa)
        (:name ruby-compilation :type elpa)
;        (:name full-ack
;               type: git
;               url: "https://github.com/nschum/full-ack"
;               load "full-ack.el")
        (:name css-mode
               :type elpa
               :after (lambda() (css-mode-hook)))
        (:name sass-mode
               :type git
               :url "https://github.com/nex3/sass-mode"
               :load "sass-mode.el"
               :after (lambda() (sass-mode-hook)))
        (:name rvm
               :type git
               :url "http://github.com/djwhitt/rvm.el.git"
               :load "rvm.el"
               :compile ("rvm.el")
               :after (lambda() (rvm-use-default)))
        (:name rinari
               :type git
               :url "http://github.com/eschulte/rinari.git"
               :load-path ("." "util" "util/jump")
               :compile ("\\.el$" "util")
               :build ("rake doc:install_info")
               :info "doc"
               :features rinari)
        (:name rhtml
               :type git
               :url "https://github.com/eschulte/rhtml.git"
               :features rhtml-mode
               :after (lambda() (rhtml-mode-hook)))
        (:name rspec-mode
               :description "Enhance ruby-mode for RSpec"
               :type github
               :pkgname "pezra/rspec-mode"
               :features rspec-mode)
        (:name ri
               :type git
               :url "https://github.com/technomancy/ri.el"
               :features ri)
        (:name yaml-mode
               :type git
               :url "http://github.com/yoshiki/yaml-mode.git"
               :features yaml-mode
               :after (lambda() (yaml-mode-hook)))
        (:name magit
               :info "."
               :after (lambda () (global-set-key (kbd "C-x C-z") 'magit-status))
               )
        (:name fuzzy-find-in-project
               :type git
               :url "https://github.com/justinweiss/fuzzy-find-in-project"
               :load "fuzzy-find-in-project.el"
               )
        ))

(setq my-packages
      (append '(el-get)
              (mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-packages)


(add-to-list 'auto-mode-alist '("\\.js\\.erb\\'" . eruby-javascript-mumamo))
(add-to-list 'auto-mode-alist '("\\.js\\.rjs\\'" . eruby-javascript-mumamo))


;; Ack search engine
;(autoload 'ack-same "full-ack" nil t)
;(autoload 'ack "full-ack" nil t)
;(autoload 'ack-find-same-file "full-ack" nil t)
;(autoload 'ack-find-file "full-ack" nil t)

;; Fuzzy find
(require 'fuzzy-find-in-project)
(fuzzy-find-project-root "~/.emacs.d")

;; Git grep
;; http://stackoverflow.com/questions/2566632/using-emacs-for-big-big-projects
;; There's something similar (but fancier) in vc-git.el: vc-git-grep
;; -I means don't search through binary files
(defcustom git-grep-switches "--extended-regexp -I -n --ignore-case"
  "Switches to pass to `git grep'."
  :type 'string)

(defun git-grep (command-args)
  (interactive
   (list (read-shell-command "Run git-grep (like this): "
                             (format "git grep %s -e "
                                     git-grep-switches)
                             'git-grep-history)))
  (let ((grep-use-null-device nil))
    (grep command-args)))

;; Undo tree mode
(require 'undo-tree)
; C-_ C-/ == undo
; M-_ C-? == redo
; C-x u   == visualize tree
(global-undo-tree-mode)

;; Org-mode

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Yasnippet & Auto-complete
(require 'auto-complete)

(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
;;(require 'auto-complete-yasnippet)

(require 'yasnippet)
(global-auto-complete-mode t)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;; Ido-mode
; http://emacswiki.org/emacs/InteractivelyDoThings
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; NXHTML-mode

(load "~/.emacs.d/nxhtml/autostart.el")
(require 'nxhtml-mumamo)
(add-to-list 'auto-mode-alist '("\\.php$" . nxhtml-mumamo))
(add-to-list 'auto-mode-alist '("\\.inc$" . nxhtml-mumamo))
(setq mumamo-background-colors nil)

;; Psvn

(require 'psvn)

;; CSS/LESS/SASS

;(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))
;(add-to-list 'auto-mode-alist '("\\.sass$" . css-mode))

;; Emacs 23.3 fix && 24

;; Mumamo is making emacs 23.3 freak out:
(when (and (equal emacs-major-version 23)
	   (equal emacs-minor-version 3))
  (eval-after-load "bytecomp"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function))
					; tramp-compat.el clobbers this variable!
  (eval-after-load "tramp-compat"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function)))

;; Mode compile
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

;; Ruby electric-mode


;; Ruby Sense
(setq rsense-home (expand-file-name "~/.emacs.d/rsense-0.3"))
(setq rsense-home "/Users/Diacred/.emacs.d/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

;; Open in browser
(global-set-key "\C-cv" 'browse-url-of-buffer)

(global-set-key (kbd "\C-cp")
		(lambda ()
		  (interactive)
		  (comint-send-string (inferior-moz-process)
				      "BrowserReload();")))

;; Zencoding
(add-to-list 'load-path "~/.emacs.d/plugins/zencoding")
(require 'zencoding-mode)
(add-hook 'nxml-mode-hook 'zencoding-mode)
(global-set-key "\C-ci" 'zencoding-expand-line)

;; Color-theme
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(load-file "~/.emacs.d/color-theme-6.6.0/themes/color-theme-molokai.el")
(color-theme-molokai)

(setq browse-url-browser-function 'w3m-browse-url)
 (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
 ;; optional keyboard short-cut
 (global-set-key "\C-xm" 'browse-url-at-point)

;; Minimap
;(require 'minimap)
;(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; '(minimap-normal-height-faces (quote (font-lock-function-name-face))))
;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; '(minimap-active-region-background ((t (:background "#000000" :height 0.5))))
; '(minimap-font-face ((t (:height 0.2 :family "DejaVu Sans Mono"))))
; '(minimap-semantic-function-face ((t (:inherit (font-lock-function-name-face minimap-font-face) :background "gray50" :box (:line-width 1 :color "black") :height 2.5)))))

;; APIdock integration

;; Simple function to search in Apidoc rails API
;; To use it, copy this file to somewhere in your emacs path
;; (i.e., ~/.emacs.d), and add this line to your ~/.emacs
;;
;;
;; (eval-after-load 'ruby-mode '(require 'rails-apidock))
;;
;;
;; Then put your cursor in the word/symbol you want to look for, and
;; press C-c d
;;
;;
(defun gaizka-search-apidock-rails ()
  "Search current word in apidock for rails"
  (interactive)
  (let* ((word-at-point (thing-at-point 'symbol))
         (word (read-string "Search apidock for? " word-at-point)))
    (browse-url (concat "http://apidock.com/rails/" word))))

(define-key ruby-mode-map (kbd "C-c d") 'gaizka-search-apidock-rails)

(provide 'rails-apidock)

(eval-after-load 'ruby-mode '(require 'rails-apidock))
