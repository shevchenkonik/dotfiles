InputSource = {
    EN = {
        id = "ABC",
        label = "EN",
    },
    RU = {
        id = "Russian",
        label = "RU"
    }
}

AppEventLogger = hs.logger.new("App Event", "info")

function HandleAppEvent(app, event)
    AppEventLogger.f("%s - New Event: %s", app, event)

    if app == "Alacritty"
        or app == "Obsidian"
    then
        InputSource:activateEN()
    elseif app == "Telegram" then
        InputSource.activateRU()
    end
end

function InputSource:activateEN(current)
    local EN = self.EN

    if current ~= EN.id then
        hs.keycodes.setLayout(EN.id)
    end
end

function InputSource:activateRU(current)
    local RU = self.RU

    if current ~= RU.id then
        hs.keycodes.setLayout(RU.id)
    end
end

AppWatcher = hs.application.watcher.new(HandleAppEvent)

AppWatcher:start()