local spotify = {}

function spotify.playing()
    local album = hs.spotify.getCurrentAlbum()
    local artist = hs.spotify.getCurrentArtist()
    local track = hs.spotify.getCurrentTrack()
    local message = "Now playing: \n" .. artist .. " - " .. track .. " - " .. album

    hs.notify.new({ title="Spotify", subTitle=artist, informativeText=track }):send()
end

function spotify.nextNotify()
    hs.spotify.next()
    hs.timer.doAfter(0.5, spotify.playing())
end

hs.hotkey.bind(hyper, "Space", function()
    spotify.nextNotify()
end)
