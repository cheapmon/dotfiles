import Data.Map hiding (map, keys)
import Data.Monoid
import System.Exit
import XMonad hiding (float)
import XMonad.Actions.Warp
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicProperty
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.IndependentScreens
import XMonad.Layout.Tabbed
import XMonad.StackSet hiding (workspaces, member)
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

myTerminal          = "alacritty"
myFocusFollowsMouse = True
myClickJustFocuses  = False
myBorderWidth       = 2
myModMask           = mod4Mask

myWorkspaces = map show [1..10]

myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#ffffff"

myAdditionalKeys nScreens =
  [
    ("M-<Return>", spawn myTerminal),
    ("M-d",        spawn "rofi -show run"),

    -- XMonad
    ("M-q",        kill),
    ("M-r",        spawn "xmonad --recompile; xmonad --restart"),
    ("M-e",        io exitSuccess),
    ("M-s",        spawn "systemctl poweroff"),
    ("M-a",        spawn "systemctl reboot"),

    -- Layouts
    ("M-<Space>",  sendMessage NextLayout),
    ("M-<R>",      windows focusDown),
    ("M-<L>",      windows focusUp),
    ("M-<D>",      windows focusMaster),
    ("M-<U>",      windows swapMaster),
    ("M-h",        sendMessage Shrink),
    ("M-l",        sendMessage Expand),
    ("M-j",        sendMessage (IncMasterN (-1))),
    ("M-k",        sendMessage (IncMasterN 1)),
    ("M-t",        withFocused toggleFloat),

    -- Monitors
    ("M-m",        openScreen 0),
    ("M-,",        openScreen 1),

    -- Move to workspace
    ("M-1",        switchTo "1" nScreens),
    ("M-2",        switchTo "2" nScreens),
    ("M-3",        switchTo "3" nScreens),
    ("M-4",        switchTo "4" nScreens),
    ("M-5",        switchTo "5" nScreens),
    ("M-6",        switchTo "6" nScreens),
    ("M-7",        switchTo "7" nScreens),
    ("M-8",        switchTo "8" nScreens),
    ("M-9",        switchTo "9" nScreens),
    ("M-0",        switchTo "10" nScreens),

    -- Move window to workspace
    ("M-S-1",      shiftTo "1" nScreens),
    ("M-S-2",      shiftTo "2" nScreens),
    ("M-S-3",      shiftTo "3" nScreens),
    ("M-S-4",      shiftTo "4" nScreens),
    ("M-S-5",      shiftTo "5" nScreens),
    ("M-S-6",      shiftTo "6" nScreens),
    ("M-S-7",      shiftTo "7" nScreens),
    ("M-S-8",      shiftTo "8" nScreens),
    ("M-S-9",      shiftTo "9" nScreens),
    ("M-S-0",      shiftTo "10" nScreens),

    -- Backlight
    ("<XF86MonBrightnessUp>",   spawn "xbacklight -inc 5"),
    ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5"),

    -- Audio
    ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+"),
    ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%-"),
    ("<XF86AudioMute>",        spawn "amixer set Master toggle"),
    ("<XF86AudioMicMute>",     spawn "amixer set Capture toggle"),

    -- The Key
    ("<XF86Tools>",   spawn "$HOME/.config/seims/scripts/stackoverflow.sh"),
    ("<XF86Launch5>", spawn "core-panic"),
    ("<XF86Launch6>", spawn "polybar-msg cmd toggle"),

    -- Programs
    ("M-C-l",      spawn "$HOME/.config/seims/scripts/lock.sh"),
    ("M-C-s",      spawn "screens"),
    ("M-C-i",      spawn "rofi -show window"),
    ("M-C-n",      spawn "dunstctl set-paused toggle"),
    ("M-C-z",      spawn "rofi-pass --root $HOME/git/passwords"),
    ("M-C-<Home>", spawn "flameshot gui"),
    ("M-C-c",      spawn "CM_LAUNCHER=rofi clipmenu")
  ]

myLayout = avoidStruts $ tiled ||| Mirror tiled ||| tabs ||| Full
  where
    tiled = Tall 1 (3 / 100) (1 / 2)
    tabs  = tabbedBottom shrinkText myTabConf

