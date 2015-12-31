;;; my-funcs.el --- Small, useful functions

(defun my-change-font-height (x)
  "Change the font height based on user input."
  (interactive "xEnter desired font height: ")
  (set-face-attribute 'default nil :height x)
  (message "The font height is now %s." x))

(defun my-clear-eshell ()
  "Clears the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(defun my-find-file-as-root ()
  "Like C-x C-f, but edit the file as root."
  (interactive)
  (let ((file (ido-read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo:root@localhost:" file)))
    (find-file file)))

(defun my-split-window (frame)
  "Split the current window into two windows side-by-side."
  (select-frame frame)
  (split-window-right))

(defun my-untabify-buffer ()
  "Turns tabs into spaces for the entire buffer."
  (interactive)
  (untabify (point-min) (point-max))
  (message "All tabs are now spaces."))
