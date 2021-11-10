;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Rohan Goyal "
      user-mail-address "goyal.rohan.03@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Keybindings
(map! "C-s"
      (cmd! (save-buffer)))

(map! "C-+"
      (cmd! (text-scale-increase)))
(map! "C--"
     (cmd! (text-scale-decrease)))

(map! "M-e"
      (cmd! (command-execute 'execute-extended-command)))
(map! "M-q"
      (cmd! (command-execute 'consult-buffer)))

(map! "M-o"
      (cmd! (command-execute 'other-window)))

(map! "C-M-v"
      (cmd! (visual-line-mode)))

(map! (:after 'ox-latex
       :map org-mode-map
       "M-f M-c" #'org-latex-export-to-pdf))

(map! :leader
      (:prefix-map ("b" . "buffer")
       :desc "Consult Switch Buffer" "b" #'consult-buffer))


(map! :leader
      (:prefix-map ("c" . "code")
       :desc "Comment Lines" "l" #'evilnc-comment-or-uncomment-lines))
; Mode declarations
(auto-save-visited-mode)
(global-visual-line-mode t)
(global-undo-tree-mode t)
(cua-mode 1)
;; (desktop-read)
(desktop-save-mode 1)

; Misc variable modifications
(add-to-list 'auto-mode-alist '("[.]org[.]txt\\'" . org-mode))
;; (add-to-list 'auto-mode-alist '("^/home/rohan/[.]xonshrc\\''" . xonsh-mode))
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "--simple-prompt --pprint")
(setq confirm-kill-emacs nil)

(after! 'ox-latex

  (add-to-list 'org-latex-classes
               '("extarticle"
                 "\\documentclass{extarticle}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

  (add-to-list 'org-latex-classes
               '("mla"
                 "\\documentclass{mla}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))


; Hooks
(add-hook 'text-mode-hook #'auto-save-visited-mode)
(add-hook 'text-mode-hook #'visual-line-mode)
(add-hook 'text-mode-hook #'hl-todo-mode)

;; (add-hook 'prog-mode-hook #'rainbow-mode)
;; (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'auto-save-visited-mode)
(add-hook 'prog-mode-hook #'hl-todo-mode)

(add-hook 'org-mode-hook #'visual-line-mode)
(add-hook 'org-mode-hook #'auto-save-visited-mode)
;; (add-hook 'org-mode-hook #'wc-mode)
(add-hook 'org-mode-hook #'org-indent-mode)

;; (add-hook 'python-mode-hook #'sphinx-doc-mode)
;; (add-hook 'python-mode-hook #'anaconda-mode)
;; (add-hook 'python-mode-hook #'elpy-mode)
(add-hook 'markdown-mode-hook #'auto-save-visited-mode)
(add-hook 'markdown-mode-hook #'visual-line-mode)

(add-hook 'nov-mode-hook #'visual-line-mode)
(add-hook 'nov-mode-hook #'visual-fill-column-mode)

(add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
(add-hook 'lisp-interaction-mode-hook #'eldoc-mode)
(add-hook 'ielm-mode-hook #'eldoc-mode)


;; Stuff from
(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?
      ;; scroll-preserve-screen-position 'always     ; Don't have `point' jump around
      scroll-margin 2)                            ; It's nice to maintain a little margin

(display-time-mode 1)                             ; Enable time in the mode-line

(unless (string-match-p "^Power N/A" (battery))   ; On laptops...
  (display-battery-mode 1))                       ; it's nice to know how much power you have

(global-subword-mode 1)                           ; Iterate through CamelCase words

(setq-default major-mode 'org-mode)
(setq display-line-numbers-type 'relative)
