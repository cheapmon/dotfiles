import Data.Map hiding (map, keys)
import Data.Monoid
import System.Exit
import XMonad
import XMonad.Actions.Warp
import XMonad.Config.Desktop
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.IndependentScreens
import XMonad.Layout.Tabbed
import XMonad.StackSet hiding (workspaces)
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

myTerminal          = "alacritty"
myFocusFollowsMouse = True
myClickJustFocuses  = False
myBorderWidth       = 2
myModMask           = mod4Mask

myWorkspaces nScreens = withScreens nScreens (map show [1..5])

myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#ffffff"

myKeys conf@(XConfig {XMonad.modMask = modm}) = fromList $
  -- switch screen / move window to screen
  [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
    | (key, sc) <- zip [xK_m, xK_comma, xK_period] [0..]
    , (f, m) <- [(view, 0), (shift, shiftMask)]]

myAdditionalKeys =
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
    ("M-t",        withFocused $ windows . sink),
    ("M-u",        sendMessage (IncMasterN 1)),
    ("M-i",        sendMessage (IncMasterN (-1))),

    -- Move to workspace
    ("M-1",        switchTo 0 "1"),
    ("M-2",        switchTo 0 "2"),
    ("M-3",        switchTo 0 "3"),
    ("M-4",        switchTo 0 "4"),
    ("M-5",        switchTo 0 "5"),
    ("M-6",        switchTo 1 "1"),
    ("M-7",        switchTo 1 "2"),
    ("M-8",        switchTo 1 "3"),
    ("M-9",        switchTo 1 "4"),
    ("M-0",        switchTo 1 "5"),

    -- Move window to workspace
    ("M-S-1",      shiftTo 0 "1"),
    ("M-S-2",      shiftTo 0 "2"),
    ("M-S-3",      shiftTo 0 "3"),
    ("M-S-4",      shiftTo 0 "4"),
    ("M-S-5",      shiftTo 0 "5"),
    ("M-S-6",      shiftTo 1 "1"),
    ("M-S-7",      shiftTo 1 "2"),
    ("M-S-8",      shiftTo 1 "3"),
    ("M-S-9",      shiftTo 1 "4"),
    ("M-S-0",      shiftTo 1 "5")
  ]

myLayout = avoidStruts $ tiled ||| Mirror tiled ||| tabs
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
    workspaces         = myWorkspaces nScreens,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,
    keys = myKeys,
    -- hooks, layouts
    layoutHook         = myLayout,
    manageHook         = myManageHook,
    handleEventHook    = myEventHook,
    logHook            = myLogHook,
    startupHook        = myStartupHook
  } `additionalKeysP` myAdditionalKeys

-- Helper functions
openScreen :: ScreenId -> X ()
openScreen s = withScreen s view

switchTo :: ScreenId -> WorkspaceId -> X ()
switchTo s w = sequence_ [openScreen s, windows $ onCurrentScreen view w, warpToWindow 0.5 0.5]

shiftTo :: ScreenId -> WorkspaceId -> X ()
shiftTo s w = sequence_ [windows $ shift (marshall s w), switchTo s w]

withScreen :: ScreenId -> (WorkspaceId -> WindowSet -> WindowSet) -> X ()
withScreen s f = screenWorkspace s >>= flip whenJust (windows . f)
