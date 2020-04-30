-- Timer duration in minutes
local duration = 50

-- set this to true to always show the menu bar item (making the keyboard shortcut superfluous):
local alwaysShow = false

local updateTimer, updateMenu, start, pause, reset, stop

local menu
local isActive = false

local timeLeft = duration * 60

local timer = hs.timer.new(1, function() updateTimer() end)

updateTimer = function()
    if not isActive then return end
    timeLeft = timeLeft - 1
    updateMenu()
    if timeLeft <= 0 then
        stop()
        hs.alert.show("Done! 🍒")
    end
end

updateMenu = function()
    if not menu then
        menu = hs.menubar.new()
        menu:setTooltip("Cherry")
    end
    menu:returnToMenuBar()
    local minutes = math.floor(timeLeft / 60)
    local seconds = timeLeft - (minutes * 60)
    local string = string.format("%02d:%02d 🍅", minutes, seconds)
    menu:setTitle(string)

    local items = {
            {title = "Stop", fn = function() stop() end},
        }
    if isActive then
        table.insert(items, 1, {title = "Pause", fn = function() pause() end})
    else
        table.insert(items, 1, {title = "Start", fn = function() start() end})
    end
    menu:setMenu(items)
end

start = function()
    if isActive then return end
    timer:start()
    isActive = true
end

pause = function()
    if not isActive then return end
    timer:stop()
    isActive = false
    updateMenu()
end

stop = function()
    pause()
    timeLeft = duration * 60
    if not alwaysShow then
        menu:delete()
    else
        updateMenu()
    end
end

reset = function()
    timeLeft = duration * 60
    updateMenu()
end

hs.hotkey.bind(hyper, "x", function() start() end)

if alwaysShow then updateMenu() end