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

;;=============================================
;; yasnippet dirs
;;=============================================
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        "~/.emacs.d/elpa/yasnippet-20161201.1520/snippets"           ;; foo-mode and bar-mode snippet collection
        )
      )

(provide 'init-local)
