;;; ../../dotfiles/doom/themes/genderfluid-doom-theme.el -*- lexical-binding: t; -*-

;;; doom-genderfluid-theme.el --- a clean synthwave/outrun theme inspired by VSCode's Genderfluid -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: October 29, 2019 (#352)
;; Author: hyakt <https://github.com/hyakt>
;; Maintainer:
;; Source: https://github.com/Jaredk3nt/genderfluid
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-genderfluid-theme nil
  "Options for the `doom-genderfluid' theme."
  :group 'doom-themes)

(defcustom doom-genderfluid-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-genderfluid-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-genderfluid
  "An clean 80's synthwave / outrun theme inspired by VS Code genderfluid."

  ;; name        default   256       16
  ((bg         '("#1e1e1e" nil       nil            ))
   (bg-alt     '("#1B1720" nil       nil            ))
   (base0      '("#222228" "black"   "black"        ))
   (base1      '("#24262D" "#222222" "brightblack"  ))
   (base2      '("#282b33" "#222233" "brightblack"  ))
   (base3      '("#3E3549" "#333344" "brightblack"  ))
   (base4      '("#4E415C" "#444455" "brightblack"  ))
   (base5      '("#544863" "#554466" "brightblack"  ))
   (base6      '("#ED60BA" "#EE66BB" "brightblack"  ))
   (base7      '("#91889B" "#998899" "brightblack"  ))
   (base8      '("#ECEFF4" "#EEEEFF" "white"        ))
   (fg-alt     '("#EEEEEE" "#EEEEEE" "brightwhite"  ))
   (fg         '("#FFFFFF" "#FFFFFF" "white"        ))

   (grey       base4)
   (red        '("#964C7B" "#964477" "red"          ))
   (orange     '("#FFB85B" "#FFBB55" "brightred"    ))
   (green      '("#74DFC4" "#77DDCC" "green"        ))
   ;; (teal       '("#4D8079" "#448877" "brightgreen"  ))
   (yellow     '("#FFE261" "#FFEE66" "yellow"       ))
   (blue       '("#40B4C4" "#44BBCC" "brightblue"   ))
   (dark-blue  '("#336A79" "#336677" "blue"         ))
   (magenta    '("#EB64B9" "#EE66BB" "brightmagenta"))
   (violet     '("#B381C5" "#BB88CC" "magenta"      ))
   (cyan       '("#B4DCE7" "#BBDDEE" "brightcyan"   ))
   (dark-cyan  '("#6D7E8A" "#667788" "cyan"         ))
   (salmon (dup "#fe75a1"))
   (bright-purple (dup "#be18d5"))
   (indigo (dup "#4a53b6"))
   (purple (dup "#c761d5"))
   (bright-pink (dup "#fa4ba5"))
   (white (dup "#eeffff"))
   (light-blue (dup "#6d9cf8"))
   (light-purple (dup "#bc84f2"))
   (silver (dup "#B2CCD6") )
   (mid-blue (dup "#6497ff") )
   (cobalt  (dup "#82AAFF"))
   (bright-blue (dup "#89DDFF"))
   (misc (dup "#5c5adb"))
   (teal indigo)






   ;; face categories -- required for all themes
   (highlight bright-pink)
   (vertical-bar   (doom-darken base1 0.2))
   (selection  dark-blue)
   (builtin salmon)
   (comments base7)
   (doc-comments   (doom-lighten dark-cyan 0.25))
   (constants indigo)
   (functions purple)
   (keywords  bright-purple)
   (methods indigo)                ;TODO
   (operators indigo)
   (type cobalt)
   (strings mid-blue)
   (variables      light-purple)
   (numbers salmon)
   (region         `(,(doom-blend (car bg) (car magenta) 0.8) ,@(doom-lighten (cdr base1) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-pad
    (when doom-genderfluid-padded-modeline
      (if (integerp doom-genderfluid-padded-modeline) doom-genderfluid-padded-modeline 4)))

   (modeline-fg bright-blue )
   (modeline-fg-alt cobalt)
   (modeline-bg bg)
   (modeline-bg-inactive (doom-darken bg 0.1)))



  ;;;; Base theme face overrides
  ((lazy-highlight :background (doom-darken magenta 0.4) :foreground fg)
   ((font-lock-keyword-face &override) :weight 'bold)
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground cobalt)
   (mode-line-highlight :background purple :weight 'bold)
   ;;;; centaur-tabs
   (centaur-tabs-active-bar-face :background magenta)
   (centaur-tabs-modified-marker-selected
    :inherit 'centaur-tabs-selected :foreground magenta)
   (centaur-tabs-modified-marker-unselected
    :inherit 'centaur-tabs-unselected :foreground magenta)
   ;;;; company
   (company-box-background :foreground fg :background bg-alt)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background bg)
   (doom-modeline-info :inherit 'mode-line-emphasis)
   (doom-modeline-urgent :inherit 'mode-line-emphasis)
   (doom-modeline-warning :inherit 'mode-line-emphasis)
   (doom-modeline-debug :inherit 'mode-line-emphasis)
   (doom-modeline-buffer-minor-mode :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-project-dir :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-project-parent-dir :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-persp-name :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-file :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-modified :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-lsp-success :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :inherit 'mode-line-emphasis)
   (doom-modeline-evil-visual-state :foreground yellow)
   (doom-modeline-evil-replace-state :foreground orange)
   (doom-modeline-evil-operator-state :foreground teal)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; ivy
   (ivy-current-match :background base2 :distant-foreground nil)
   ;;;; markdown-mode
   (markdown-header-delimiter-face :foreground base7)
   (markdown-metadata-key-face     :foreground base7)
   (markdown-list-face             :foreground base7)
   (markdown-link-face             :foreground cyan)
   (markdown-url-face              :inherit 'link :foreground fg :weight 'normal)
   (markdown-italic-face           :inherit 'italic :foreground magenta)
   (markdown-bold-face             :inherit 'bold :foreground magenta)
   (markdown-markup-face           :foreground base7)
   (markdown-gfm-checkbox-face :foreground cyan)
   ;;;; mic-paren
   (paren-face-match  :foreground yellow   :background (doom-darken bg 0.2) :weight 'ultra-bold)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground purple)
   ((outline-2 &override) :foreground indigo)
   ((outline-3 &override) :foreground teal)
   ((outline-4 &override) :foreground salmon )
   ((outline-5 &override) :foreground (doom-darken purple 0.2))
   ((outline-6 &override) :foreground (doom-darken indigo 0.2))
   ((outline-7 &override) :foreground (doom-darken teal 0.2))
   ((outline-8 &override) :foreground (doom-darken salmon 0.2))
   ;;;; org <built-in>
   ((org-block &override) :background base2)
   ((org-block-begin-line &override) :background base2)
   (org-hide :foreground hidden)
   ;;;; org-pomodoro
   (org-pomodoro-mode-line :inherit 'mode-line-emphasis :weight 'bold) ; unreadable otherwise
   (org-pomodoro-mode-line-overtime :inherit 'org-pomodoro-mode-line)
   (org-pomodoro-mode-line-break :inherit 'org-pomodoro-mode-line)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))))

;;; doom-genderfluid-theme.el ends here
