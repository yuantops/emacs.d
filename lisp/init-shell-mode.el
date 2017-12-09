;; Shell mode settings 
(custom-set-variables
 '(comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
 '(comint-scroll-to-bottom-on-output t) ; always add output at the bottom
 '(comint-scroll-show-maximum-output t) ; scroll to show max possible output
 '(comint-completion-autolist t)        ; show completion list when ambiguous
 '(comint-input-ignoredups t)           ; no duplicates in command history
 '(comint-completion-addsuffix t)       ; insert space/slash after file completion
 )

; interpret and use ansi color codes in shell output windows
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

; make completion buffers disappear after 3 seconds.
(add-hook 'completion-setup-hook
  (lambda () (run-at-time 3 nil
			  (lambda () (delete-windows-on "*Completions*")))))

;; make the prompt read only
(setq comint-prompt-read-only t)
;;(add-to-list 'comint-dynamic-complete-functions 'icicle-shell-dynamic-complete-filename)
;;(add-to-list 'comint-dynamic-complete-functions 'icicle-shell-dynamic-complete-command)

(provide 'init-shell-mode)
