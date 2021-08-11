import XMonad
import System.Exit
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Actions.SpawnOn
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

------------------------------------------------------------------------
-- Simple

-- Prefered terminal
myTerminal      = "kitty"

-- Focus follow mouse pointer
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

-- Window click just focuses
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Border width
myBorderWidth   = 1

-- Mod key
myModMask       = mod4Mask

-- Workspace names
myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]

-- Unfocused and focused border color
myNormalBorderColor  = "#000000"
myFocusedBorderColor = "#FFFFFF"

------------------------------------------------------------------------
-- Key binds

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch

    -- launch terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- launch rofi
    , ((modm,               xK_d     ), spawn "rofi -show run -theme slate")

    -- launch flameshot
    , ((modm,               xK_Tab   ), spawn "flameshot gui")

	-- launch browser
    , ((modm .|. shiftMask, xK_s     ), spawn "chromium")

	-- launch ranger
	, ((modm .|. shiftMask, xK_d     ), spawn $ XMonad.terminal conf ++ " ranger")
	
	-- windows

    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)

     -- Switch between fullscreen and tiled mode
    , ((modm,               xK_space ), sendMessage NextLayout)

     -- Switch between rounded and flat corner mode
    , ((modm .|. shiftMask, xK_space ), spawn "/home/djay/.xmonad/cornermode.sh")

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm,               xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm,               xK_period), sendMessage (IncMasterN (-1)))

    -- other

    -- Raise Volume
    --, ((modm,                0x1008ff13), spawn "rofi -show")


    -- Mute Volume
    --, ((modm,                0x1008ff12), spawn "rofi -show")

    -- Lower Volume   
    --, ((modm,                0x1008ff11), spawn "rofi -show")
    
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm,               xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

------------------------------------------------------------------------
-- Layouts:

myLayout = tiled ||| noBorders Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = spacing 5 $ Tall nmaster delta ratio 

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

------------------------------------------------------------------------
-- Event handling

myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

myStartupHook :: X ()
myStartupHook = do
        spawn "/home/djay/.xmonad/startup.sh"

------------------------------------------------------------------------
-- Run XMonad

main = xmonad myConfig

myConfig = def {
      -- Simple
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- Key binds
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }
