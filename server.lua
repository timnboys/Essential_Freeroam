RegisterServerEvent('playerSpawn')
AddEventHandler('playerSpawn', function()
	TriggerClientEvent('es_freeroam:spawnPlayer', source, 464.091, -997.166, 24.915)
end)

AddEventHandler('es:playerLoaded', function(source)
	-- Get the players money amount
	TriggerEvent("es:getPlayerFromId", source, function(user)
	user:setMoney((user.money))
	end)
end)
