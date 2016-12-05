;; Use smex to handle M-x
(when (maybe-require-package 'smex)
  ;;; Smex
  (autoload 'smex "smex"
    "Smex is a M-x enhancement for Emacs, it provides a convenient interface to
your recently and most frequently used commands.")
  
  ;; Change path for ~/.smex-items
  (setq-default smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
  (global-set-key [remap execute-extended-command] 'smex))

(provide 'init-smex)
