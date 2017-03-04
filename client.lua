-- Spawn override
AddEventHandler('onClientMapStart', function()
    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()

    exports.spawnmanager:setAutoSpawnCallback(function()
        if spawnLock then
            return
        end

      --  spawnLock = true

        TriggerServerEvent('playerSpawn')
        TriggerEvent('playerSpawn')
    end)
end)

-- Allows the server to spawn the player
RegisterNetEvent('es_freeroam:spawnPlayer')
AddEventHandler('es_freeroam:spawnPlayer', function(x, y, z, model)
    exports.spawnmanager:spawnPlayer({x = x, y = y, z = z, model = model})
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
    AddEventHandler("es_freeroam:notify", function(type, text, title, subtitle)
      SetNotificationTextEntry("STRING");
      AddTextComponentString(text);
      SetNotificationMessage(type, type, true, 1, title, subtitle);
      DrawNotification(false, true);
    end)
