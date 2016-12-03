(require-package 'go-mode)
(require-package 'go-eldoc)
(require-package 'company-go)

(add-hook
 'go-mode-hook
 '(lambda ()

    ;; Call Gofmt before saving  
    (add-hook 'before-save-hook 'gofmt-before-save)
    ;; Add golang doc support
    (go-eldoc-setup)
    ;; Godef jump key binding
    (local-set-key (kbd "M-,") 'godef-jump)
    (local-set-key (kbd "M-.") 'pop-tag-mark)

    ;;autocomplete
    (set (make-local-variable 'company-backends) '(company-go))
    (company-mode)
    
    ;; Imenu 
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


    ;; speedbar
    (speedbar-add-supported-extension ".go")

    
    ;; Other
    (setq show-trailing-whitespace t)
    ))

(provide 'init-go-mode)
