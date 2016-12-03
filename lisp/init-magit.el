(require-package 'magit)

;; global key binding for magit enterance
(global-set-key "\C-cg" 'magit-status)

(setq magit-refresh-status-buffer nil)

(provide 'init-magit)
