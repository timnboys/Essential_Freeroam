-- Spawn override
AddEventHandler('onClientMapStart', function()
    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()
end)

-- Allows the server to spawn the player
RegisterNetEvent('es_freeroam:spawnPlayer')
AddEventHandler('es_freeroam:spawnPlayer', function(x, y, z, model)
    exports.spawnmanager:spawnPlayer({x = x, y = y, z = z, model = model})
end)

  AddEventHandler("playerSpawned", function(spawn)
    -- Send notifications
    Citizen.CreateThread(function()
    while true do
      Wait(0)
      DisplayCash(false);
      SetNotificationTextEntry("STRING");
      AddTextComponentString("Welcome to ~g~FiveM!.\n ~y~For more info go to github.com/FiveM-Scripts");
      SetNotificationMessage("CHAR_ALL_PLAYERS_CONF", "CHAR_ALL_PLAYERS_CONF", true, 1, "Essential Freeroam", "v0.1.1");
      DrawNotification(false, true);
      Wait(500000)
    end
 end)

   Citizen.CreateThread(function()
     GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_KNIFE"), true, true)
   end)
 end)

  -- Display text
    RegisterNetEvent("es_freeroam:displaytext")
    AddEventHandler("es_freeroam:displaytext", function(text, time)
      ClearPrints()
    	SetTextEntry_2("STRING")
    	AddTextComponentString(text)
    	DrawSubtitleTimed(time, 1)
    end)

    -- Display notification
    RegisterNetEvent("es_freeroam:notify")
    AddEventHandler("es_freeroam:notify", function(icon, type, sender, title, text)
      Citizen.CreateThread(function()
        Wait(1)
        SetNotificationTextEntry("STRING");
        AddTextComponentString(text);
        SetNotificationMessage(icon, icon, true, type, sender, title, text);
        DrawNotification(false, true);
      end)
    end)
