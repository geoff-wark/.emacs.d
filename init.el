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

(unless (eq system-type 'windows-nt)
  (add-to-list 'load-path "~/workspace/pianobar.el/")
  (autoload 'pianobar "pianobar" nil t))

(when (featurep 'ns)
  (defun ns-raise-emacs ()
    "Raise Emacs."
    (ns-do-applescript "tell application \"Emacs\" to activate"))

  (defun ns-raise-emacs-with-frame (frame)
    "Raise Emacs and select the provided frame."
    (with-selected-frame frame
      (when (display-graphic-p)
        (ns-raise-emacs))))

  (add-hook 'after-make-frame-functions 'ns-raise-emacs-with-frame)

  (when (display-graphic-p)
    (ns-raise-emacs)))
