local usbWatcher = nil

function usbDeviceCallback(data)
    if (data["productName"] == "USB Keyboard") then
        if (data["eventType"] == "added") then
            hs.execute('/Applications/Karabiner.app/Contents/Library/bin/karabiner select usb-keyboard')
        elseif (data["eventType"] == "removed") then
            hs.execute('/Applications/Karabiner.app/Contents/Library/bin/karabiner select default')
        end
    end
end

usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()
