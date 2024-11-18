;; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Don't show the splash screen
(setq inhibit-startup-message t
      visible-bell t)

;; Turn off UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Display line numbers in every buffer
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
;; Load theme
(load-theme 'gruber-darker t)

;; Set font
(set-face-attribute 'default nil :font "Iosevka" :height 180)

;; Remember files edited recently
(recentf-mode 1)

;; Save what you enter into minibuffer prompts
(setq history-length 25)
(savehist-mode 1)

;; Remember and restore the last cursor location
(save-place-mode 1)

;; Don't use pop up UI dialogs when prompting
(setq use-dialog-box nil)

;; Revert buffers when nthe underlying file has changed
(global-auto-revert-mode 1)

;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

;; Define the whitespace style.
(setq-default whitespace-style
              '(face spaces empty tabs newline trailing space-mark tab-mark))

(global-whitespace-mode 1)

;; straight.el

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'company)
(add-hook 'after-init-hook 'global-company-mode)

(straight-use-package 'lsp-mode)

(straight-use-package 'which-key)

(straight-use-package 'vterm)
