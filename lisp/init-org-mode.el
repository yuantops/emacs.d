;; org-mode key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;;
;;注意，capture-template的配置在lisp/init-local.el
;;Note that settings for capture-template locate at lisp/init-local.el
;;

;; org-mode: syntax highlight for src code blocks
(setq org-src-fontify-natively t)

;; org-mode: enable markdown exporter
(eval-after-load "org"
  '(require 'ox-md nil t))

;; prevent truncating lines
(add-hook 'org-mode-hook 
	  (lambda () (setq truncate-lines nil)))

(provide 'init-org-mode)
