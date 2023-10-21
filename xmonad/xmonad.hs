import XMonad
import XMonad.Config.Desktop
import XMonad.Util.Paste -- Remember to include this line
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


main = xmonad desktopConfig
    { terminal    = "xfce4-terminal"
    , modMask     = mod4Mask
    }
    `additionalKeys`
    [((mod, xK_e) spawn "emacsclient -nc --eval '(progn (doom/switch-to-scratch-buffer) (consult-buffer))'"),
     ((mod, xK_x) spawn "emacsclient -nc --eval '(doom/switch-to-scratch-buffer)'"),
     ((mod, xK_v) spawn "~/bin/vivaldi"),
     ((mod, xK_Return) spawn terminal),
     ((mod, xK_d) spawn "ulauncher-toggle")
    ]
     where mod = modMask myConfig


  -- X-selection-paste buffer
  -- , ((0, xK_Insert), pasteSelection)
