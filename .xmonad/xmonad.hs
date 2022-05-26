import Data.Map hiding (map, keys)
import Data.Monoid
import System.Exit
import XMonad hiding (float)
import XMonad.Actions.Warp
import XMonad.Config.Desktop
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
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

    -- Layouts
    ("M-<Space>",  sendMessage NextLayout),
    ("M-<R>",      windows focusDown),
    ("M-<L>",      windows focusUp),
    ("M-<D>",      windows focusMaster),
    ("M-<U>",      windows swapMaster),
    ("M-j",        sendMessage Expand),
    ("M-k",        sendMessage Shrink),
    ("M-t",        withFocused toggleFloat),
    ("M-u",        sendMessage (IncMasterN 1)),
    ("M-i",        sendMessage (IncMasterN (-1))),

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
    ("M-S-0",      shiftTo "10" nScreens)
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

myManageHook  = composeAll []
myEventHook   = mempty
myLogHook     = ewmhDesktopsLogHook
myStartupHook = do
  spawn     "$HOME/.config/seims/scripts/polybar.sh"
  spawnOnce "picom -b"

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
