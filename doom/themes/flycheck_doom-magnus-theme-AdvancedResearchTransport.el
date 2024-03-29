;;; ../../dotfiles/doom/themes/doom=magnus-theme.el -*- lexical-binding: t; -*-

;;; doom-magnus-theme.el --- inspired by daylerees' Magnus -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: November 9, 2017 (#112)
;; Author: teesloane <https://github.com/teesloane>
;; Maintainer:
;; Source: https://github.com/daylerees/colour-schemes/blob/master/emacs/magnus-theme.el
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-magnus-theme nil
  "Options for the `doom-magnus' theme."
  :group 'doom-themes)

(defcustom doom-magnus-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-magnus-theme
  :type 'boolean)

(defcustom doom-magnus-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-magnus-theme
  :type 'boolean)

(defcustom doom-magnus-comment-bg doom-magnus-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-magnus-theme
  :type 'boolean)

(defcustom doom-magnus-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-magnus-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-magnus
  "Magnus theme from daylerees themes "

  ;; name        default   256       16
  ((bg         '("#072017" nil       nil            ))
   (bg-alt     '("#1F1E1D" nil       nil            ))
   (base0      '("#2b2a27" "black"   "black"        ))
   (base1      '("#1c1f24" "#1e1e1e" "brightblack"  ))
   (base2      '("#202328" "#2e2e2e" "brightblack"  ))
   (base3      '("#23272e" "#262626" "brightblack"  ))
   (base4      '("#3f444a" "#3f3f3f" "brightblack"  ))
   (base5      '("#5B6268" "#525252" "brightblack"  ))
   (base6      '("#73797e" "#6b6b6b" "brightblack"  ))
   (base7      '("#9ca0a4" "#979797" "brightblack"  ))
   (base8      '("#DFDFDF" "#dfdfdf" "white"        ))
   (fg         '("#ede0ce" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("#5B6268" "#2d2d2d" "white"        ))

   (grey       base4)
   (white      '("#f8f8f0" "base4"   "base4"        ))
   (red        '("#ff5d38" "#ff6655" "red"          )) ;; magnus todo 16
   (orange     '("#cb4b16" "#dd8844" "brightred"    ))
   (green      '("#79A129" "#99bb66" "green"        ))
   (teal       '("#26a6a6" "#44b9b1" "brightgreen"  )) ;; magnus
   ;; (yellow     '("#bcd42a" "#ECBE7B" "yellow"       )) ;; magnus, todo 16
   (yellow     '("#" "#ECBE7B" "yellow"       )) ;; magnus, todo 16
   (blue       '("#51afef" "#51afef" "brightblue"   ))
   (dark-blue  '("#2257A0" "#2257A0" "blue"         ))
   (magenta    '("#c678dd" "#c678dd" "magenta"      ))
   (violet     '("#a9a1e1" "#a9a1e1" "brightmagenta"))
   (cyan       '("#46D9FF" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#5699AF" "#5699AF" "cyan"         ))
   (coral-popup  '("#a60033" "#f6bfbc" "coral-popup"         ))

   ;; face categories -- required for all themes
   (highlight      red)
   (vertical-bar   (doom-lighten bg 0.1))
   (selection      coral-popup)
   (builtin green)
   (comments       (if doom-magnus-brighter-comments dark-cyan base5)) ;; TODO
   (doc-comments   (doom-lighten (if doom-magnus-brighter-comments dark-cyan base5) 0.25)) ;; TODO
   (constants green)        ;; done
   (functions      yellow)     ;; done
   (keywords       teal)       ;; done
   (methods        yellow)     ;; not sure how to test this.
   (operators green)        ;; not showing up on `=` etc.
   (type           white)      ;;
   (strings        yellow)
   (variables      white)      ;; done
   (numbers green)        ;; done

   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base0) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (-modeline-bright doom-magnus-brighter-modeline)
   (-modeline-pad
    (when doom-magnus-padded-modeline
      (if (integerp doom-magnus-padded-modeline) doom-magnus-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt (doom-blend violet base4 (if -modeline-bright 0.5 0.2)))

   (modeline-bg
    (if -modeline-bright
        (doom-darken blue 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken bg 0.475)
      `(,(doom-darken (car bg) 0.15) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(doom-darken (car bg) 0.1) ,@(cdr base1)))
   (modeline-bg-inactive-l (doom-darken bg 0.1)))


  ;;;; Base theme face overrides
  ((font-lock-comment-face
    :foreground comments
    :background (if doom-magnus-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground base7)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))

;;;; company
   (company-tooltip            :inherit 'tooltip)
   (company-tooltip-common                           :foreground highlight)
   (company-tooltip-search     :background highlight :foreground bg :distant-foreground fg)
   (company-tooltip-selection  :background selection)
   (company-tooltip-mouse      :background magenta   :foreground bg :distant-foreground fg)
   (company-tooltip-annotation                       :foreground violet)
   (company-scrollbar-bg       :inherit 'tooltip)
   (company-scrollbar-fg       :background highlight)
   (company-preview                                  :foreground highlight)
   (company-preview-common     :background base3 :foreground magenta)
   (company-preview-search     :inherit 'company-tooltip-search)
   (company-template-field     :inherit 'match)
;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))
;;;; popup
   (popup-face :inherit 'tooltip)
   (popup-selection-face :inherit 'tooltip)
;;;; pos-tip
   (popup-tip-face :inherit 'tooltip)
;;;; rjsx-mode
   (rjsx-tag :foreground teal)
   (rjsx-attr :foreground red)
;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))


   ((outline-1 &override) :foreground green)
   ((outline-2 &override) :foreground teal )
   ((outline-3 &override) :foreground yellow)
   ((outline-4 &override) :foreground dark-cyan)
   ((outline-5 &override) :foreground (doom-darken green 0.2))
   ((outline-6 &override) :foreground (doom-darken teal 0.2))
   ((outline-7 &override) :foreground (doom-darken yellow 0.2))
   ((outline-8 &override) :foreground (doom-darken dark-cyan 0.2))





   )

  ;;;; Base theme variable overrides-
  ;; ()
  )

;;; doom-magnus-theme.el ends here
