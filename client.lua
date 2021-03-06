local display = false
local id = 0

RegisterNUICallback("error", function(data)
    SetDisplay(false)
end)

RegisterCommand("announce", function(source, args)
    local args = table.concat(args, " ")
    
    if args ~= nil then
        TriggerEvent('lp_notify', "Announce", args, 10)
    end
end)

RegisterCommand("id", function(source, args)
    id = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))
    TriggerEvent('lp_notify', "Announce", "ID: " ..id, 5)
end)

RegisterNetEvent('lp_notify')
AddEventHandler('lp_notify', function(title, message, seconds)
    SendNUIMessage({
        type = "ui",
	title = title,
        message = message,
        seconds = seconds,
    })
    PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
end)
