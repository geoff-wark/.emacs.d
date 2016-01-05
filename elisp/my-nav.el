;;; my-nav.el --- File navigation and formatting

(require 'company-emoji)
(require 'ido-vertical-mode)
(require 'simpleclip)
(require 'smartparens-config)


(when (eq system-type 'darwin)
  (exec-path-from-shell-initialize))

(setq locale-coding-system   'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system        'utf-8)

(add-to-list 'company-backends 'company-emoji)
(add-hook 'after-init-hook     'global-company-mode)
(add-hook 'after-init-hook    #'global-flycheck-mode)

(autoload 'js3-mode "js3-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

(ido-mode                1)
(ido-vertical-mode       1)
(projectile-global-mode)
(simpleclip-mode         1)
(smartparens-global-mode 1)
(winner-mode             1)

(setq-default indent-tabs-mode nil
        tab-width 2
        c-basic-offset 4)
(c-set-offset 'case-label '+)

(smex-initialize)
(defadvice smex (around space-inserts-hyphen activate compile)
  (let ((ido-cannot-complete-command
         `(lambda ()
            (interactive)
            (if (string= " " (this-command-keys))
                (insert ?-)
              (funcall ,ido-cannot-complete-command)))))
    ad-do-it))

(setq mouse-scroll-amount (quote (0.01)))
