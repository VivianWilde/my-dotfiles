;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

                                        ; Place your private configuration here! Remember, you do not need to run 'doom
                                        ; sync' after modifying this file!

;;; Name
                                        ; Some functionality uses this to identify you,
                                        ;
                                        ;e.g. GPG configuration, email
                                        ; clients, file templates and snippets.
(setq user-full-name "Vivien Moriarty"
      user-mail-address "goyal.rohan.03@gmail.com"
      )


;;; Theming/Fonts
                                        ; Doom exposes five (optional) variables for controlling fonts in Doom. Here
                                        ; are the three important ones:
                                        ;
                                        ; + `doom-font'
                                        ; + `doom-variable-pitch-font'
                                        ; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
                                        ;   presentations or streaming.
                                        ;
                                        ; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
                                        ; font string. You generally only need these two:
                                        ; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
                                        ;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

                                        ; There are two ways to load a theme. Both assume the theme is installed and
                                        ; available. You can either set `doom-theme' or manually load a theme with the
                                        ; `load-theme' function. This is the default:
(setq doom-theme 'doom-magnus)
                                        ; (setq doom-theme 'doom-Iosvkem) Nope
                                        ; (setq doom-theme 'doom-moonlight) Nope
                                        ; (setq doom-theme 'doom-vibrant)
                                        ; (setq doom-theme 'doom-genderfluid)
(setq doom-theme 'doom-ir-black) NO
                                        ; (setq doom-theme 'doom-wilmersdorf)
                                        ; (setq doom-theme 'poet-dark)
                                        ; (setq doom-theme 'doom-homage-black) NO

                                        ; (setq doom-theme 'doom-tomorrow-night) NO

(setq doom-Iosvkem-brighter-comments t)

;;; Vars
                                        ; If you use `org' and don't want your org files in the default location below,
                                        ; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org")

                                        ; This determines the style of line numbers in effect. If set to `nil', line
                                        ; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;;; Dashboard Setup
(setq fancy-splash-image "/home/vivien/Downloads/resized-one.png")

(defun one-one-quote ()
  (let* ((path "/home/vivien/config/fortunes/one-one")
         (oddnum (lambda (upper) (+ 1 (* 2 (random (/ upper 2))))))
         (line (funcall oddnum 51))
         (cmd (format "sed '%dq;d' %s" line path))
         )
    (shell-command-to-string cmd)
    )
  )

(defun message-one-one ()
  "Display a One-One quote in the minibuffer"
  (interactive)
  (message (one-one-quote)))

(defun dashboardify (fn)
  "Call TXTFN, and wrap the result in a func that displays it nicely in doom-dashboard"
  (lambda () (insert (+doom-dashboard--center (- +doom-dashboard--width 1) (propertize (funcall fn) 'face 'bold-italic 'align 'center))) (insert hard-newline))
  )


(defun get-good-fortune ()
  (let* ((possibles (list "calvin" "discworld" "hitchhiker" "montypython"))
         (choice (nth (random (length possibles)) possibles))
         (command (format "fortune %s" choice))
         (txt (shell-command-to-string command)))
    txt

    )
  )

(defun dashboard-fortune ()
  (insert (+doom-dashboard--center (- +doom-dashboard--width 1) (get-good-fortune) ))
  (insert hard-newline)
  )

(setq +doom-dashboard-functions `(
                                  doom-dashboard-widget-banner
                                  ,(dashboardify #'one-one-quote)
                                  dashboard-fortune
                                  doom-dashboard-widget-shortmenu
                                  doom-dashboard-widget-footer))

                                        ; Here are some additional functions/macros that could help you configure Doom:
                                        ;
                                        ; - `load!' for loading external *.el files relative to this one
                                        ; - `use-package!' for configuring packages
                                        ; - `after!' for running code after a package has loaded
                                        ; - `add-load-path!' for adding directories to the `load-path', relative to
                                        ;   this file. Emacs searches the `load-path' when you load packages with
                                        ;   `require' or `use-package'.
                                        ; - `map!' for binding new keys
                                        ;
                                        ; To get information about any of these functions/macros, move the cursor over
                                        ; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
                                        ; This will open documentation for it, including demos of how they are used.
                                        ;
                                        ; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
                                        ; they are implemented.


;;;; Probably Tecosaur
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
                                        ; (setq-default major-mode 'org-mode)
(setq-default major-mode 'fundamental-mode)


;;; Keybindings
(defalias 'normal-paste 'clipboard-yank)
(defalias 'normal-copy 'clipboard-kill-ring-save)
(defalias 'normal-cut 'clipboard-kill-region)
(map! :i "M-W" #'normal-copy)
(map! :i "C-W" #'normal-cut)
(map! :i "C-Y" #'normal-paste)
(map! :nvieo "C-c 1" #'sp-unwrap-sexp)

(map! :nvieo "C--" (cmd! (text-scale-decrease 1)))
(map! :nvieo "C-+" (cmd! (text-scale-increase 1)))



(after! evil
  (map! :nvieo "C-n" #'next-line)
  (map! :nvieo "C-p" #'previous-line)
  (setq evil-want-keybinding  't)
  (setq +evil-want-o/O-to-continue-comments nil)
  (setq evil-want-empty-ex-last-command t)
  )

(after! lispy
  (map! :map lispy-mode-map "[" #'self-insert-command)
  (map! "M-k" #'kill-sexp)
  (map! "M-K" #'copy-sexp-as-kill)
  )

(map! "M-K" #'copy-sexp-as-kill)

(map!
 :map org-mode-map
 :nvieo
 "M-p" #'org-latex-export-to-pdf)

(map! :nvieo "C-'" #'imenu-list-smart-toggle)

(map! :leader
      (:prefix-map ("c" . "code")
       :desc "Comment Lines" "l" #'comment-line
       :desc "Run Make Task" "m" #'+make/run-last))


(map! :map ctl-x-map
      "d" #'ranger)
; (global-set-key [remap doom/delete-frame-with-prompt] #'delete-frame)


;;;; Vertico
(when (modulep! :completion vertico)
  (map! :leader
        (:prefix-map ("b" . "buffer")
         :desc "Consult Buffer" "b" #'consult-buffer)
        (:prefix-map ("s" . "search")
         :desc "Consult Imenu All"
         "I" #'consult-imenu-all
         :desc "Consult Ripgrep"
         "R" #'consult-ripgrep)
        (:prefix-map ("f" . "file")
         :desc "Open File Externally" "o" #'consult-file-externally
         :desc "Open 61C File" "c" #'open-hive-file
         :desc "Open File in HOME" "h" #'find-file-home
         :desc "Open File Manager Here" "." #'filemanager-here
         )
        ("SPC" #'consult-buffer)
        (:prefix-map ("i" . "insert")
         :desc "Insert file path"
         "P" #'insert-path)
        )
  )


;;; Helm
                                        ; (when (modulep! :completion helm)
                                        ;   (map! :leader
                                        ;         (:prefix-map ("b" . "buffer")
                                        ;          :desc "Buffer" "b" #'helm-mini)
                                        ;         (:prefix-map ("s" . "search")
                                        ;          :desc "Imenu All"
                                        ;          "I" #'helm-imenu-in-all-buffers
                                        ;          :desc "Consult Ripgrep"
                                        ;          "R" #'consult-ripgrep)
                                        ;         (:prefix-map ("f" . "file")
                                        ;          :desc "Consult ls" "f" #'consult-ls-git
                                        ;          :desc "Open File Externally" "o" #'consult-file-externally
                                        ;          :desc "Open File in HOME" "h" #'find-file-at-home)
                                        ;         ("SPC" #'helm-mini)
                                        ;         (:prefix-map ("i" . "insert")
                                        ;          :desc "Insert file path"
                                        ;          "P" #'insert-path)
                                        ;         )

                                        ;   )




;;;; Custom Key Groups

;;;;; Spotify
(map!
 :leader (:prefix-map ("a" . "Music")
          :desc "Next Track" "l" #'counsel-spotify-next
          :desc "Previous Track" "h" #'counsel-spotify-previous
          :desc "Play/Pause" "/" #'counsel-spotify-toggle-play-pause
          :desc "Playlist" "p" #'counsel-spotify-search-playlist
          :desc "Album" "a" #'counsel-spotify-search-album
          :desc "Track" "t" #'counsel-spotify-search-track
          :desc "Tracks by Album" "A" #'counsel-spotify-search-tracks-by-album
          :desc "Artist" "m" #'counsel-spotify-search-tracks-by-artist
          :desc "My Playlists"))

;;;;; D&D Keys
(map!
 :leader
 (:prefix-map ("d" . "D&D")
  :desc "Lookup in PDFs" "l" #'org-lookup-dnd-at-point
  :desc "Lookup in API" "a" #'dnd5e-api-search
  :desc "Roll d20" "d" #'org-d20-d20
  :desc "Roll dice" "r" #'org-d20-roll
  :desc "Lookup in local SRD" "s" #'dnd-search-srd
  :desc "Roll on the Wild Magic table" "w" #'dnd-wild-magic-roll
  :desc "Flip a Binary Coin" "f" #'coin-flip
  )
 (:prefix-map ("l" . "Lookup in API")
  :desc "Monsters" "m m" #'dnd5e-api-search-monsters
  :desc "Spells" "s" #'dnd5e-api-search-spells
  :desc "Races" "r a" #'dnd5e-api-search-races
  :desc "Rules" "r u" #'dnd5e-api-search-rules
  :desc "Features" "f" #'dnd5e-api-search-features
  :desc "Traits" "t" #'dnd5e-api-search-traits
  :desc "Classes" "c l" #'dnd5e-api-search-classes
  :desc "Equipment" "e" #'dnd5e-api-search-equipment
  :desc "Languages" "l" #'dnd5e-api-search-languages
  :desc "Conditions" "c o" #'dnd5e-api-search-conditions
  :desc "Magic Items" "m i" #'dnd5e-api-search-magic-items
  :desc "Rule Sections" "r s" #'dnd5e-api-search-rule-sections
  :desc "Generic" "RET" #'dnd5e-api-search)

 (:prefix-map ("r" . "Recreation")
  :desc "Display Fortune" "f" #'display-fortune
  :desc "Display One-One Quote" "o" #'message-one-one
  )

 )



;;; Mode declarations
(lisp-extra-font-lock-global-mode 1)
(auto-save-visited-mode 1)
(global-visual-line-mode 1)
(global-undo-tree-mode 1)
(global-origami-mode 1)
(smartparens-global-mode 1)
(show-smartparens-global-mode 1)
(smartparens-global-strict-mode 1)
(ranger-override-dired-mode t)


;;; Misc variable modifications
(sp-use-paredit-bindings)
(add-to-list 'Info-directory-list "/home/rohan/drive/books/nonfic/sicp-texinfo" t)
(add-to-list 'load-path "/home/rohan/.config/doom/local-packages")
(add-to-list 'auto-mode-alist '("[.]org[.]txt\\'" . org-mode))
(add-to-list 'auto-mode-alist '("[.]org[.]txt\\'" . org-mode))
(setq suggest-key-bindings nil)
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "--simple-prompt --pprint")
                                        ; (setq helm-swoop-pre-input-function (lambda () ""))
(setq history-delete-duplicates t)
(setq smudge-transport 'connect)
(setq ranger-override-dired 'ranger)


;;; Package Configuration
(after! consult
                                        ; Make consult-imenu-multi work like an imenu in all org buffers, basically. Fun.
    (setq
   consult-ripgrep-args "rga --null --line-buffered --color=never --max-columns=1000 --path-separator /   --smart-case --no-heading --line-number ."
   consult-grep-args "egrep --null --line-buffered --color=never --ignore-case   --exclude-dir=.git --line-number -I -r .")

  (consult-customize consult-recent-file consult-find-file consult-buffer :preview-key 'any)

  (consult-customize find-file :preview-key (list :debounce 0.2 'any))
  )

(after! vertico
  (setq! vertico-count 4))

(after! imenu-list
  (setq imenu-list-focus-after-activation t
        imenu-list-position 'left
        imenu-list-size 0.25)
  )

(after! vterm
  (setq vterm-shell "/bin/xonsh"))


(after! projectile
  (setq projectile-project-root-files-bottom-up
        (remove ".git" projectile-project-root-files-bottom-up)))



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
  (add-to-list 'LaTeX-section-list '("Question" 1))
  (add-to-list 'LaTeX-section-list '("Part" 2))
  (add-to-list 'LaTeX-section-list '("cvsubsection" 3))
  (add-to-list 'LaTeX-section-list '("cvsubsubsection" 4))
  )
(after! litex-mode
  (add-to-list 'litex-latex-functions 'sqrt)
  (setq litex-math-brackets-end "\\right)"
        litex-math-brackets-start "\\left("
        litex-format-float-string "%.1f"
        ))

(after! undo-tree


  (setup-undo-tree)
  (add-hook 'org-mode-hook 'setup-undo-tree)
  )

;;;; Org Config
(after! org
  (sp-local-pair '(org-mode) "`" "'")
  (sp-local-pair '(org-mode) "``" "''")
  (setq org-pretty-entities t)
  (setq org-read-date-popup-calendar nil)
  (add-hook! 'org-mode-hook 'org-indent-mode)
  (add-hook! 'org-mode-hook (lambda () (git-gutter-mode -1)))
  ; (add-hook! 'org-mode-hook 'variable-pitch-mode)
  (add-hook! 'org-mode-hook 'turn-off-smartparens-strict-mode)
  (setq org-list-demote-modify-bullet
        '(("+" . "-") ("-" . "+") ("*" . "+")))
  ; (setq org-edit-src-auto-save-idle-delay 300)
  (setq org-insert-heading-respect-content nil)
  (map! :map org-mode-map :localleader
        (:prefix ("s" . "tree/subtree")
         :desc "Copy Tree" "c" #'org-copy-subtree
         :desc "Clone Tree" "C" #'org-clone-subtree-with-time-shift)
        (:prefix ("l" . "links" )
         :desc "Insert Link to Heading" "h" #'my/org-insert-heading-link

         )
        "&" #'org-mark-ring-goto
        )
  (use-package! org-pandoc-import)
  )


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

  (add-to-list 'org-latex-classes
               '("dndbook"
                 "\\documentclass{extarticle}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))


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



(after! org-lookup-dnd
  (setq!
   completion-ignore-case t
   org-lookup-dnd-sources
   '(
     ("/home/rohan/drive/RPG/5e/core/phb.pdf" 1 4 4 t)
     ("/home/rohan/drive/RPG/5e/core/Monster Manual.pdf" 1 4 4 nil)
     ("/home/rohan/drive/RPG/5e/core/dmg.pdf" 1 1 1 t)
     ("/home/rohan/drive/RPG/5e/unofficial/City_and_Wild.pdf" 0 2 2 nil)
     ("/home/rohan/drive/RPG/5e/expansion/Volo's Guide to Monsters.pdf" 1 1 1 t)
     ("/home/rohan/drive/RPG/5e/expansion/mordenkainens-tome-of-foes.pdf" 1 1 1 t)
     ("/home/rohan/OneDrive_Personal/RPG/5e/character options/COFSA The Compendium of Forgotten Secrets - Awakening (Abridged).pdf" 0 3 3 t)
     ))
  )
;;;; Programming Language Config
(after! coffee-mode
  (set-company-backend! 'coffee-mode
    '(company-yasnippet :with company-dabbrev)))

(after! geiser
  (setq geiser-scheme-implementation 'mit)
  (add-hook! 'scheme-mode-hook #'run-geiser))

(after! clojure-mode
  (add-hook! 'clojure-mode-hook (lambda (cider-jack-in-clj nil))))

(after! matlab-mode
  (defun matlab-mode-vf-functionname (&optional fast) ()))



;;; Doom-specific config
(set-popup-rule! (rx bol "*dnd5e-api-results") :size 0.3 :quit t :select t :ttl nil)
(setq doom-scratch-initial-major-mode 'org-mode)
(setq doom-font (font-spec :family "Source Code Pro" :size 14)) ;; 14 if not monitr

(setq doom-variable-pitch-font (font-spec :family "Latin Modern Roman" :size 14))
(defalias 'doom/delete-frame-with-prompt 'delete-frame)

(after! doom-modeline
  (setq doom-modeline-support-imenu t)
  (setq doom-modeline-hud t)
  (setq doom-modeline-unicode-fallback t)
  (setq doom-modeline-enable-word-count t)
  (setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))
  (setq doom-modeline-buffer-encoding nil)
  (setq doom-modeline-env-version t)
  (setq doom-modeline-project-detection 'auto)
  (let* ((vi (propertize " Vivien 🏳️‍🌈 " 'face 'bold-italic))
         (flag-names (reverse (list "asexual" "nonbinary" "gender-queer" "transgender" "pride")))
         (flags (-map (lambda (name) (make-pride-flag name (format "/home/vivien/Downloads/pride-emoji-flags/png/%s-flag.png" name))) flag-names)))
    (add-to-list 'mode-line-misc-info vi)
    (-map (lambda (flag) (add-to-list 'mode-line-misc-info flag) (add-to-list 'mode-line-misc-info " " nil (lambda (x y) nil))) flags)
    ))


;;; Secrets
(after! canvas-emacs
  (setq
   canvas-baseurl "https://bcourses.berkeley.edu"
   canvas-token "1072~RY8ay1gYwkn5niL77AKGZnwg9KNWj9ywNabDFAFs5ZBvlwggHcIajMgmGrL2tftR"))
(setq counsel-spotify-client-id "5ce31a3c706e4f1db765a5d064429202"
      counsel-spotify-client-secret "40b1c9bb956e4dd2aa72287e8b0c4a06"
      smudge-oauth2-client-id "2be412c6f3014dde8ed52f4b9756757e"
      smudge-oauth2-client-secret "c29a8c121421479eb46d16d23291efba")




;;; Enable folding
(setq lsp-enable-folding t)
(use-package! lsp-origami)
(add-hook! 'lsp-after-open-hook #'lsp-origami-try-enable)


;;; Hooks
(add-hook! 'doom-init-ui-hook (lambda () (defalias 'doom/delete-frame-with-prompt 'delete-frame)))
(add-hook! 'pdf-tools-enabled-hook #'pdf-view-midnight-minor-mode)
(add-hook! pdf-tools-enabled-hook #'hide-mode-line-mode)

;;;; Prose
(add-hook! 'text-mode-hook #'auto-save-visited-mode)
(add-hook! 'text-mode-hook #'visual-line-mode)
(add-hook! 'text-mode-hook #'hl-todo-mode)

; (add-hook 'org-mode-hook #'wc-mode)
; (add-hook 'org-mode-hook #'org-indent-mode)

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
; (add-hook! 'emacs-lisp-mode-hook #'sotlisp-mode)

;;;; Smartparens
; (add-hook! 'smartparens-mode-hook #'evil-cleverparens-mode)
(add-hook! 'smartparens-mode-hook #'evil-smartparens-mode)
(add-hook! 'smartparens-disabled-hook (lambda () (evil-smartparens-mode -1)))
; (add-hook! 'smartparens-disabled-hook (lambda () (evil-cleverparens-mode -1)))

;;;; Python
(use-package! sphinx-doc)
(add-hook! 'python-mode-hook #'sphinx-doc-mode)





;;; Custom Functions

;;;; Consult
(defun find-file-home ()
  "Find a file starting at the home directory"
  (interactive)
  (consult-find-file (read-file-name "Find file: " "~/"))
  )



(defun consult-find-file (file)
  "Open FILE."
  (interactive "fFind File: ")
  (follow-mode 1)
  (find-file (expand-file-name file))
  (follow-mode -1)
  )

(defun consult-file-externally (file)
  "Open FILE using system's default application."
  (interactive "fOpen: ")
  (if (and (eq system-type 'windows-nt)
           (fboundp 'w32-shell-execute))
      (w32-shell-execute "open" target)
    (call-process (pcase system-type
                    ('darwin "open")
                    ('cygwin "cygstart")
                    (_ "xdg-open"))
                  nil 0 nil
                  (expand-file-name file))))

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
        ; (funcall (in-folder dir #'consult-ripgrep))
        (consult-ripgrep dir)
        )))




(defun open-hive-file ()
  "Open file stored on 61C Hive Machine"
  (interactive)
  (find-file (read-file-name "File: " "/ssh:hive7.cs.berkeley.edu:/home/cc/cs61c/sp23/class/cs61c-afw/"))
  )


;;;; S-Expressions
(defun yank-sexp ()
  "Copy sexp at point"
  (mark-sexp)
  (kill-ring-save)
  )

(defun copy-sexp-as-kill (&optional arg)
  "Save the sexp following point to the kill ring.
ARG has the same meaning as for `kill-sexp'."
  (interactive "p")
  (save-excursion
    (let ((orig-point (point)))
      (forward-sexp (or arg 1))
      (kill-ring-save orig-point (point)))))





;;;; D&D
(defun dnd-search-srd ()
  "Search markdown SRD"
  (interactive)
  (let (
        (consult-ripgrep-args "rg --glob !*.pdf --null --line-buffered --color=never --max-columns=1000 --path-separator /   --smart-case --no-heading --line-number .")
        )
    (consult-ripgrep "~/drive/RPG/5e/5e-srd-split"))
  )

(defun dnd-wild-magic-roll ()
  "Roll on Wild Magic table, report result in echo area"
  (interactive)
  (let* ((l (+ 2 (random 249)))
         (fname "~/drive/RPG/5e/5e-srd-split/wild-magic.md")
         (cmd (format "sed '%dq;d' %s" l fname))
         )
    (message (shell-command-to-string cmd))))

(defun coin-flip ()
  (interactive)
  (message (if (zerop (mod (random 10000) 2))
               "Heads (1)" "Tails (0)")))



(defun set-lang-mode (lang)
  "Set language mode to the specified LANG"
  (set-language-environment (s-capitalize lang))
  (ispell-change-dictionary (s-downcase lang)))

(defun set-english ()
  "Set lang environment to english"
  (interactive)
  (set-lang-mode "english"))
(defun set-spanish ()
  "Set language environment to spanish"
  (interactive)
  (set-lang-mode "spanish"))

;;;; Fun
(defun display-fortune ()
  (interactive)
  (message (get-good-fortune))
  )

(defun dup (str)
  "Used in some themes for convenience"
  (list str str nil))

(defun make-pride-flag (str path)
  "STR must be distinct each call"
  (propertize str 'display (create-image path 'png nil :scale 0.06)))




(defun org-blockify-comment (region)
  ;; Basically, take a bunch of # comments, and place them inside a block
  ;; Process: Wrapped in save-excursion: Construct region, call uncomment on region, mark it, insert comment structure template.
  )

(defun find-commented-region (start comment-char)
  )


(defun update-alist ()
  (interactive)
  (let* (
         (new-alist '(("\\R" . 8477)
                      ("\\N" . 8469)
                      ("\\Z" . 8484)
                      ("\\C" . 8450)
                      ("\\implies" . 8658)
                      ("\\land" . 8743)
                      ("\\lor" . 8744)
                      ("\lnot" . 172))))
    (TeX-add-to-alist 'prettify-symbols-alist new-alist)
    )

  )
(defun filemanager-here ()
  (interactive)
  (start-process "nemo" nil "nemo" (file-name-directory buffer-file-name))
  )

  (defun my/org-headings ()
    "Get the list of headings in an org buffer. Keys are full paths, vals are plain strings"
    (let* (
           (paths (--map  (s-chop-right 1 (org-no-properties it)) ( consult-org--headings nil nil 'file)))
           (table (ht-create))
           )
      (--map (ht-set! table it (car (last (s-split "/" it)))) paths)
      table
      )
    ; (last (s-split "/" (s-chop-right 1 (org-no-properties it))))
    )

  (defun my/org-insert-heading-link ()
    (interactive)
    "Let user select a heading from the buffer, insert a link to it at point"
    (let* (
           (file (buffer-name))
           (heading-table (my/org-headings))
           (heading (completing-read "Select a heading: " heading-table  nil nil))
           (simplified-heading (ht-get heading-table heading))
           (link (format "[[file:%s::*%s]]" file simplified-heading))
           )
      (insert link)

      )
    )

(defun setup-undo-tree ()
    (setq undo-outer-limit 24000000)
    (setq undo-limit 160000)
    (setq undo-strong-limit 240000)
    )


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




(defun insert-path ()
  (interactive)
  (insert (read-file-name "File: "))
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

                                        ; From Tecosaur, allows LSP to work in source blocks
(cl-defmacro lsp-org-babel-enable (lang)
  "Support LANG in org source code block."
  ;; (setq centaur-lsp 'lsp-mode)
  (cl-check-type lang stringp)
  (let* ((edit-pre (intern (format "org-babel-edit-prep:%s" lang)))
         (intern-pre (intern (format "lsp--%s" (symbol-name edit-pre)))))
    `(progn
       (defun ,intern-pre (info)
         (let ((file-name (->> info caddr (alist-get :file))))
           (unless file-name
             (setq file-name (make-temp-file "babel-lsp-")))
           (setq buffer-file-name file-name)
           (lsp-deferred)))
       (put ',intern-pre 'function-documentation
            (format "Enable lsp-mode in the buffer of org source block (%s)."
                    (upcase ,lang)))
       (if (fboundp ',edit-pre)
           (advice-add ',edit-pre :after ',intern-pre)
         (progn
           (defun ,edit-pre (info)
             (,intern-pre info))
           (put ',edit-pre 'function-documentation
                (format "Prepare local buffer environment for org source block (%s)."
                        (upcase ,lang))))))))
(defvar org-babel-lang-list
  '("go" "python" "ipython" "bash" "sh" "elixir" "ruby"))
(dolist (lang org-babel-lang-list)
  (eval `(lsp-org-babel-enable ,lang)))

