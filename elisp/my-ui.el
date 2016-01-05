;;; my-ui.el --- UI/UX related customizations

(require 'column-marker)
(require 'git-gutter-fringe)
(require 'hl-indent)
(require 'linum-relative)


(load-theme 'zenburn t)

(setq default-frame-alist              '((cursor-color . "#FF0000")))
(unless (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(font . "Meslo LG S-10")))

(toggle-indicate-empty-lines)
(setq-default show-trailing-whitespace t)
(make-face-italic 'font-lock-comment-face)

(set-face-attribute 'column-marker-1     nil :background "#000000")
(set-face-foreground 'git-gutter-fr:modified             "#FFFF00")
(set-face-foreground 'git-gutter-fr:added                "#00FF00")
(set-face-foreground 'git-gutter-fr:deleted              "#0000FF")
(set-face-attribute 'hl-indent-face      nil :background "#444444")
(set-face-attribute 'linum               nil :foreground "#FFFFFF")
(set-face-attribute 'region              nil :background "#FFFFFF"
                                             :foreground "#000000")
(set-face-attribute 'trailing-whitespace nil :background "#FFA500")

(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))

(global-git-gutter-mode 1)
(global-hl-line-mode    1)
(my-global-rainbow-mode 1)
(nyan-mode              1)
(show-paren-mode        1)
(setq visible-bell      1)

(blink-cursor-mode     -1)
(menu-bar-mode         -1)
(scroll-bar-mode       -1)
(tool-bar-mode         -1)

(add-hook 'find-file-hook (lambda () (interactive) (column-marker-1 81)))
(add-hook 'after-init-hook                        #'global-emojify-mode)
(add-hook 'prog-mode-hook                          'hl-indent-mode)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'after-make-frame-functions 'my-split-window)
