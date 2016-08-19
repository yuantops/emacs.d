(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Personal/Notes/worklog_daily_工作笔记.org")))
 '(org-startup-truncated nil)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(truncate-lines nil))

;; show line number
(global-linum-mode t)

;; add config file load path
(add-to-list 'load-path "~/.emacs.d/src/")

;; go-mode:
(require 'go-mode-autoloads)
(require 'go-autocomplete)

;; markdown mode
(autoload 'markdown-mode "markdown-mode"
             "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; 中文字体设置, 中英字体等宽
;; On different platforms, I need to set different scaling rate for
;; ;; differnt font size.
(load "~/.emacs.d/src/bhj-fonts.el")
(cond
  ((and (boundp '*is-a-mac*) *is-a-mac*)
   (setq chinese-font-size-scale-alist '((10.5 . 1.3) (11.5 . 1.3) (16 . 1.3) (18 . 1.25))))
  ((and (boundp '*is-a-win*) *is-a-win*)
   (setq chinese-font-size-scale-alist '((11.5 . 1.25) (16 . 1.25))))
  (t ;; is a linux
    (setq chinese-font-size-scale-alist '((16 . 1.25)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

 ;; org-mode key bindings
 (global-set-key "\C-cl" 'org-store-link)
 (global-set-key "\C-ca" 'org-agenda)
 (global-set-key "\C-cc" 'org-capture)
 (global-set-key "\C-cb" 'org-iswitchb)

;; org-mode: syntax highlight for src code blocks
(setq org-src-fontify-natively t)

;; org-mode: enable markdown exporter
(eval-after-load "org"
  '(require 'ox-md nil t))

;; tex support
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/texlive/2016basic/bin/universal-darwin"))

;; auto-complete mode configuration
(require 'auto-complete-config)
(ac-config-default)
