import XMonad
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Util.Run
import System.IO

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/kevin/.xmobarrc"
  xmonad $ def
    { terminal    = myTerminal
    , modMask     = myModMask
    , borderWidth = myBorderWidth
    } `additionalKeys`
    [ ((0, xF86XK_MonBrightnessUp ), spawn "xbacklight +10")
    , ((0, xF86XK_MonBrightnessDown ), spawn "xbacklight -10")
    , ((0, xF86XK_AudioRaiseVolume ), spawn "pamixer -i 5")
    , ((0, xF86XK_AudioLowerVolume ), spawn "pamixer -d 5")
    , ((0, xF86XK_AudioMute ), spawn "pamixer -t")
    ]

myTerminal    = "urxvt"
myModMask     = mod4Mask -- Win key or Super_L
myBorderWidth = 3
