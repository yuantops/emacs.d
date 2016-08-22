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
     ("popkit" . "http://elpa.popkit.org/packages/")
     ("marmalade" . "https://marmalade-repo.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(truncate-lines nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; activate packages manually before processing the init file.
(setq package-enable-at-startup nil)
(package-initialize)

;; add config file load path
(add-to-list 'load-path "~/.emacs.d/src/")

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

;; show line number
(global-linum-mode t)

;; enable speedbar
(speedbar 1)
;; speedbar for go mode
(speedbar-add-supported-extension ".go")
(add-hook
'go-mode-hook
'(lambda ()
    ;; gocode
    (auto-complete-mode 1)
    (setq ac-sources '(ac-source-go))
    ;; Imenu & Speedbar
    (setq imenu-generic-expression
        '(("type" "^type *\\([^ \t\n\r\f]*\\)" 1)
        ("func" "^func *\\(.*\\) {" 1)))
    (imenu-add-to-menubar "Index")
    ;; Outline mode
    (make-local-variable 'outline-regexp)
    (setq outline-regexp "//\\.\\|//[^\r\n\f][^\r\n\f]\\|pack\\|func\\|impo\\|cons\\|var.\\|type\\|\t\t*....")
    (outline-minor-mode 1)
    (local-set-key "\M-a" 'outline-previous-visible-heading)
    (local-set-key "\M-e" 'outline-next-visible-heading)
    ;; Menu bar
    (require 'easymenu)
    (defconst go-hooked-menu
        '("Go tools"
        ["Go run buffer" go t]
        ["Go reformat buffer" go-fmt-buffer t]
        ["Go check buffer" go-fix-buffer t]))
    (easy-menu-define
        go-added-menu
        (current-local-map)
        "Go tools"
        go-hooked-menu)

    ;; Other
    (setq show-trailing-whitespace t)
    ))

;; markdown mode
(autoload 'markdown-mode "markdown-mode"
             "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

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

;; golang mode
;; auto-complete for golang
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

;; copying important environment variables from the user's shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

