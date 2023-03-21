;;; ../../dotfiles/doom/themes/doom-ace.el -*- lexical-binding: t; -*-


;;; doom-ace-theme.el --- port of Ian Pan's Wilmersdorf -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: August 12, 2019 (6035392a1a01)
;; Author: ema2159 <https://github.com/ema2159>
;; Maintainer:
;; Source: https://github.com/ianpan870102/wilmersdorf-emacs-theme
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)

(defgroup doom-ace-theme nil
  "Options for the `doom-wilmersdorf' theme."
  :group 'doom-themes)

(defcustom doom-ace-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-wilmersdorf-theme
  :type '(choice integer boolean))




;;
;;; Theme definition

(def-doom-theme doom-ace
  "A dark theme for when you want garlic bread."

  ;; name        default   256       16
  (
   ;; (bg         (dup "#1e1e1e"))
   ;; (fg         (dup "#eeffff"))
   ;; (bg-alt     (dup "#1f2024"))
   ;; (fg-alt     (dup "#dbebeb"))
   ;; (base0      (dup "#222228"))         ;TODO: Make background lighter
   ;; (base1      (dup "#1e1e1e"))
   ;; (base2      (dup "#303030"))
   ;; (base3      (dup "#424242"))
   ;; (base4      (dup "#545454"))
   ;; (base5      (dup "#b5c2c2"))
   ;; (base6      (dup "#c8d6d6"))
   ;; (base7      (dup "#dbebeb"))
   ;; (base8      (dup "#ffffff"))
   (bg         '("#282b33" "#282b33" nil            ))
   (bg-alt     '("#1f2024" "#1f2024" nil            ))
   (base0      '("#222228" "#222228" "black"        ))
   (base1      '("#282b33" "#282b33" "brightblack"  ))
   (base2      '("#34373e" "#34373e" "brightblack"  ))
   (base3      '("#41454b" "#41454b" "brightblack"  ))
   (base4      '("#515462" "#515462" "brightblack"  ))
   (base5      '("#888395" "#888395" "brightblack"  ))
   (base6      '("#929292" "#929292" "brightblack"  ))
   (base7      '("#727269" "#727269" "brightblack"  ))
   (base8      '("#eceff4" "#eceff4" "white"        ))
   (fg-alt     '("#c9d9ff" "#c9d9ff" "brightwhite"  ))
   (fg         '("#c6c6c6" "#c6c6c6" "white"        ))


   (grey      (dup "#bbbbbb"))
   (red        '("#e1c1ee" "#e1c1ee" "red"          ))
   (orange     '("#a6c1e0" "#a6c1e0" "brightred"    ))
   (green      '("#5b94ab" "#5b94ab" "green"        ))
   (teal       '("#7ebebd" "#7ebebd" "brightgreen"  ))
   (yellow     '("#cfcf9c" "#cfcf9c" "yellow"       ))
   (blue       '("#819cd6" "#819cd6" "brightblue"   ))
   (light-blue '("#90a6db" "#90a6db" "yellow"       ))
   (dark-blue  '("#616c96" "#616c96" "blue"         ))
   (magenta    '("#a6c1e0" "#a6c1e0" "magenta"      ))
   (violet     '("#b0a2e7" "#b0a2e7" "brightmagenta"))
   (cyan       '("#7289bc" "#7289bc" "brightcyan"   ))
   (dark-cyan  '("#6e7899" "#6e7899" "cyan"   ))
   (dark-purple (dup "#9f299f"))
   (light-purple (dup "#bc84f2"))
   (mid-purple (dup "#b435b4"))

   ;; face categories -- required for all themes
   (highlight      blue)                ;TODO
   (vertical-bar   (doom-darken base1 0.5))
   (selection      dark-blue)           ;TODO
   (builtin (dup "#84959C"))
   (comments base7 )
   (doc-comments   (doom-lighten base7 0.25))
   (constants light-purple)
   (functions      teal)                ;TODO
   (keywords dark-purple)
   (methods        cyan)                ;TODO
   (operators      blue)                ;TODO
   (type           violet)              ;TODO
   (strings mid-purple)
   (variables      magenta)             ;TODO
   (numbers light-purple)
   (region         base3)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))

   (modeline-bg '("#1a1a1a" "#1a1a1a" nil))
   (modeline-fg-alt base5)

   (modeline-fg '("#bbbbbb" "#bbbbbb" nil))
   (modeline-bg-l
    `(,(doom-darken (car bg) 0.15) ,@(cdr base0)))
   (modeline-bg-inactive   `(,(car bg) ,@(cdr base1)))
   (modeline-bg-inactive-l (doom-darken bg 0.1)))


  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    ;; :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg))
    )
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    ;; :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive))
    )
    (mode-line-emphasis :foreground highlight)
    ((mode-line-highlight &override) :background teal)

   ;;;; css-mode <built-in> / scss-mode
    (css-proprietary-property :foreground orange)
    (css-property             :foreground green)
    (css-selector             :foreground blue)
   ;;;; doom-modeline
    (doom-modeline-bar :background highlight)
   ;;;; elscreen
    (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; markdown-mode
    (markdown-markup-face :foreground base5)
    (markdown-header-face :inherit 'bold :foreground red)
    (markdown-url-face    :foreground teal :weight 'normal)
    (markdown-reference-face :foreground base6)
    ((markdown-bold-face &override)   :foreground fg)
    ((markdown-italic-face &override) :foreground fg-alt)
   ;;;; mic-paren
    (paren-face-match    :foreground teal   :background base0 :weight 'ultra-bold)
    (paren-face-mismatch :foreground red :background violet   :weight 'ultra-bold)
    (paren-face-no-match :inherit 'paren-face-mismatch :weight 'ultra-bold)
   ;;;; outline <built-in>
    ((outline-1 &override) :foreground dark-purple)
    ((outline-2 &override) :foreground light-purple)
    ((outline-3 &override) :foreground dark-purple)
    ((outline-4 &override) :foreground (doom-darken dark-purple 0.2))
    ((outline-5 &override) :foreground (doom-darken light-purple 0.2))
    ((outline-6 &override) :foreground (doom-darken dark-purple 0.2))
    ((outline-7 &override) :foreground (doom-darken light-purple 0.4))
    ((outline-8 &override) :foreground (doom-darken dark-purple 0.4))
   ;;;; org <built-in>
    ((org-block &override) :background base2)
    ((org-block-begin-line &override) :background base2)
    (org-hide :foreground hidden)
   ;;;; solaire-mode
    (solaire-mode-line-face
     :inherit 'mode-line
     :background modeline-bg-l
     ;; :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l))
     )
    (solaire-mode-line-inactive-face
     :inherit 'mode-line-inactive
     :background modeline-bg-inactive-l
     ;; :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l))
     ))

  ;;;; Base theme variable overrides-
   ()
   )

;;; doom-wilmersdorf-theme.el ends here
