-- Window management

-- Defines for window maximize toggler
local frameCache = {}
local logger = hs.logger.new("windows")

-- Resize current window
function window_resize(how)
   local win = hs.window.focusedWindow()
   local app = win:application():name()
   local windowLayout
   local newrect

   if how == "left" then
      newrect = hs.layout.left50
   elseif how == "right" then
      newrect = hs.layout.right50
   elseif how == "max" then
      newrect = hs.layout.maximized
   end

   win:move(newrect)
end

function winmovescreen(how)
   local win = hs.window.focusedWindow()
   if how == "left" then
      win:moveOneScreenWest()
   elseif how == "right" then
      win:moveOneScreenEast()
   end
end

-- Toggle a window between its normal size, and being maximized
function toggle_window_maximized()
   local win = hs.window.focusedWindow()
   if frameCache[win:id()] then
      win:setFrame(frameCache[win:id()])
      frameCache[win:id()] = nil
   else
      frameCache[win:id()] = win:frame()
      win:maximize()
   end
end

-------- Key bindings

-- Halves of the screen
hs.hotkey.bind(hyper, "Left", hs.fnutils.partial(window_resize, "left"))
hs.hotkey.bind(hyper, "Right", hs.fnutils.partial(window_resize, "right"))

-- Maximized
hs.hotkey.bind(hyper, "Up", hs.fnutils.partial(window_resize, "max"))

-- Move between screens
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Left",  hs.fnutils.partial(winmovescreen, "left"))
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Right", hs.fnutils.partial(winmovescreen, "right"))
