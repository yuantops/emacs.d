(require-package 'exec-path-from-shell)

;; copying important environment variables from the user's shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(provide 'init-shell-exec-path)
