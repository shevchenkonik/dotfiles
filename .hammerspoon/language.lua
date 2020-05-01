local module   = {}

module.timeFrame = 1

module.action = function()
    local currentLanguage = hs.keycodes.currentLayout()

    if currentLanguage == "U.S." then
        hs.keycodes.setLayout("Russian")
    else
        hs.keycodes.setLayout("U.S.")
    end
end

local timeFirstControl, firstDown, secondDown = 0, false, false

local noFlags = function(ev)
    local result = true
    for k,v in pairs(ev:getFlags()) do
        if v then
            result = false
            break
        end
    end
    return result
end

local onlyCtrl = function(ev)
    local result = ev:getFlags().alt
    for k,v in pairs(ev:getFlags()) do
        if k ~= "alt" and v then
            result = false
            break
        end
    end
    return result
end

module.eventWatcher = hs.eventtap.new({hs.eventtap.event.types.flagsChanged, hs.eventtap.event.types.keyDown}, function(ev)
    if (hs.timer.secondsSinceEpoch() - timeFirstControl) > module.timeFrame then
        timeFirstControl, firstDown, secondDown = 0, false, false
    end

    if ev:getType() == hs.eventtap.event.types.flagsChanged then
        if noFlags(ev) and firstDown and secondDown then
            if module.action then module.action() end
            timeFirstControl, firstDown, secondDown = 0, false, false
        elseif onlyCtrl(ev) and not firstDown then
            firstDown = true
            timeFirstControl = hs.timer.secondsSinceEpoch()
        elseif onlyCtrl(ev) and firstDown then
            secondDown = true
        elseif not noFlags(ev) then
            timeFirstControl, firstDown, secondDown = 0, false, false
        end
    else
        timeFirstControl, firstDown, secondDown = 0, false, false
    end
    return false
end):start()