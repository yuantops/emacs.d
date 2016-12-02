;;=============================================
;; org-mode custom settings
;;=============================================
(setq org-default-notes-file "~/notes/idea.org")

;; Capture templates for: TODO tasks, Notes, Journals
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/notes/task.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("n" "note" entry (file "~/notes/idea.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "journal" entry (file+datetree "~/notes/journal.org")
               "* %?\n%U\n" :clock-in t :clock-resume t))
      )
)
(provide 'init-local)
