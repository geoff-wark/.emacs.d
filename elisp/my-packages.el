;;; my-packages.el --- Checks for/installs desired packages

(require 'cl)
(require 'package)


(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

(defvar required-packages
  '(
    column-marker
    company
    company-emoji
    emojify
    exec-path-from-shell
    expand-region
    flycheck
    fringe-helper
    git-gutter-fringe
    hl-indent
    ido-vertical-mode
    linum-relative
    magit
    multiple-cursors
    nyan-mode
    projectile
    rainbow-mode
    simpleclip
    smartparens
    smex
    zenburn-theme
  ))

(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (packages-installed-p)
  (message "%s" "GNU Emacs is now refreshing its package databases...")
  (package-refresh-contents)
  (message "%s" " done.")
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))
