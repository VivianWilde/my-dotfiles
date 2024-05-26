;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

                                        ; Place your private configuration here! Remember, you do not need to run 'doom
                                        ; sync' after modifying this file!

;;; Name
                                        ; Some functionality uses this to identify you,
                                        ;
                                        ;e.g. GPG configuration, email
                                        ; clients, file templates and snippets.
(setq user-full-name "Vivien Goyal"
      user-mail-address "vivien.goyal@gmail.com")



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
;; (setq doom-theme 'doom-magnus)
(setq doom-theme 'doom-henna)
;; (setq doom-theme 'doom-dracula)

;; (setq doom-theme 'doom-henna-vi)
;; (setq doom-theme 'doom-henna)
;;(load-theme 'doom-magnus)
;; (setq doom-theme 'doom-nano-dark)
;; (load-theme 'doom-nano-dark)
;; (after! doom-themes
;;   (load-theme 'doom-nano-dark t))
;; (setq doom-theme 'doom-nano-dark )

;; (after! nano-emacs
;;   (setq nano-theme-var "dark")
;;   )

                                        ; (setq doom-theme 'doom-Iosvkem) Nope
                                        ; (setq doom-theme 'doom-moonlight) Nope
                                        ; (setq doom-theme 'doom-vibrant)
                                        ; (setq doom-theme 'doom-genderfluid)
                                        ; (setq doom-theme 'doom-ir-black)
                                        ; (setq doom-theme 'doom-wilmersdorf)
;; (setq doom-theme 'poet-dark)
                                        ; (setq doom-theme 'doom-homage-black) NO
                                        ; (setq doom-theme 'doom-tomorrow-night) NO

(setq doom-Iosvkem-brighter-comments t)

;;; Vars
                                        ; If you use `org' and don't want your org files in the default location below,
                                        ; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org")

                                        ; This determines the style of line numbers in effect. If set to `nil', line
                                        ; numbers are disabled. For relative line numbers, set this to `relative'.


;;; Dashboard Setup
;; (setq fancy-splash-image "/home/vivien/.config/doom/assets/exaltiora-resized.jpg")
(setq fancy-splash-image "/home/vivien/.config/doom/assets/resized-one.png")

(defun one-one-quote ()
  (let* ((path "/home/vivien/.config/doom/fortunes/one-one")
         (oddnum (lambda (upper) (+ 1 (* 2 (random (/ upper 2))))))
         (line (funcall oddnum 51))
         (cmd (format "sed '%dq;d' %s" line path)))

    (shell-command-to-string cmd)))



(defun message-one-one ()
  "Display a One-One quote in the minibuffer"
  (interactive)
  (message (one-one-quote)))

(defun dashboardify (fn)
  "Call TXTFN, and wrap the result in a func that displays it nicely in doom-dashboard"
  (lambda () (insert (+doom-dashboard--center (- +doom-dashboard--width 1) (propertize (funcall fn) 'face 'bold-italic 'align 'center))) (insert hard-newline)))



(defun get-good-fortune ()
  (let* ((possibles (list "calvin" "discworld" "hitchhiker" "montypython"))
         (choice (nth (random (length possibles)) possibles))
         (command (format "fortune %s" choice))
         (txt (shell-command-to-string command)))
    txt))




(defun dashboard-fortune ()
  (insert (+doom-dashboard--center (- +doom-dashboard--width 1) (get-good-fortune)))
  (insert hard-newline))


(setq +doom-dashboard-functions `(
                                  doom-dashboard-widget-banner
                                  ,(dashboardify #'one-one-quote)
                                  ;; ,(dashboardify (lambda () "Audio. Opperior. Vigilo."))
                                  ;; dashboard-fortune
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
(display-time-mode 0) (display-battery-mode 0) (global-subword-mode 1)
                                        ; (setq-default major-mode 'org-mode)
(setq-default major-mode 'text-mode)

(setq display-line-numbers-type t)


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
  (setq evil-want-empty-ex-last-command t))


(after! lispy
  (map! :map lispy-mode-map "[" #'self-insert-command)
  (map! "M-k" #'kill-sexp)
  (map! "M-K" #'copy-sexp-as-kill))


(map! "M-K" #'copy-sexp-as-kill)

(map!
 :map org-mode-map
 :nvieo
 "M-p" #'org-latex-export-to-pdf)

;; (map! :map python-mode-map :nvieo "" )

(map! :nvieo "C-'" #'imenu-list-smart-toggle)


(map! :map ein:notebook-mode-map :localleader
      "a" #'ein:worksheet-execute-all-cells-above)

(map! :leader
      (:prefix ("c" . "code")
       :desc "Comment Lines" "l" #'comment-line
       :desc "Run Make Task" "m" #'+make/run-last))


(map! :map ctl-x-map
      "d" #'ranger)
                                        ; (global-set-key [remap doom/delete-frame-with-prompt] #'delete-frame)


;;;; Vertico

(after! vertico
  (setq! vertico-count 5
         ;; vertico-posframe-mode nil
         )
  )

;; (after! posframe
;;   (setq! vertico-posframe-mode nil))

;; (after! consult
;;   (setq! vertico-posframe-mode nil))

(after! orderless
  ;; (add-to-list 'orderless-matching-styles 'orderless-flex)
  (add-to-list 'completion-styles 'orderless))


;; (after! prescient
;;   (setq vertico-prescient-mode t)
;;   (setq prescient-sort-full-matches-first t)
;;   (setq prescient-sort-full-matches-first t)
;;   (setq vertico-prescient-enable-filtering t)
;;   (setq vertico-prescient-enable-sorting t)
;;   (add-to-list 'completion-styles 'prescient ))

;; (map! :mode scroll-all-mode
;;       )

(when (modulep! :completion vertico)
  (map! :leader
        (:prefix ("b" . "buffer")
         :desc "Consult Buffer" "b" #'consult-buffer
         :desc "Brotab" "t" #'brotab)

        (:prefix ("s" . "search")
         :desc "Consult Imenu All" "I" #'consult-imenu-all
         :desc "Consult Ripgrep" "R" #'consult-ripgrep)

        (:prefix ("f" . "file")
         :desc "Open File Externally" "o" #'consult-file-externally
         :desc "Open 61C File" "c" #'open-hive-file
         :desc "Open File in HOME" "h" #'find-file-home
         :desc "Open File in WORK" "w" #'find-file-work
         :desc "Open File Manager Here" "." #'filemanager-here
         :desc "Annotate File" "a" #'my/enhanced-annotate
         :desc "Search Globally" "g" #'global-hunt)

        (:prefix ("o". "open")
         :desc "Open NeoTree" "n" #'+neotree/open)



        ("SPC" #'consult-buffer)
        (:prefix ("i" . "insert")
         :desc "Insert file path"
         "P" #'insert-path)))

(map! :leader (:prefix ("h" . "help") :desc "TLDR" "T" #'tldr))







;;; Ivy Alexandria
;; TODO
(after! ivy
  (setq ivy-use-virtual-buffers t)
  (setq ivy-file-preview-mode t))


(when (modulep! :completion ivy)
  (map! :leader
        (:prefix("b" . "buffer")
         :desc "Consult Buffer" "b" #'counsel-switch-buffer)
        (:prefix ("s" . "search")
         :desc "Consult Imenu All"
         "I" #'counsel-imenu            ; TODO
         :desc "Consult Ripgrep"
         "R" #'counsel-rg
         "v" #'counsel-set-variable
         :desc "Set Variable")

        (:prefix ("f" . "file")
         :desc "Open File Externally" "o" #'counsel-locate-action-extern
         :desc "Open File in HOME" "h" #'counsel-find-home
         :desc "Open File Manager Here" "." #'filemanager-here)

        ("SPC" #'counsel-switch-buffer)
        (:prefix ("i" . "insert")
         :desc "Insert file path"
         "P" #'insert-path)))



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

;;; Holo-layer
;; (add-to-list 'load-path "~/.config/doom/local-packages/holo-layer")
;; (require 'holo-layer)
;; (holo-layer-enable)





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
          :desc "Artist" "m" #'counsel-spotify-search-tracks-by-artist))

(map!
 :leader (:prefix ("y" . "Yank/Pop/Kill")
          :desc "Yank from Kill Ring" "k" #'consult-yank-from-kill-ring
          )
;;;  TODO
 )

;;;; D&D Keys
(map!
 :leader
 (:prefix ("d" . "D&D")
  :desc "Lookup in PDFs" "l" #'org-lookup-dnd-at-point
  :desc "Lookup in API" "a" #'dnd5e-api-search
  :desc "Roll d20" "d" #'org-d20-d20
  :desc "Roll dice" "r" #'org-d20-roll
  :desc "Lookup in D&D SRD" "s" #'dnd-search-srd
  :desc "Lookup in Cypher SRD" "c" #'cypher-search-srd
  :desc "Roll on the Wild Magic table" "w" #'dnd-wild-magic-roll
  :desc "Flip a Binary Coin" "f" #'coin-flip)

 (:prefix ("l" . "Lookup in API")
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

 (:prefix ("e" . "Emacs GameMaster")
  :desc "Roll Dice" "r" #'egme-roll-dice
  :desc "Oracle" "q" #'egme-y-n-oracle
  :desc "Add NPC" "n" #'egme-add-npc
  :desc "Delete NPC" "N" #'egme-delete-npc
  :desc "Add Thread" "t" #'egme-add-thread
  :desc "Delete Thread" "T" #'egme-delete-thread
  :desc "Dashboard" "d" #'egme-toggle-dash
  )

 (:prefix ("v" . "Vivien")
  :desc "Display Fortune" "f" #'display-fortune
  :desc "Display One-One Quote" "o" #'message-one-one
  :desc "Read A Statement" "r m" #'read-magnus
  :desc "Read A Case from Juno Steel" "r j" #'read-penumbra
  :desc "Read a Podcast Transcript" "r p" #'read-podcast
  :desc "Search the Archives" "s m" #'search-magnus
  :desc "Search Juno's Case Notes" "s p" #'search-penumbra
  :desc "Browse Song Lyrics" "L" #'lyric-search
  :desc "Spotify Lyrics" "l" #'spotify-lyrics
  :desc "Search the Web" "w" #'w3m-search-new-session
  :desc "Speak with the Doctor" "d" #'doctor))


(use-package! deft)
(map! :leader (:prefix ("n" . "notes")
               :desc "Open Deft" "x" #'deft
               :desc "New Deft File" "D" #'deft-new-file-named
               :desc "New (Unnamed) Deft File" "d" #'deft-new-file))



;;; FZF
;;;
(use-package! fzf)
(defun fzf-external-file (&optional directory)
  "Find file in projectile project (if used), current or specified DIRECTORY."
  (interactive)
  (let ((fzf--target-validator (fzf--use-validator
                                (function fzf--validate-filename)))
        (d (fzf--resolve-directory directory)))
    (fzf--start d
                (lambda (x)
                  (let ((f (expand-file-name x d)))
                    (when (file-exists-p f)
                      (consult-file-externally f)))))))

(defun global-hunt ()
  (interactive)
  (fzf-external-file "~"))





;;; Mode declarations
(lisp-extra-font-lock-global-mode 1)
(auto-save-visited-mode 1)
(global-visual-line-mode 1)
(global-undo-tree-mode 1)
(global-origami-mode 1)
(global-tree-sitter-mode 1)
(smartparens-global-mode 1)
(show-smartparens-global-mode 1)
(smartparens-global-strict-mode 1)
(ranger-override-dired-mode t)


;;; Misc variable modifications
;;;; Frequently update recentf
(run-at-time "5 min" 300 'recentf-save-list)
(sp-use-paredit-bindings)
(add-to-list 'Info-directory-list "/home/rohan/drive/books/nonfic/sicp-texinfo" t)
(add-to-list 'load-path "/home/vivien/.config/doom/local-packages")
(add-to-list 'auto-mode-alist '("[.]org[.]txt\\'" . org-mode))
(add-to-list 'auto-mode-alist '("[.]org[.]txt\\'" . org-mode))
(setq suggest-key-bindings nil)
(setq history-delete-duplicates t)
(setq smudge-transport 'connect)
(setq ranger-override-dired 'ranger)

;;; Custom Functions

;;;; Consult
(defun find-file-home ()
  "Find a file starting at the home directory"
  (interactive)
  (consult-find-file (read-file-name "Find file: " "~/")))

(defun find-file-work ()
  "Find a file starting at the ~/drive/work directory"
  (interactive)
  (consult-find-file (read-file-name "Find file: " "~/drive/work/")))






(defun consult-find-file (file)
  "Open FILE."
  (interactive "fFind File: ")
  (follow-mode 1)
  (find-file (expand-file-name file))
  (follow-mode -1))


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
      (apply func args))))


(defalias #'everywhere (lambda  (f) (in-folder "~" f)))
(defalias #'consult-imenu-all (everywhere #'consult-imenu-multi))
(defun consult-ripgrep-all () (interactive) (consult-ripgrep "~"))

(defalias #'consult-ripgrep-in
  (lambda ()
    (interactive)
    (let ((dir (read-file-name "Directory: " default-directory default-directory)))
                                        ; (funcall (in-folder dir #'consult-ripgrep))
      (consult-ripgrep dir))))


;;; Counsel
(defun counsel-find-home ()
  (interactive)
  (counsel-find-file "~/" (expand-file-name "~/")))

;;;



;;;; S-Expressions
(defun yank-sexp ()
  "Copy sexp at point"
  (mark-sexp)
  (kill-ring-save))


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
        (consult-ripgrep-args "rg --glob !*.pdf --null --line-buffered --color=never --max-columns=1000 --path-separator /   --smart-case --no-heading --line-number ."))

    (consult-ripgrep "~/drive/RPG/5e/5e-srd-split")))


(defun cypher-search-srd ()
  "Search Restructured Text SRD"
  (interactive)
  (let (
        (consult-ripgrep-args "rg -t rst --glob !*.pdf --null --line-buffered --color=never --max-columns=1000 --path-separator /   --smart-case --no-heading --line-number ."))

    (consult-ripgrep "~/drive/RPG/cypher/cypher-system-reference")))


(defun dnd-wild-magic-roll ()
  "Roll on Wild Magic table, report result in echo area"
  (interactive)
  (let* ((l (+ 2 (random 249)))
         (fname "~/drive/RPG/5e/5e-srd-split/wild-magic.md")
         (cmd (format "sed '%dq;d' %s" l fname)))

    (message (shell-command-to-string cmd))))

(defun coin-flip ()
  (interactive)
  (message (if (zerop (mod (random 10000) 2))
               "Heads (1)" "Tails (0)")))


(defun read-podcast-meta (prompt initial)
  (lambda () (interactive)
    (let* (
           (path (concat "/home/vivien/drive/podcast_transcripts/" initial "/") )
           (selected (read-file-name prompt path)))
      (consult-find-file selected)
      (with-current-buffer (find-buffer-visiting (expand-file-name selected))
        (set-buffer-font "Nimbus Mono PS")))))

(defun search-podcast-meta (initial)
  (lambda () (interactive) (consult-ripgrep (concat "/home/vivien/drive/podcast_transcripts/" initial))))

(defalias #'read-magnus (read-podcast-meta "Statement: " "magnus_archives"))
(defalias #'read-podcast (read-podcast-meta "Transcript: " ""))
(defalias #'read-penumbra (read-podcast-meta "Penumbra: " "penumbra"))
(defalias #'search-magnus (search-podcast-meta "magnus_archives"))
(defalias #'search-penumbra (search-podcast-meta "penumbra"))
(defalias #'search-podcast (search-podcast-meta ""))

(defun e-run-command ()
  "Run external system programs. Dmenu/Rofi-like.  Tab/C-M-i to completion
n-[b/p] for walk backward/forward early commands history."
  (interactive)
  (require 'subr-x)
  (start-process "RUN" "RUN" (string-trim-right (read-shell-command "RUN: "))))


;; (defun read-magnus ()
;;   (interactive)
;;   (let* (
;;          (path "/home/vivien/drive/podcast-transcripts/magnus_archives/")
;;          (selected (read-file-name "Statement: " path)))

;;     (consult-find-file selected)
;;     (with-current-buffer (find-buffer-visiting (expand-file-name selected))
;;       (set-buffer-font "Nimbus Mono PS"))))
;; (face-remap-add-relative 'default '(:family "Nimbus Mono PS" ) )
;; (overlay-put (make-overlay (point-min) (point-max) nil nil t)
;;              'face '(:family "Nimbus Mono PS"))





(defun set-buffer-font (family)
  (interactive
   (let* (
          (cmd "fc-list '' 'family'")
          (families (s-split hard-newline (shell-command-to-string cmd)))
          (chosen (completing-read "Font Family:" families nil t)))

     (list chosen)))



  (buffer-face-set `(:family ,family)))



(use-package! brotab)


(after! ranger
  (setq! ranger-preview-file nil))
;; (add-hook! 'text-)
(use-package! inherit-org)
(after! inherit-org
  (add-hook! 'inherit-org-mode-hook  (org-indent-mode -1))
  (add-hook! 'inherit-org-mode-hook (lambda () (org-indent-mode -1)))
  (add-hook! 'inherit-org-mode-hook (setq! org-indent-agentized-buffers nil))
  (add-hook! 'inherit-org (lambda! () (org-indent-mode -1))))


(after! info
  (add-hook! 'Info-mode-hook 'inherit-org-mode))

;; (after! helpful (add-hook! 'helpful-mode-hook 'inherit-org-mode))
(after! w3m
  (add-hook! 'w3m-fontify-before-hook 'inherit-org-w3m-headline-fontify) ;only one level is supported
  (add-hook! 'w3m-fontify-after-hook 'inherit-org-mode)
  (add-hook! 'w3m-fontify-after-hook 'writeroom-mode)
  (add-hook! 'w3m-display-hook (lambda! () (org-indent-mode -1)))
  (add-hook! 'w3m-fontify-after-hook (lambda! () (org-indent-mode -1))))





(after! savehist

  (defvar lyric-history '())
  (add-to-list 'savehist-additional-variables 'lyric-history))

(defun lyric-search ()
  "Search for lyrics using Clyrics, display in popup."
  (interactive)
  (let* (
         (lines (s-split "\n" (f-read "/home/vivien/Music/database.txt")))
         (options (append lyric-history lines))
         (choice (completing-read "Search for Lyrics: " options (lambda (v) v) nil "" 'lyric-history))
         (response (shell-command-to-string (concat "clyrics "  "\"" choice "\""))))

    (output-to-screen response)))

(defun spotify-lyrics ()
  (interactive)
  (output-to-screen (shell-command-to-string "playerctl -p spotify -f '{{artist}}: {{title}}' metadata|xargs clyrics")))




(defun output-to-screen (result)
  "Create a popup and display RESULT in it."
  (with-current-buffer (get-buffer-create "*clyrics*")
    (visual-line-mode 1)
    (erase-buffer)
    (insert result)
    (display-buffer (current-buffer))))


;; (after! ispell
;;   (setq ispell-dictionary "en_US")
;;   (setq ispell-alternate-dictionary "en_US")
;;   ;; (setq ispell-alternate-dictionary "/usr/lib/ispell/english.hash")
;;   (setq company-ispell-dictionary ispell-dictionary)
;; )
;; ;; https://www.emacswiki.org/emacs/EchoArea
                                        ;(defadvice message (around message-filter-by-regexp activate)
                                        ;  (if (not (ad-get-arg 0))
                                        ;      ad-do-it
                                        ;    (let ((formatted-string (apply 'format (ad-get-args 0))))
                                        ;      (if (stringp formatted-string)
                                        ;          (save-excursion
                                        ;            (set-buffer "*Messages*")
                                        ;            (goto-char (point-max))
                                        ;            (insert formatted-string "\n"))
                                        ;       (progn
                                        ;          (ad-set-args 0 `("%s" ,formatted-string))
                                        ;          ad-do-it)))))





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
  (message (get-good-fortune)))


(defun dup (str)
  "Used in some themes for convenience, to specify colors in GUI/CLI modes"
  (list str str nil))

(defun make-pride-flag (str path)
  "STR must be distinct each call"
  (propertize str 'display (create-image path 'png nil :scale 0.06)))




(defun org-blockify-comment (region))
;; Basically, take a bunch of # comments, and place them inside a block
;; Process: Wrapped in save-excursion: Construct region, call uncomment on region, mark it, insert comment structure template.


(defun find-commented-region (start comment-char))



(defun latex-update-alist ()
  "Configure the list of symbols that should be pretty-printed/rendered in Org/Latex modes"
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
    (TeX-add-to-alist 'prettify-symbols-alist new-alist)))



(defun filemanager-here ()
  "Start filemanager process in current dir"
  (interactive)
  (start-process "nemo" nil "nemo" (file-name-directory buffer-file-name)))


;;;; Org Functions
(defun my/enhanced-annotate ()
  "Open annotations in other window"
  (interactive)
  (unless (buffer-file-name)
    (error "This buffer has no associated file!"))
  (switch-to-buffer-other-window
   (org-annotate-file-show-section org-annotate-file-storage-file))
  (+evil/window-move-left)
  (evil-window-set-width 40))







(defun my/org-headings ()
  "Get the list of headings in an org buffer. Keys are full paths, vals are plain strings"
  (let* (
         (paths (--map  (s-chop-right 1 (org-no-properties it)) (consult-org--headings nil nil 'file)))
         (table (ht-create)))

    (--map (ht-set! table it (car (last (s-split "/" it)))) paths)
    table))

                                        ; (last (s-split "/" (s-chop-right 1 (org-no-properties it))))


(defun my/org-insert-heading-link ()
  "Let user select a heading from the buffer, insert a link to it at point"
  (interactive)
  (let* (
         (file (buffer-name))
         (heading-table (my/org-headings))
         (heading (completing-read "Select a heading: " heading-table  nil nil))
         (simplified-heading (ht-get heading-table heading))
         (link (format "[[file:%s::*%s]]" file simplified-heading)))

    (insert link)))






(defun insert-path ()
  (interactive)
  (insert (read-file-name "File: ")))


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






;;; Hacky Fixes


(defun my-evil-fix ()
  "Searching for a number messes up evil for whatever reason. This worked to fix it now, at least"
  (interactive)
  (setq evil-ex-search-history (cdr evil-ex-search-history))
  (setq evil-search-forward-history (cdr evil-ex-search-forward-history))
  (setq evil-ex-history (cdr evil-ex-history))

  (setq evil-ex-search-pattern '("clean" t t)))


(defun reset-mode (mode)
  "Mode is a function"
  (funcall mode -1)
  (funcall mode 1))




;;; Package Configuration
(after! consult
                                        ; Make consult-imenu-multi work like an imenu in all org buffers, basically. Fun.
  (setq
   consult-ripgrep-args "rga --null --line-buffered --color=never --max-columns=1000 --path-separator /   --smart-case --no-heading --line-number ."
   consult-grep-args "egrep --null --line-buffered --color=never --ignore-case   --exclude-dir=.git --line-number -I -r .")

  (consult-customize consult-recent-file consult-find-file consult-buffer :preview-key 'any)

  (consult-customize find-file :preview-key (list :debounce 0.2 'any)))



(after! imenu-list
  (setq imenu-list-focus-after-activation t
        imenu-list-position 'left
        imenu-list-size 0.25))


(after! vterm
  (setq vterm-shell "/bin/xonsh"))


(after! projectile
  (setq projectile-project-root-files-bottom-up
        (remove ".git" projectile-project-root-files-bottom-up)))







(after! hl-todo
  ;; (setq hl-todo-keyword-faces
  ;;       '(
  ;;         ("TODO" . "#dc752f")
  ;;         ("NEXT" . "#dc752f")
  ;;         ("THEM" . "#2d9574")
  ;;         ("PROG" . "#4f97d7")
  ;;         ("OKAY" . "#4f97d7")
  ;;         ("DONT" . "#f2241f")
  ;;         ("FAIL" . "#f2241f")
  ;;         ("DONE" . "#86dc2f")
  ;;         ("NOTE" . "#b1951d")
  ;;         ("KLUDGE" . "#b1951d")
  ;;         ("HACK" . "#b1951d")
  ;;         ("TEMP" . "#b1951d")
  ;;         ("FIXME" . "#dc752f")
  ;;         ("XXX+" . "#dc752f")
  ;;         ("\\?\\?\\?+" . "#dc752f")
  ;;         ("IDEA" . "#2d9574")
  ;;         ("CITE" . "#dc752f")
  ;;         ("OBVIOUS" . "#dc752f")
  ;;         ("PHRASING" . "#dc752f")
  ;;         ("LACKING" . "#dc752f")))
  (add-to-list 'hl-todo-keyword-faces '("IDEA" warning bold))
  (add-to-list 'hl-todo-keyword-faces '("DONE" success bold)))


(after! latex
  (add-to-list 'LaTeX-section-list '("cvsection" 2))
  (add-to-list 'LaTeX-section-list '("Question" 1))
  (add-to-list 'LaTeX-section-list '("Part" 2))
  (add-to-list 'LaTeX-section-list '("cvsubsection" 3))
  (add-to-list 'LaTeX-section-list '("cvsubsubsection" 4)))
(sp-local-pair '(LaTeX-mode) "`" "'")
(sp-local-pair '(LaTeX-mode) "$" "$")

(after! litex-mode
  (add-to-list 'litex-latex-functions 'sqrt)
  (setq litex-math-brackets-end "\\right)"
        litex-math-brackets-start "\\left("
        litex-format-float-string "%.1f"))


(after! undo-tree
  (defun setup-undo-tree ()
    (setq undo-outer-limit 24000000)
    (setq undo-limit 160000)
    (setq undo-strong-limit 240000))



  (setup-undo-tree)
  (add-hook 'org-mode-hook #'setup-undo-tree))

(after! writeroom-mode
  (setq! writeroom-mode-line t)
  )

(after! book-mode
  (remove-hook 'python-mode-hook 'book-mode)
  (remove-hook 'emacs-lisp-mode-hook 'book-mode)
  (advice-add 'book-mode :after (lambda () (doom-modeline-mode 1)))
  (advice-add 'book-mode-hl-line-range-function :around #'ignore)
  (setq! book-mode-left-margin 7)
  (setq! book-mode-right-margin 7)
  )

;;;; Org Config
(after! org
  (let ((base8 "#606F73"))
    (custom-set-faces!
      `(org-headline-done :foreground ,base8))
    )
  (setq org-startup-indented t)
  (setq org-export-with-smart-quotes t)
  (add-to-list 'org-structure-template-alist (cons "t" "theorem"))
  (add-to-list 'org-structure-template-alist (cons "p" "proof"))
  (add-to-list 'org-structure-template-alist (cons "i" "idea"))
  (add-to-list 'org-structure-template-alist (cons "L" "lemma"))

  (sp-local-pair '(org-mode) "`" "'")
  (sp-local-pair '(org-mode) "``" "''")
  (sp-local-pair '(org-mode) "$" "$")



  ;; (setq org-fontify-quote-and-verse-blocks nil
  ;;       org-fontify-whole-heading-line nil
  ;;       org-hide-leading-stars nil
  ;;       org-startup-indented nil)

  ;; (add-hook! 'writeroom-mode-hook (lambda () (message "hooked") (setq doom--line-number-style nil) (setq display-line-numbers nil) ))
  ;; (add-hook! 'writeroom-mode-enable-hook (lambda () (message "hooked") (setq doom--line-number-style nil) (setq display-line-numbers nil) ))
  ;; (add-hook! 'org-mode-hook (writeroom-mode))
  (add-hook! 'org-mode-hook (book-mode))
  (add-hook 'org-mode-hook #'org-hide-drawer-all)
  ;; (add-hook 'org-mode-hook 'turn-off-smartparens-mode)
  ;; (add-hook! 'org-mode-hook (lambda () (message "hooked") (setq doom--line-number-style nil) (setq display-line-numbers nil) ))
  (global-org-modern-mode)
  (setq org-pretty-entities t)

  (setq org-agenda-files (list "~/docs/Writing/Phone/todo.org"))

  (setq org-read-date-popup-calendar nil)
  (add-hook 'org-mode-hook #'org-indent-mode)
  (add-hook! 'org-mode-hook  (git-gutter-mode -1))
                                        ; (add-hook! 'org-mode-hook 'variable-pitch-mode)
  (add-hook 'org-mode-hook #'turn-off-smartparens-strict-mode)

  (setq org-list-demote-modify-bullet
        '(("+" . "-") ("-" . "+") ("*" . "+")))
                                        ; (setq org-edit-src-auto-save-idle-delay 300)
  (setq org-insert-heading-respect-content nil)

  (map! :map org-mode-map :localleader
        (:prefix ("s" . "tree/subtree")
         :desc "Copy Tree" "c" #'org-copy-subtree
         :desc "Clone Tree" "C" #'org-clone-subtree-with-time-shift)
        (:prefix ("l" . "links")
         :desc "Insert Link to Heading" "h" #'my/org-insert-heading-link)

        :desc "Mark Ring Goto" "&" #'org-mark-ring-goto)

  (use-package! org-pandoc-import)

  (setq! org-pandoc-options-for-markdown '((wrap . "none"))))











(setq! org-roam-directory "~/p/roam")

(defun find-and-replace (from to)
  "Replaces in the current buffer all occurences of from to to (not interactively)"
  (while (re-search-forward from nil t)
    (replace-match to nil nil)))

(defun smarten-quotes ()
  (interactive)
  (find-and-replace "'" "’")          ; Apostrophe -> Right quote
  (find-and-replace "`" "‘"))            ; Backtick -> Left quote




(after! file-templates
  (setq +file-templates-alist (-remove-item '(org-mode) +file-templates-alist))
  )


;;; Markdown
;; Optimised for doom-henna
(after! markdown-mode
  (add-hook! 'markdown-mode-hook (book-mode))
  (let* (
         (red "#e74c3c")
         (teal "#1abc9c")
         (green "#53df83")
         )
    (custom-set-faces!
      `(markdown-header-delimiter-face :foreground "#616161" :height 0.9)
      `(markdown-header-face-1 :foreground ,red :weight extra-bold :height 1.6)
      `(markdown-header-face-2 :foreground ,teal :weight extra-bold :height 1.4)
      `(markdown-header-face-3 :foreground ,green :weight extra-bold :height 1.2)
      `(markdown-header-face-4 :foreground ,(doom-lighten red 0.25) :weight bold :height 1.1)
      `(markdown-header-face-5 :foreground ,(doom-lighten teal 0.25) :weight bold )
      `(markdown-header-face-6 :foreground ,(doom-lighten green 0.25) :weight bold )
      )
    )

  (setq! markdown-header-scaling t)
  (setq! markdown-fontify-whole-heading-line t)
  (setq! markdown-marginalize-headers nil)
  (setq! markdown-nested-imenu-heading-index t)
  (setq! markdown-hide-markup t))


(after! json
  (map! :map json-mode-map :localleader
        (:desc "counsel-jq" "q" #'counsel-jq)))



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
  (setq org-src-fontify-natively t))



(after! babel
  (add-to-list 'org-babel-tangle-lang-exts '("python" . "py"))
  (add-to-list 'org-babel-tangle-lang-exts '("elixir" . "ex")))



(after! org-lookup-dnd
  (setq!
   completion-ignore-case t
   org-lookup-dnd-sources
   ' (
      ("/home/vivien/drive/RPG/5e/core/phb.pdf" 1 4 4 t)
      ("/home/vivien/drive/RPG/5e/core/Monster Manual.pdf" 1 4 4 nil)
      ("/home/vivien/drive/RPG/5e/core/dmg.pdf" 1 1 1 t)
      ("/home/vivien/drive/RPG/5e/unofficial/City_and_Wild.pdf" 0 2 2 nil)
      ("/home/vivien/drive/RPG/5e/expansion/Volo's Guide to Monsters.pdf" 1 1 1 t)
      ("/home/vivien/drive/RPG/5e/expansion/mordenkainens-tome-of-foes.pdf" 1 1 1 t)
      ("/home/vivien/OneDrive_Personal/RPG/5e/character options/COFSA The Compendium of Forgotten Secrets - Awakening (Abridged).pdf" 0 3 3 t))))


;;;; Programming Language Config
;; (after! coffee-mode
;;   (set-company-backend! 'coffee-mode
;;     '(company-yasnippet :with company-dabbrev)))

(after! geiser
  (setq geiser-scheme-implementation 'mit)
  (add-hook 'scheme-mode-hook #'run-geiser))

(after! clojure-mode
  (add-hook! 'clojure-mode-hook (cider-jack-in-clj nil)))

(after! matlab-mode
  (defun matlab-mode-vf-functionname (&optional fast) ()))

(after! eat
  (setq! eat-shell "/bin/xonsh"
         eat--terminfo-path "/home/vivien/.config/emacs/.local/straight/repos/eat/terminfo"
         eat--install-path "/home/vivien/.config/emacs/.local/straight/repos/eat"
         eat--load-file-path "/home/vivien/.config/emacs/.local/straight/repos/eat/eat.el"
         eat--shell-integration-path "/home/vivien/.config/emacs/.local/straight/repos/eat/integration"
         )
  )



;;; Doom-specific config
(set-popup-rule! (rx bol "*dnd5e-api-results") :size 0.3 :quit t :select t :ttl nil)
(set-popup-rule! (rx bol "*clyrics") :size 0.3 :quit t :select t :ttl nil)
(setq doom-scratch-initial-major-mode 'org-mode)
;; (setq doom-font (font-spec :family "Source Code Pro" :size 16)) ;; 14 if not monitr
;; (setq doom-font (font-spec :family "FiraCode Nerd Font Propo" :size 16)) ;; 14 if not monitr
(setq doom-font (font-spec :family "iMWritingDuo Nerd Font" :size 16))
;; (setq doom-font (font-spec :family "Fira Code" :size 15))

;; (setq doom-variable-pitch-font (font-spec :family "Latin Modern Roman" :size 14))
(setq doom-variable-pitch-font (font-spec :family "Roboto Slab" :size 15))
;; (setq doom-variable-pitch-font (font-spec :family "FairyDustB" :size 14))
;; (setq doom-variable-pitch-font (font-spec :family "Montserrat" :size 14))
;; (setq doom-variable-pitch-font (font-spec :family "Metamorphous" :size 14))
;; (setq doom-variable-pitch-font (font-spec :family "Nimbus Roman" :size 14))
;; (setq doom-variable-pitch-font (font-spec :family "Foglihten" :size 14))
;; (setq doom-variable-pitch-font (font-spec :family "Z003" :size 14))
(defalias 'doom/delete-frame-with-prompt 'delete-frame)

(after! doom-modeline
  (setq doom-modeline-support-imenu t
        doom-modeline-hud t
        doom-modeline-unicode-fallback t
        doom-modeline-env-version t
        doom-modeline-enable-word-count t
        doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode)
        doom-modeline-total-line-number t

        doom-modeline-buffer-encoding nil
        doom-modeline-battery nil
        doom-modeline-time nil
        doom-modeline-time-icon nil
        doom-modeline-time-analogue-clock nil
        doom-modeline-time-live-icon nil
        doom-modeline-irc nil
        doom-modeline-project-detection 'auto
        )
  (let* ((vi (propertize "‍🏳️‍⚧️ " 'face 'bold-italic))
         (flag-names (reverse (list "asexual" "nonbinary" "gender-queer" "transgender" "pride")))
         (flags (-map (lambda (name) (make-pride-flag name (format "/home/vivien/.config/doom/assets/pride-emoji-flags/png/%s-flag.png" name))) flag-names)))
    (add-to-list 'mode-line-misc-info vi)
    ;; (-map (lambda (flag) (add-to-list 'mode-line-misc-info flag) (add-to-list 'mode-line-misc-info " " nil (lambda (x y) nil))) flags)
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
(add-hook 'lsp-after-open-hook #'lsp-origami-try-enable)


;;; Hooks
(add-hook! 'doom-init-ui-hook  (defalias 'doom/delete-frame-with-prompt 'delete-frame))
(add-hook 'pdf-tools-enabled-hook #'pdf-view-midnight-minor-mode)
(add-hook! pdf-tools-enabled-hook #'hide-mode-line-mode)

;;;; Prose
(add-hook 'text-mode-hook #'auto-save-visited-mode)
(add-hook 'text-mode-hook #'visual-line-mode)
(add-hook 'text-mode-hook #'hl-todo-mode)
(add-hook 'text-mode-hook #'electric-pair-mode)
(add-hook! 'text-mode-hook (display-line-numbers-mode -1))
(add-hook! 'org-mode-hook (display-line-numbers-mode -1))


(add-hook 'markdown-mode-hook #'auto-save-visited-mode)
(add-hook 'markdown-mode-hook #'visual-line-mode)
(add-hook! 'markdown-mode-hook (display-line-numbers-mode -1))

(add-hook 'nov-mode-hook #'visual-line-mode)
(add-hook! 'nov-mode-hook #'visual-fill-column-mode)


;;;; Programming
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'auto-save-visited-mode)
(add-hook 'prog-mode-hook #'hl-todo-mode)
(add-hook 'prog-mode-hook #'electric-pair-mode)
(add-hook! 'prog-mode (display-line-numbers-mode 1))

(add-hook! 'emacs-lisp-mode-hook #'eldoc-mode)
(add-hook! 'emacs-lisp-mode-hook #'nameless-mode)
(add-hook! 'emacs-lisp-mode-hook #'highlight-defined-mode)

(add-hook 'lisp-interaction-mode-hook #'eldoc-mode)
(add-hook 'ielm-mode-hook #'eldoc-mode)
                                        ; (add-hook! 'emacs-lisp-mode-hook #'sotlisp-mode)

;;;; Smartparens
                                        ; (add-hook! 'smartparens-mode-hook #'evil-cleverparens-mode)
(add-hook 'smartparens-mode-hook #'evil-smartparens-mode)
(add-hook! 'smartparens-disabled-hook (evil-smartparens-mode -1))
                                        ; (add-hook! 'smartparens-disabled-hook (lambda () (evil-cleverparens-mode -1)))

;;;; Python
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "--simple-prompt --pprint")
;; (setq python-shell-interpreter "ptpython"
;;       python-shell-interpreter-args "--dark-bg")
                                        ; (setq helm-swoop-pre-input-function (lambda () ""))

(use-package! sphinx-doc)
(add-hook 'python-mode-hook #'sphinx-doc-mode)
(map! :map python-mode-map :leader (:prefix ("c" . "code")
                                    :desc "Next Func" "n" #'python-nav-forward-defun
                                    :desc "Previous Func" "p" #'python-nav-backward-defun
                                    ))


;;; Nano
;; (use-package! nano)
;; (use-package! doom-nano-modeline
;;   :config
;;   (doom-nano-modeline-mode 1)
;;   (global-hide-mode-line-mode 1))
(global-hide-mode-line-mode -1)


;;; Elfeed/RSS

(add-hook 'elfeed-search-mode-hook #'elfeed-update)
(setq rmh-elfeed-org-files '("~/.config/doom/elfeed.org"))


                                        ; From Tecosaur, allows LSP to work in source blocks
(cl-defmacro lsp-org-babel-enable (lang)
  "Support LANG in org source code block."
  ;; (setq centaur-lsp 'lsp-mode)
  (cl-check-type lang string)
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

;; (with-current-buffer (get-buffer " *Echo Area 0*")                             ; the leading space character is correct
;;   (setq-local face-remapping-alist '((default (:height 0)))))

(defun 161-ssh ()
  (interactive)
  (let ((user (completing-read "Select user: " (list "remus" "spica" "polaris" "vega" "deneb" "antares" "rigel"))))
    (find-file (format "/ssh:%s@127.0.0.1#16122:" user))))




(add-to-list 'auth-sources "~/.authinfo")
