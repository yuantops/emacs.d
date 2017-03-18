(require-package 'haskell-mode)

;; company auto-complete backend
(add-hook 'haskell-mode-hook
          (lambda ()
	    ('turn-on-haskell-doc-mode)
	    ('turn-on-haskell-indentation)
            (set (make-local-variable 'company-backends)
                 (append '((company-capf company-dabbrev-code))
                         company-backends))))

;; auto-format on saving 
(custom-set-variables
 '(haskell-stylish-on-save t))

;; speedbar 
(speedbar-add-supported-extension ".hs")

(provide 'init-haskell-mode)
