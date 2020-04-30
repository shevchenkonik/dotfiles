hyper = { "cmd", "ctrl", "shift", "alt"}

require "apps"
require "window-management"

hs.hotkey.bind(hyper, "0", function()
    hs.reload()
end)

hs.notify.new({ title="Hammerspoon", informativeText="Config loaded" }):send()
