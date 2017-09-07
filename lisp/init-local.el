;;=============================================
;; org-mode custom settings
;;=============================================
(setq org-default-notes-file "~/notes/idea.org")

;; Capture templates for: TODO tasks, Notes, Journals
(setq org-capture-templates
      (quote (("i" "idea" entry (file "~/notes/idea.org")
               "* %? :NEW:\n%U\n%a\n\n" )
	      ("t" "todo" entry (file "~/notes/todo.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "journal" entry (file+datetree "~/notes/journal.org")
               "* %?\n%U\n" :clock-in t :clock-resume t))
	     )
      )
(setq org-agenda-files
      '("~/notes/task.org" "~/notes/idea.org" "~/notes/journal.org"))
(setq org-refile-targets
      '((nil :maxlevel . 3)
        (org-agenda-files :maxlevel . 3)))

;;=============================================
;; yasnippet dirs
;;=============================================
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        "~/.emacs.d/elpa/yasnippet-20161201.1520/snippets"           ;; foo-mode and bar-mode snippet collection
        )
      )

(provide 'init-local)
