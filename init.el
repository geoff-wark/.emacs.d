;;; init.el --- The first thing GNU Emacs runs

(run-with-idle-timer
 5 nil
 (lambda ()
   (setq     gc-cons-threshold 1000000)
   (message "gc-cons-threshold restored to %S"
             gc-cons-threshold)))

(setq user-full-name    "Geoff Wark"
      user-mail-address "gtw@tuta.io")

(add-to-list 'load-path  "~/.emacs.d/elisp/")
(let ((default-directory "~/.emacs.d/elisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(defvar my-load-libs
  '(
    "my-packages"
    "my-funcs"
    "my-ui"
    "my-nav"
    "my-keys"
  ))

(dolist (p my-load-libs)
  (load-library p))

(add-to-list 'load-path "~/workspace/pianobar.el/")
(autoload 'pianobar "pianobar" nil t)
