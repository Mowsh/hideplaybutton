#!/bin/bash

# Remove play button on startup
defaults write ~/Library/Preferences/com.apple.controlstrip MiniCustomized '(com.apple.system.brightness, com.apple.system.volume, com.apple.system.mute )'

while true
do
    while true
    do
        spotifyrunning=$(ps aux | grep spotify | grep -vc grep)
        if [ "$spotifyrunning" == "1" ]; then
            echo "Spotify is running!  Waiting for it to close"
            defaults write ~/Library/Preferences/com.apple.controlstrip MiniCustomized '(com.apple.system.media-play-pause, com.apple.system.brightness, com.apple.system.volume, com.apple.system.mute )'
            killall ControlStrip
            break
        fi
        sleep 1
    done
    while true
    do
        spotifyrunning=$(ps aux | grep spotify | grep -vc grep)
        if [ "$spotifyrunning" == "0" ]; then
            echo "Spotify closed!  Waiting for it to open"
            defaults write ~/Library/Preferences/com.apple.controlstrip MiniCustomized '(com.apple.system.brightness, com.apple.system.volume, com.apple.system.mute )'
            killall ControlStrip
            break
        fi
        sleep 1
    done
done
