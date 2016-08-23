(require-package 'auto-complete)

(require 'auto-complete-config)
(ac-config-default)

;; (global-auto-complete-mode t)		

;; ;; 阻止自动触发补全动作
;; (setq-default ac-expand-on-auto-complete nil)
;; (setq-default ac-auto-start nil)
;; ;; 用TAB作为手动触发补全动作的快捷键
;; (ac-set-trigger-key "TAB")

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

(provide 'init-auto-complete)
