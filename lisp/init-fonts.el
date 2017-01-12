(defun font-exist-p (fontname)
  "Test if this font is exist or not."
  (if (or (not fontname) (string= fontname ""))
      nil
    (if (not (x-list-fonts fontname)) nil t)))

(defun set-font (english chinese size-pair)
  "Setup emacs English and Chinese font on x window-system."

  (if (font-exist-p english)
      (set-frame-font (format "%s:pixelsize=%d" english (car size-pair)) t))

  (if (font-exist-p chinese)
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset
                          (font-spec :family chinese :size (cdr size-pair))))))

(defun set-font-from-list (en-fonts chn-fonts size-pair)
  "Pick up first existing font from candidate list and set up."

  (require 'cl) ; for find if
  (let ((en-font (find-if #'font-exist-p en-fonts))
	(zh-font (find-if #'font-exist-p chn-fonts)))
    (message "Set chn font: %s, en font: %s" zh-font en-font)
    (set-font en-font zh-font size-pair)    
    ))

(defvar en-font-list '("Monaco" "Consolas" "DejaVu Sans Mono" "Monospace" "Courier New"))
(defvar chn-font-list '("Noto Sans CJK SC Regular" "Microsoft Yahei" "Microsoft_Yahei" "微软雅黑" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))
(defvar emacs-font-size-pair '(15 . 18)
  "Default font size pair for (english . chinese)")

(defvar emacs-font-size-pair-list
  '(( 5 .  6) (10 . 12)
    (13 . 16) (15 . 18) (17 . 20)
    (19 . 22) (20 . 24) (21 . 26)
    (24 . 28) (26 . 32) (28 . 34)
    (30 . 36) (34 . 40) (36 . 44))
  "This list is used to store matching (englis . chinese) font-size.")

(defun emacs-step-font-size (step)
  "Increase/Decrease emacs's font size."
  (let ((scale-steps emacs-font-size-pair-list))
    (if (< step 0) (setq scale-steps (reverse scale-steps)))
    (setq emacs-font-size-pair
          (or (cadr (member emacs-font-size-pair scale-steps))
              emacs-font-size-pair))
    (when emacs-font-size-pair
      (message "emacs font size set to %.1f" (car emacs-font-size-pair))
      (set-font-from-list en-font-list chn-font-list emacs-font-size-pair))))

(defun increase-emacs-font-size ()
  "Decrease emacs's font-size acording emacs-font-size-pair-list."
  (interactive) (emacs-step-font-size 1))

(defun decrease-emacs-font-size ()
  "Increase emacs's font-size acording emacs-font-size-pair-list."
  (interactive) (emacs-step-font-size -1))

;; Setup font size based on emacs-font-size-pair
(set-font-from-list en-font-list chn-font-list emacs-font-size-pair )

(provide 'init-fonts)
					; {%org-mode%}
					; here are 20 hanzi and 40 english chars, see if they are the same width
					; 你你你你你你你你你你你你你你你你你你你你
					; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
					; /aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/
					; {%/org-mode%}

					; Local Variables:
					; eval: (mmm-mode 1)
					; End:
