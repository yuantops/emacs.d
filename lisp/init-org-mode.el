;; org-mode key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-default-notes-file "/Users/yuan/Personal/org_file/idea.org")

;; Capture templates for: TODO tasks, Notes, Journals
(setq org-capture-templates
      (quote (("t" "todo" entry (file "/Users/yuan/Personal/org_file/task.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("n" "note" entry (file "/Users/yuan/Personal/org_file/idea.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "/Users/yuan/Personal/org_file/journal.org")
               "* %?\n%U\n" :clock-in t :clock-resume t))
      )
)

;; org-mode: syntax highlight for src code blocks
(setq org-src-fontify-natively t)

;; org-mode: enable markdown exporter
(eval-after-load "org"
  '(require 'ox-md nil t))

(add-hook 'org-mode-hook 
	  (lambda () (setq truncate-lines nil)))

(provide 'init-org-mode)
