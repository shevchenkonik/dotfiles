local applicationHotkeys = {
    w = "WebStorm",
    f = "Firefox",
    i = "iTerm",
    t = "Telegram",
    m = "Mail",
    s = "Spotify"
}

for key, app in pairs(applicationHotkeys) do
    hs.hotkey.bind(hyper, key, function()
        hs.application.launchOrFocus(app)
    end)
end