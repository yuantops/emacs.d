(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/")))))

;; show line number
(global-linum-mode t)

(add-to-list 'load-path "~/.emacs.d/src/")

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

;; org-mode truncate line
(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil)))
