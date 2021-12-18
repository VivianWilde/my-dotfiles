;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Rohan Goyal "
      user-mail-address "goyal.rohan.03@gmail.com")

;;;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
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
(setq doom-theme 'doom-outrun-electric)
;; (setq bespoke-set-theme 'dark)
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

                                        ; Keybindings
(map! "C-s"
      (cmd! (save-buffer)))

(map! "C-+"
      (cmd! (text-scale-increase)))
(map! "C--"
      (cmd! (text-scale-decrease)))

(after! evil
  (map! :nvieo "C-n" #'next-line)
  (map! :nvieo "C-p" #'previous-line)
  (map! :nvieo :map override-global-map "M-q" #'consult-buffer)
  (map! :nvieo :map override-global-map "M-o" #'other-window)
  )

;; (map! "C-M-v"
;;       (cmd! (visual-line-mode)))

(map! (:after 'org
       :map org-mode-map
       "M-p" #'org-latex-export-to-pdf))

;; (map! (:after 'org
;;        :map org-mode-map
;;        "C-c &" #'org-mark-ring-goto))
(map! :leader
      (:prefix-map ("b" . "buffer")
       :desc "Consult Buffer" "b" #'consult-buffer))

(map! :leader
      (:prefix-map ("s" . "search")
       :desc "Consult Imenu All" "I" #'consult-imenu-multi
       ))
(defalias 'consult--project-root (lambda () "/home/rohan"))
;;; Make consult-imenu-multi work like an imenu in all org buffers, basically. Fun.
;; (map! :leader
;;       (:prefix-map ("s" . "search")
;;        :desc "Helm Search Buffer" "s" #'helm-swoop-without-pre-input))

;; (map! :leader
;;       (:prefix-map ("s" . "search")
;;        :desc "Helm Org Rifle" "S" #'helm-org-rifle))

;; (map! :leader
;;       (:prefix-map ("s" . "search")
;;        :desc "Helm Search All" "B" #'helm-multi-swoop-all))

(map! :leader
      (:prefix-map ("c" . "code")
       :desc "Comment Lines" "l" #'evilnc-comment-or-uncomment-lines))
;; (global-set-key [remap doom/delete-frame-with-prompt] #'delete-frame)
;;

                                        ; Mode declarations
(auto-save-visited-mode)
(global-visual-line-mode)
(global-undo-tree-mode)
(global-origami-mode)
(smartparens-global-strict-mode)
(sp-use-paredit-bindings)
;; (cua-mode 1)
;; (desktop-read)
;; (desktop-save-mode 1)
(profiler-start 'cpu+mem)

                                        ; Misc variable modifications
(add-to-list 'auto-mode-alist '("[.]org[.]txt\\'" . org-mode))
(setq python-shell-interpreter "ipython3"
      python-shell-interpreter-args "--simple-prompt --pprint")
(setq helm-swoop-pre-input-function (lambda () ""))
(setq history-delete-duplicates t)

(add-to-list 'auto-mode-alist '("[.]org[.]txt\\'" . org-mode))

                                        ; Doom-specific config
;; (setq confirm-kill-emacs nil)
(setq doom-scratch-initial-major-mode 'org-mode)
(setq doom-font (font-spec :family "Overpass Mono" :size 14))

(setq doom-variable-pitch-font (font-spec :family "Merriweather" :size 13))
(defalias 'doom/delete-frame-with-prompt 'delete-frame)

                                        ; Enable folding
(setq lsp-enable-folding t)
(use-package! lsp-origami)
(add-hook! 'lsp-after-open-hook #'lsp-origami-try-enable)

                                        ; Org Config
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


  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (setq org-latex-listings 'minted)

  (setq org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

  (setq org-src-fontify-natively t)


  )


(after! org
  (define-key org-mode-map (kbd "M-p") 'org-latex-export-to-pdf)
  (map! :map)
  (setq org-pretty-entities t)
  ;; (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  (add-hook! 'org-mode-hook 'org-indent-mode)
  ;; (add-hook! 'org-mode-hook (lambda () (define-key org-mode-map (kbd "M-p"))'org-latex-export-to-pdf))
  (setq org-list-demote-modify-bullet
        '(("+" . "-") ("-" . "+") ("*" . "+")))
  ;; (setq org-edit-src-auto-save-idle-delay 300)
  (setq org-insert-heading-respect-content nil)
  )

(after! ox-reveal
  (setq org-reveal-root "file:///home/rohan/node_modules/reveal.js")
  )

(after! babel
  (add-to-list 'org-babel-tangle-lang-exts '("python" . "py")))
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



(after! coffee-mode
  (set-company-backend! 'coffee-mode
    '(company-yasnippet :with company-dabbrev)))

(after! geiser
  (setq geiser-scheme-implementation 'mit)
  (add-hook! 'scheme-mode-hook #'run-geiser)
  )
                                        ; Hooks
(add-hook! 'text-mode-hook #'auto-save-visited-mode)
(add-hook! 'text-mode-hook #'visual-line-mode)
(add-hook! 'text-mode-hook #'hl-todo-mode)

(add-hook! 'doom-init-ui-hook (lambda () (defalias 'doom/delete-frame-with-prompt 'delete-frame)))
                                        ; (add-hook 'prog-mode-hook #'rainbow-mode)
(add-hook! 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook! 'prog-mode-hook #'auto-save-visited-mode)
(add-hook! 'prog-mode-hook #'hl-todo-mode)
(add-hook! 'smartparens-mode-hook #'evil-cleverparens-mode)
(add-hook! 'smartparens-mode-hook #'evil-smartparens-mode)

;; (add-hook 'org-mode-hook #'visual-line-mode)
;; (add-hook 'org-mode-hook #'auto-save-visited-mode)
;; (add-hook 'org-mode-hook #'wc-mode)
;; (add-hook 'org-mode-hook #'org-indent-mode)

;; (add-hook 'python-mode-hook #'sphinx-doc-mode)
;; (add-hook 'python-mode-hook #'anaconda-mode)
;; (add-hook 'python-mode-hook #'elpy-mode)
(add-hook! 'markdown-mode-hook #'auto-save-visited-mode)
(add-hook! 'markdown-mode-hook #'visual-line-mode)

(add-hook! 'nov-mode-hook #'visual-line-mode)
(add-hook! 'nov-mode-hook #'visual-fill-column-mode)

(add-hook! 'emacs-lisp-mode-hook #'eldoc-mode)
(add-hook! 'lisp-interaction-mode-hook #'eldoc-mode)
(add-hook! 'ielm-mode-hook #'eldoc-mode)



                                        ; Stuff from
(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 20000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?
      ;; scroll-preserve-screen-position 'always     ; Don't have `point' jump around
      scroll-margin 2)                            ; It's nice to maintain a little margin

(display-time-mode 1)                             ; Enable time in the mode-line

;; (unless (string-match-p "^Power N/A" (battery))   ; On laptops...
;; (display-battery-mode 1))                       ; it's nice to know how much power you have
(display-battery-mode 0)

(global-subword-mode 1)                           ; Iterate through CamelCase words

(setq-default major-mode 'org-mode)

                                        ; Custom Functions
(defun org-blockify-comment (region)
  ;; Basically, take a bunch of # comments, and place them inside a block
  ;; Process: Wrapped in save-excursion: Construct region, call uncomment on region, mark it, insert comment structure template.
  )

(defun find-commented-region (start comment-char)


  )

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
  '("go" "python" "ipython" "bash" "sh" "elixir"))
(dolist (lang org-babel-lang-list)
  (eval `(lsp-org-babel-enable ,lang)))
