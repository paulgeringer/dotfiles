(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(require 'package)
(package-initialize)
(setq linum-format " %d ")
(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

(setq inhibit-startup-message t)
(menu-bar-mode -1)
(global-linum-mode 1)

(require 'evil)
(require 'evil-leader)
;;(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
;;(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
;;(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
;;(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
(evil-define-key 'normal org-mode-map (kbd "TAB") #'org-cycle)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(auto-fill-mode 1) ;; this might break stuff

(global-evil-leader-mode)
(evil-mode 1)

(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/color-theme-tomorrow.el")
(require 'color-theme-tomorrow)
(color-theme-tomorrow--define-theme night)
;;(require 'helm-config)
