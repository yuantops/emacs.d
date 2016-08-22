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

;; golang mode:
;;(require 'go-mode-autoloads)
(require 'go-autocomplete)
;; speedbar
(speedbar 1)
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
;; helper function
(defun go ()
    "run current buffer"
    (interactive)
    (compile (concat "go run " (buffer-file-name))))

;; helper function
(defun go-fmt-buffer ()
    "run gofmt on current buffer"
    (interactive)
    (if buffer-read-only
    (progn
        (ding)
        (message "Buffer is read only"))
    (let ((p (line-number-at-pos))
    (filename (buffer-file-name))
    (old-max-mini-window-height max-mini-window-height))
        (show-all)
        (if (get-buffer "*Go Reformat Errors*")
    (progn
        (delete-windows-on "*Go Reformat Errors*")
        (kill-buffer "*Go Reformat Errors*")))
        (setq max-mini-window-height 1)
        (if (= 0 (shell-command-on-region (point-min) (point-max) "gofmt" "*Go Reformat Output*" nil "*Go Reformat Errors*" t))
    (progn
        (erase-buffer)
        (insert-buffer-substring "*Go Reformat Output*")
        (goto-char (point-min))
        (forward-line (1- p)))
    (with-current-buffer "*Go Reformat Errors*"
    (progn
        (goto-char (point-min))
        (while (re-search-forward "<standard input>" nil t)
        (replace-match filename))
        (goto-char (point-min))
        (compilation-mode))))
        (setq max-mini-window-height old-max-mini-window-height)
        (delete-windows-on "*Go Reformat Output*")
        (kill-buffer "*Go Reformat Output*"))))
;; helper function
(defun go-fix-buffer ()
    "run gofix on current buffer"
    (interactive)
    (show-all)
    (shell-command-on-region (point-min) (point-max) "go tool fix -diff"))

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
