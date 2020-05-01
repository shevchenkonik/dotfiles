hyper = { "cmd", "ctrl", "shift", "alt"}

require "apps"
require "window-management"
require "music"
require "pomodoro"
require "wake-up"
require "language"

-- Watcher
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

configWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

hs.notify.new({ title="Hammerspoon", informativeText="Config loaded" }):send()