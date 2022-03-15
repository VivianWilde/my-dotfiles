;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;;; Primitive Setup
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Rohan Goyal "
      user-mail-address "goyal.rohan.03@gmail.com")

;;; Theming/Fonts
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
(setq doom-theme 'doom-city-lights)
(setq doom-city-lights-brighter-comments t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


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


;;; Probably Tecosaur
(setq-default
 delete-by-moving-to-trash t            ; Delete files to trash
 window-combination-resize t ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 20000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?
      scroll-margin 2)
(display-time-mode 1) (display-battery-mode 0) (global-subword-mode 1)
(setq-default major-mode 'org-mode)


;;; Keybindings
(defalias 'normal-paste 'clipboard-yank)
(defalias 'normal-copy 'clipboard-kill-ring-save)
(defalias 'normal-cut 'clipboard-kill-region)
(map! :i "M-W" #'normal-copy)
(map! :i "C-W" #'normal-cut)
(map! :i "C-Y" #'normal-paste)

(map! :nvieo "C--" (cmd! (text-scale-decrease 1)))
(map! :nvieo "C-+" (cmd! (text-scale-increase 1)))


(after! evil
  (map! :nvieo "C-n" #'next-line)
  (map! :nvieo "C-p" #'previous-line)
  (setq evil-want-keybinding  't)
  (setq +evil-want-o/O-to-continue-comments nil)
  (setq evil-want-empty-ex-last-command 't)
  )

(map!
 :map org-mode-map
 :nvieo
 "M-p" #'org-latex-export-to-pdf)

(map! :nvieo "C-'" #'imenu-list-smart-toggle)

;;;; Vertico
(when (featurep! :completion vertico)
  (map! :leader
        (:prefix-map ("b" . "buffer")
         :desc "Consult Buffer" "b" #'consult-buffer)
        (:prefix-map ("s" . "search")
         :desc "Consult Imenu All"
         "I" #'consult-imenu-all)
        (:prefix-map ("s" . "search")
         :desc "Consult Ripgrep"
         "R" #'consult-ripgrep)
        (:prefix-map ("f" . "file")
         :desc "Open File Externally"
         "o" #'consult-file-externally)
        ("SPC" #'consult-buffer)
        ))


(map! :leader
      (:prefix-map ("c" . "code")
       :desc "Comment Lines" "l" #'comment-line
       :desc "Run Make Task" "m" #'+make/run-last))


(map! :map ctl-x-map
      "d" #'ranger)
;; (global-set-key [remap doom/delete-frame-with-prompt] #'delete-frame)

;; Make it easier to run make tasks

;;;; Custom Key Groups





                                        ;;; Mode declarations
(lisp-extra-font-lock-global-mode 1)
(global-hide-mode-line-mode 1)
(nano-modeline-mode 1)
(auto-save-visited-mode 1)
(global-visual-line-mode 1)
(global-undo-tree-mode 1)
(global-origami-mode 1)
(smartparens-global-mode 1)
(show-smartparens-global-mode 1)
(smartparens-global-strict-mode 1)
(ranger-override-dired-mode t)


;;; Misc variable modifications
(add-to-list 'load-path "/home/rohan/.config/doom/local-packages")
(add-to-list 'auto-mode-alist '("[.]org[.]txt\\'" . org-mode))
(add-to-list 'auto-mode-alist '("[.]org[.]txt\\'" . org-mode))
(setq suggest-key-bindings nil)
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "--simple-prompt --pprint")
;; (setq helm-swoop-pre-input-function (lambda () ""))
(setq history-delete-duplicates t)
(setq ranger-override-dired 'ranger)


;;; Package Configuration
(after! consult
  ;; Make consult-imenu-multi work like an imenu in all org buffers, basically. Fun.
  (defun in-folder (path func)
    "A wrapper which takes in a consult func which operates on a project root and makes it operate on the home folder."
    (lambda (&optional &rest args)
      (interactive)
      (let ((consult-project-root-function (lambda () (expand-file-name path))))
        (apply func args)
        )))

  (defalias #'everywhere (lambda  (f) (in-folder "~" f)))
  (defalias #'consult-imenu-all (everywhere #'consult-imenu-multi))
  (defalias #'consult-ripgrep-all (everywhere #'consult-ripgrep))
  (defalias #'consult-ripgrep-in
    (lambda ()
      (interactive)
      (let ((dir (read-file-name "Directory: ")))
        (funcall (in-folder dir #'consult-ripgrep)))))
  (setq
   consult-ripgrep-args "rga --null --line-buffered --color=never --max-columns=1000 --path-separator /   --smart-case --no-heading --line-number ."
   consult-grep-args "egrep --null --line-buffered --color=never --ignore-case   --exclude-dir=.git --line-number -I -r ."))

(after! vertico
  (setq! vertico-count 4))

(after! imenu-list
  (setq imenu-list-focus-after-activation t
        imenu-list-position 'left
        imenu-list-size 0.25)
  )

(after! hl-todo
  (setq hl-todo-keyword-faces
        '(
          ("TODO" . "#dc752f")
          ("NEXT" . "#dc752f")
          ("THEM" . "#2d9574")
          ("PROG" . "#4f97d7")
          ("OKAY" . "#4f97d7")
          ("DONT" . "#f2241f")
          ("FAIL" . "#f2241f")
          ("DONE" . "#86dc2f")
          ("NOTE" . "#b1951d")
          ("KLUDGE" . "#b1951d")
          ("HACK" . "#b1951d")
          ("TEMP" . "#b1951d")
          ("FIXME" . "#dc752f")
          ("XXX+" . "#dc752f")
          ("\\?\\?\\?+" . "#dc752f")
          ("IDEA" . "#2d9574")
          ("CITE" . "#dc752f")
          ("OBVIOUS" . "#dc752f")
          ("PHRASING" . "#dc752f")
          ("LACKING" . "#dc752f"))))

(after! latex
  (add-to-list 'LaTeX-section-list '("cvsection" 2))
  (add-to-list 'LaTeX-section-list '("cvsubsection" 3))
  (add-to-list 'LaTeX-section-list '("cvsubsubsection" 4))
  )


(sp-use-paredit-bindings)

;;; Doom-specific config

(setq doom-scratch-initial-major-mode 'org-mode)
(setq doom-font (font-spec :family "Source Code Pro" :size 14))

(setq doom-variable-pitch-font (font-spec :family "Merriweather" :size 13))
(defalias 'doom/delete-frame-with-prompt 'delete-frame)


;;; Secrets
(after! canvas-emacs
  (setq
   canvas-baseurl "https://bcourses.berkeley.edu"
   canvas-token "1072~RY8ay1gYwkn5niL77AKGZnwg9KNWj9ywNabDFAFs5ZBvlwggHcIajMgmGrL2tftR"))
(setq counsel-spotify-client-id "5ce31a3c706e4f1db765a5d064429202"
      counsel-spotify-client-secret "40b1c9bb956e4dd2aa72287e8b0c4a06"
      smudge-oauth2-client-id "2be412c6f3014dde8ed52f4b9756757e"
      smudge-oauth2-client-secret "c29a8c121421479eb46d16d23291efba")



                                        ; Enable folding




;;; Org Config
(after! org
  (sp-local-pair '(org-mode) "`" "'")
  (sp-local-pair '(org-mode) "``" "''")
  (setq org-pretty-entities t)
  (add-hook! 'org-mode-hook 'org-indent-mode)
  (add-hook! 'org-mode-hook 'turn-off-smartparens-strict-mode)
  (setq org-list-demote-modify-bullet
        '(("+" . "-") ("-" . "+") ("*" . "+")))
  ;; (setq org-edit-src-auto-save-idle-delay 300)
  (setq org-insert-heading-respect-content nil))


(after! ox-latex
  (setq org-latex-minted-options '(("breaklines")))
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
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
  (add-to-list 'org-latex-classes
               '("altacv"
                 "\\documentclass{altacv}"
                 ("\\section{%s}" . "\\cvsection*{%s}")
                 ("\\subsection{%s}" . "\\cvsubsection*{%s}")
                 ("\\subsubsection{%s}" . "\\cvsubsubsection*{%s}")))


  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (setq org-latex-listings 'minted)

  (setq org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

  (setq org-src-fontify-natively t)
  )


(after! babel
  (add-to-list 'org-babel-tangle-lang-exts '("python" . "py"))
  (add-to-list 'org-babel-tangle-lang-exts '("elixir" . "ex")))




;;; Programming Language Config

(map! :map java-mode-map ";" (cmd! (insert ";") (newline-and-indent)))




(after! coffee-mode
  (set-company-backend! 'coffee-mode
    '(company-yasnippet :with company-dabbrev)))

(after! geiser
  (setq geiser-scheme-implementation 'mit)
  (add-hook! 'scheme-mode-hook #'run-geiser))

;;; Hooks
(add-hook! 'doom-init-ui-hook (lambda () (defalias 'doom/delete-frame-with-prompt 'delete-frame)))



;;;; Prose
(add-hook! 'text-mode-hook #'auto-save-visited-mode)
(add-hook! 'text-mode-hook #'visual-line-mode)
(add-hook! 'text-mode-hook #'hl-todo-mode)

;; (add-hook 'org-mode-hook #'wc-mode)
;; (add-hook 'org-mode-hook #'org-indent-mode)

(add-hook! 'markdown-mode-hook #'auto-save-visited-mode)
(add-hook! 'markdown-mode-hook #'visual-line-mode)

(add-hook! 'nov-mode-hook #'visual-line-mode)
(add-hook! 'nov-mode-hook #'visual-fill-column-mode)


;;;; Programming
(add-hook! 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook! 'prog-mode-hook #'auto-save-visited-mode)
(add-hook! 'prog-mode-hook #'hl-todo-mode)

(add-hook! 'emacs-lisp-mode-hook #'eldoc-mode)
(add-hook! 'emacs-lisp-mode-hook #'nameless-mode)
(add-hook! 'emacs-lisp-mode-hook #'highlight-defined-mode)

(add-hook! 'lisp-interaction-mode-hook #'eldoc-mode)
(add-hook! 'ielm-mode-hook #'eldoc-mode)
;; (add-hook! 'emacs-lisp-mode-hook #'sotlisp-mode)

;;;; Smartparens
;; (add-hook! 'smartparens-mode-hook #'evil-cleverparens-mode)
(add-hook! 'smartparens-mode-hook #'evil-smartparens-mode)
(add-hook! 'smartparens-disabled-hook (lambda () (evil-smartparens-mode -1)))
;; (add-hook! 'smartparens-disabled-hook (lambda () (evil-cleverparens-mode -1)))






;;; Custom Functions







;;; Hacky Fixes
(defun my-evil-fix ()
  "Searching for a number messes up evil for whatever reason. This worked to fix it now, at least"
  (interactive)
  (setq evil-ex-search-history (cdr evil-ex-search-history))
  (setq evil-search-forward-history (cdr evil-ex-search-forward-history))
  (setq evil-ex-history (cdr evil-ex-history)
        )
  (setq evil-ex-search-pattern '("clean" t t))
  )

(defun reset-mode (mode)
  "Mode is a function"
  (funcall mode -1)
  (funcall mode 1)
  )

(defun reset-visual-line ()
  (interactive)
  (reset-mode #'visual-line-mode))

(defun pdf-print-buffer-with-faces (&optional filename)
  "Print file in the current buffer as pdf, including font, color, and
underline information.  This command works only if you are using a window system,
so it has a way to determine color values.

C-u COMMAND prompts user where to save the Postscript file (which is then
converted to PDF at the same location."
  (interactive (list (if current-prefix-arg
                         (ps-print-preprint 4)
                       (concat (file-name-sans-extension (buffer-file-name))
                               ".ps"))))
  (ps-print-with-faces (point-min) (point-max) filename)
  (shell-command (concat "ps2pdf " filename))
  (delete-file filename)
  (message "Deleted %s" filename)
  (message "Wrote %s" (concat (file-name-sans-extension filename) ".pdf")))


(defvar org-babel-lang-list
  '("go" "python" "ipython" "bash" "sh" "elixir" "ruby"))