myTabConf = def {
  fontName            = "xft:JetBrains Mono:size=9",
  activeColor         = "#000000",
  inactiveColor       = "#000000",
  urgentColor         = "#000000",
  activeBorderColor   = "#FFFFFF",
  inactiveBorderColor = "#000000",
  urgentBorderColor   = "#000000",
  activeTextColor     = "#FFFFFF",
  inactiveTextColor   = "#FFFFFF",
  urgentTextColor     = "#FFFFFF"
}

myManageHook  = composeAll
  [
    -- Floating windows
    isDialog                               --> doCenterFloat,
    title =? "win0"                        --> doCenterFloat,
    title =? ".*Emulator.*"                --> doCenterFloat,
    title =? ".screen share.*"             --> doCenterFloat,

    -- Assign to workspace
    className =? "code-oss"                --> doShift "3",
    className =? "firefoxdeveloperedition" --> doShift "6",
    className =? "Thunderbird"             --> doShift "7",
    className =? "Slack"                   --> doShift "8",
    className =? "Element"                 --> doShift "9"
  ]
myEventHook   = dynamicPropertyChange "WM_NAME" (title =? "Spotify" --> doShift "10")
myLogHook     = ewmhDesktopsLogHook
myStartupHook = do
  -- Background
  spawn "$HOME/seims/.config/scripts/dotfiles.sh"
  spawn "$HOME/.config/seims/scripts/polybar.sh"
  spawn "picom -b"
  spawn "redshift"
  spawn "nm-applet"
  spawn "blueman-applet"
  spawn "xinput set-prop \"ETPS/2 Elantech Touchpad\" \"libinput Tapping Enabled\" 1"
  spawn "xinput set-prop \"ETPS/2 Elantech Touchpad\" \"libinput Natural Scrolling Enabled\" 1"
  spawn "gnome-keyring-daemon --start --components=secrets"
  spawn "unclutter"
  spawn "clipmenud"

  -- Autostart
  spawnOnce "firefox-developer-edition"
  spawnOnce "thunderbird"
  spawnOnce "slack"
  spawnOnce "element-desktop"
  spawnOnce "spotify"

main = do
  nScreens <- countScreens
  xmonad $ docks . ewmh $ desktopConfig {
    -- simple stuff
    terminal           = myTerminal,
    focusFollowsMouse  = myFocusFollowsMouse,
    clickJustFocuses   = myClickJustFocuses,
    borderWidth        = myBorderWidth,
    modMask            = myModMask,
    workspaces         = myWorkspaces,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,
    keys               = const empty,
    -- hooks, layouts
    layoutHook         = myLayout,
    manageHook         = myManageHook,
    handleEventHook    = myEventHook,
    logHook            = myLogHook,
    startupHook        = myStartupHook
  } `additionalKeysP` myAdditionalKeys nScreens

-- Custom X actions
openScreen :: ScreenId -> X ()
openScreen s = withScreen s view

switchTo :: WorkspaceId -> ScreenId -> X ()
switchTo w nScreens = sequence_ [openScreen s, windows $ greedyView w, warpToWindow 0.5 0.5]
  where s = screenFor w nScreens

shiftTo :: WorkspaceId -> ScreenId -> X ()
shiftTo w nScreens = sequence_ [windows $ shift w, switchTo w nScreens]
  where s = screenFor w nScreens

withScreen :: ScreenId -> (WorkspaceId -> WindowSet -> WindowSet) -> X ()
withScreen s f = screenWorkspace s >>= flip whenJust (windows . f)

-- Helper functions
screenFor :: WorkspaceId -> ScreenId -> ScreenId
screenFor workspace nScreens = fromInteger s
  where w = read workspace - 1
        n = toInteger nScreens
        m = toInteger (length myWorkspaces)
        s = w `div` (m `div` n)

toggleFloat :: Window -> X ()
toggleFloat w = windows (\s -> if member w (floating s)
  then sink w s
  else float w floatingRect s)

floatingRect :: RationalRect
floatingRect = RationalRect (1/10) (1/10) (8/10) (8/10)
