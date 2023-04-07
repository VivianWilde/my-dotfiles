;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
                                        ;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
                                        ;(package! another-package
                                        ;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
                                        ;(package! this-package
                                        ;  :recipe (:host github :repo "username/repo"
                                        ;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
                                        ;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
                                        ;(package! builtin-package :recipe (:nonrecursive t))
                                        ;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
                                        ;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
                                        ;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
                                        ;(unpin! pinned-package)
;; ...or multiple packages
                                        ;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
                                        ;(unpin! t)
;; (add-to-list 'load-path "~/build/doom-nano-testing")
;; (package! transient :pin "c2bdf7e12c530eb85476d3aef317eb2941ab9440")
;; (package! with-editor :pin "391e76a256aeec6b9e4cbd733088f30c677d965b")


;;; EAF
(package! emacs-application-framework
:recipe (:host github :repo "manateelazycat/emacs-application-framework"
:files ("eaf.el" "src/lisp/*.el")))




;;; Libraries
(package! dash)
(package! s)
(package! ht)
(package! plz :recipe (:local-repo "~/.config/doom/local-packages/plz"))
(package! esxml)

;;; Language Support
(package! sphinx-doc)
(package! matlab-mode)

;;;; Misc
(package! bnf-mode)
(package! lark-mode :recipe (:local-repo "~/experiments/elisp/lark-mode"))
;; (package! xonsh-mode)
;;(package! spl :recipe (:local-repo "~/.config"))

;;;; Web
;;(package! coffee-mode)
;;(package! company-web)
;; (package! typescript-mode)
;; (package! tide)

;;;; Lisp/Scheme
;(package! geiser-guile)
(package! sotlisp)
(package! highlight-defined)
(package! lisp-extra-font-lock)
(package! nameless)
(package! litex-mode)

;;; Prose/Org
(package! pandoc)
(package! ox-pandoc)
(package! htmlize)
(package! org-transclusion)
;;(package! fountain-mode)
(package! poet-theme)
(package! afternoon-theme)
(package! olivetti)
(package! org-ml)
(package! org-pandoc-import
  :recipe (:host github
           :repo "tecosaur/org-pandoc-import"
           :files ("*.el" "filters" "preprocessors")))
(package! default-lang :recipe (:local-repo "~/experiments/elisp/default-lang") )
;; (package! ox-reveal)
;;(package! lsp-grammarly)
;; (package! ox-latex)
;; (package! org-panel
;;   :recipe (:local-repo "~/.config/doom/local-packages/org-panel"))

;;; Evil
;; (package! evil-better-visual-line)
;; (package! evil-cleverparens)
(package! evil-smartparens)

;;; Misc
;;;; Programming
(package! lsp-origami)
(package! riscv-mode)
;; (package! emacs-python-pytest :disable t)
(package! imenu-list)
;;(package! gjdb :recipe (:local-repo "~/d/cs/61b/cs61b-software/lib/emacs/lisp/gjdb"))
;;;; Utilities
(package! info-plus)
(package! w3m)
(package! counsel-spotify)
(package! smudge)
;;(package! zeitgeist :recipe (:local-repo "~/.config/doom/local-packages/zeitgeist"))
;;(package! canvas-emacs :recipe (:local-repo "~/.config/doom/local-packages/canvas-emacs"))
(package! mstodo :recipe (:local-repo "~/experiments/elisp/mstodo"))
;;(package! nov.el)
;; (package! tumblesocks)
;; (package! consult-spotify)

;;; Consult
;;(package! consult-ls-git)
;;(package! consult-project-extra)


;;; Nano
;;(package! nano-emacs :recipe (:type git :host github :repo "rougier/nano-emacs"))
;;(package! nano-theme)
;;(package! nano-modeline)


;;; D&D
(package! org-d20)
(package! org-lookup-dnd :recipe (:local-repo "~/experiments/elisp/org-lookup-dnd"))
(package! dnd5e-api :recipe (:local-repo "~/experiments/elisp/dnd5e-api"))
(package! button-lock)
(package! decide)

;;; Helm
;;; Themes
(package! autothemer)
(package! TransSide :recipe (:type git :host github :repo "Harith163/TransSide-theme"))
(package! rainbow-mode)
