(add-to-list 'load-path (expand-file-name "lisp" "~/.emacs.d"))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" "~/.emacs.d"))
(require 'init-utils)

;; Machinery for installing required packages.
;; explicitly call 'package-initialize to set up all packages installed via ELPA.
;; should come before all package-related config files
(require 'init-elpa)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
;; 中英文字体
(require 'init-fonts)
;; 行号, speedbar, 断行
(require 'init-appearance)
;; 多window切换
(require 'init-windows)
;; copy/paste快捷键
(require 'init-copy-bindings)
;; 环境变量
(require 'init-exec-path)
;; smex 输入命令更快
(require 'init-smex.el)

;; company(自动补齐)
(require 'init-company)
;; fly-check
(require 'init-flycheck)
;; yasnippet
(require 'init-yasnippet)
;; magit
(require 'init-magit)


;; shell-mode
(require 'init-shell-mode)
;; org-mode
(require 'init-org-mode)
;; go-mode
(require 'init-go-mode)
;; haskell-mode
(require 'init-haskell-mode)
;; python-mode
(require 'init-python-mode)
;; markdown-mode
(require 'init-markdown)

;;(require 'init-copy-kbd-bindings)

;; (require 'init-frame-hooks)
;; (require 'init-xterm)
;; (require 'init-osx-keys)
;; (require 'init-gui-frames)
;; (require 'init-proxies)
;;(require 'init-dired)
;; (require 'init-isearch)
;; (require 'init-uniquify)
;; (require 'init-ibuffer)
;; (require 'init-flycheck)

;;(require 'init-recentf)
;;(require 'init-ido)
;;(require 'init-yasnippet)
;;(require 'init-hippie-expand)

;; (require 'init-windows)
;; (require 'init-sessions)

;; (require 'init-mmm)
;;(require 'init-tabbar)
;;(require 'init-editing-utils)
;;(require 'init-evil)
;;(require 'init-matlab)

;; (require 'init-vc)
;; (require 'init-darcs)
;; (require 'init-git)

;; (require 'init-crontab)
;; (require 'init-textile)
;;(require 'init-markdown)
;;(require 'init-auctex)
;; (require 'init-csv)
;; (require 'init-erlang)
;; (require 'init-javascript)
;; (require 'init-php)
;;(require 'init-org)
;; (require 'init-nxml)
;; (require 'init-html)
;; (require 'init-css)
;; (require 'init-haml)
;; (require 'init-python-mode)
;;(require 'init-haskell)
;; (require 'init-ruby-mode)
;; (require 'init-rails)
;; (require 'init-sql)

;; (require 'init-paredit)
;; (require 'init-lisp)
;; (require 'init-slime)
;; (require 'init-clojure)
;; (when (>= emacs-major-version 24)
;;   (require 'init-clojure-cider))
;; (require 'init-common-lisp)

;; (when *spell-check-support-enabled*
;;   (require 'init-spelling))

;; (require 'init-marmalade)
;; (require 'init-misc)

;; (require 'init-dash)
;; (require 'init-ledger)
;; ;; Extra packages which don't require any configuration

;; (require-package 'gnuplot)
;; (require-package 'lua-mode)
;; (require-package 'htmlize)
;; (require-package 'dsvn)
;; (when *is-a-mac*
;;   (require-package 'osx-location))
;; (require-package 'regex-tool)

;;(require 'init-themes)
;; ;;----------------------------------------------------------------------------
;; ;; Allow access from emacsclient
;; ;;----------------------------------------------------------------------------
;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))


;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file)
  (load custom-file))


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(when (file-exists-p (expand-file-name "init-local.el" "/home/yuan/.emacs.d"))
  (error "Please move init-local.el to ~/.emacs.d/lisp"))
(require 'init-local nil t)


;; ;;----------------------------------------------------------------------------
;; ;; Locales (setting them earlier in this file doesn't work in X)
;; ;;----------------------------------------------------------------------------
;; (require 'init-locales)

;; (add-hook 'after-init-hook
;;            (lambda ()
;;              (message "init completed in %.2fms"
;;                       (sanityinc/time-subtract-millis after-init-time before-init-time))))


(provide 'init)
