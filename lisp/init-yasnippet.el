(require-package 'yasnippet)

;; make Ctrl-c k the only trigger key for yas
;;(define-key yas-minor-mode-map (kbd "<tab>") nil)
;;(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

(yas-global-mode t)

;;
;;注意，snippet的位置在lisp/init-local.el中设置
;;

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
