;;; lifeline-mode.el --- LifeLines code editing commands for Emacs

;; Copyright (C) 2026, N. Strauss

;; Maintainer: N. Strauss <strauss@positive-internet.com>
;; Keywords: unix, languages

;; To enter lifeline-mode automatically, add (autoload 'lifeline-mode "lifeline-mode")
;; to your .emacs file and change the first line of your lines script to:
;; /* -*-lifelines-*- */
;;
;; To handle files included with do 'filename.ll';, add something like
;; (setq auto-mode-alist (append (list (cons "\\.ll\\'" 'lifeline-mode))
;;                               auto-mode-alist))
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

(define-derived-mode lifeline-mode c-mode "lifeLine"
  "Major mode for lifeline reports."
  :abbrev-table lifeline-mode-abbrev-table
  (setq font-lock-defaults '(lifeline-highlights))
  (setq-local comment-start "/*")
  (setq-local comment-end "*/")
  (setq-local comment-start-skip "#+[\t ]*")
  ;; (setq-local indent-line-function #'lifeline-indent-line)
  (setq-local indent-tabs-mode t)
)

(setq lifeline-highlights
      '(("\\<\\w+\\>(" . 'font-lock-function-name-face)
        ("(\\([^<]+?\\))" . (1 'font-lock-constant-face))
	("\\/\\*\\(.\\|[\n]\\)*?\\*\\/" . 'font-lock-comment-face)
	)     
      )

(defvar lifeline-mode-abbrev-table nil "Abbrev table in use in lifeline-mode buffers.")
