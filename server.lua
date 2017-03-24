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

RegisterServerEvent('es_freeroam:pay')
AddEventHandler('es_freeroam:pay', function(amount)
	-- Get the players money amount
	TriggerEvent("es:getPlayerFromId", source, function(user)
		if(user.money > amount) then
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Your transaction is ~g~completed.")
			user:removeMoney((amount))
		else
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Your transaction is ~r~rejected.")
		end
	end)
end)
