-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --
-- NO TOUCHY, IF SOMETHING IS WRONG CONTACT KANERSPS! --

-- Constructor
Player = {}
Player.__index = Player

-- Meta table for users
setmetatable(Player, {
	__call = function(self, source, permission_level, money, dirty_money, identifier, group)
		local pl = {}

		pl.source = source
		pl.permission_level = permission_level
		pl.money = money
		pl.dirty_money = dirty_money
		pl.identifier = identifier
		pl.group = group
		pl.coords = {x = 0.0, y = 0.0, z = 0.0}
		pl.session = {}

		return setmetatable(pl, Player)
	end
})

-- Getting permissions
function Player:getPermissions()
	return self.permission_level
end

-- Setting them
function Player:setPermissions(p)
	TriggerEvent("es:setPlayerData", self.source, "permission_level", p, function(response, success)
		self.permission_level = p
	end)
end

-- No need to ever call this (No, it doesn't teleport the player)
function Player:setCoords(x, y, z)
	self.coords.x, self.coords.y, self.coords.z = x, y, z
end

-- Kicks a player with specified reason
function Player:kick(reason)
	DropPlayer(self.source, reason)
end

-- Sets the player money (required to call this from now)
function Player:setMoney(m)
	local prevMoney = self.money
	local newMoney : double = m

	self.money = m

	if((prevMoney - newMoney) < 0)then
		TriggerClientEvent("es:addedMoney", self.source, math.abs(prevMoney - newMoney))
	else
		TriggerClientEvent("es:removedMoney", self.source, math.abs(prevMoney - newMoney))
	end

	TriggerClientEvent('es:activateMoney', self.source , self.money)
end

-- Adds to player money (required to call this from now)
function Player:addMoney(m)
	local newMoney : double = self.money + m

	self.money = newMoney

	TriggerClientEvent("es:addedMoney", self.source, m)
	TriggerClientEvent('es:activateMoney', self.source , self.money)
end

-- Removes from player money (required to call this from now)
function Player:removeMoney(m)
	local newMoney : double = self.money - m

	self.money = newMoney

	TriggerClientEvent("es:removedMoney", self.source, m)
	TriggerClientEvent('es:activateMoney', self.source , self.money)
end

-- Player session variables
function Player:setSessionVar(key, value)
	self.session[key] = value
end

function Player:getSessionVar(key)
	return self.session[key]
end

function Player:setDirtyMoney(m) --Setting the dirty money
	local prevMoney = self.dirty_money
	local newMoney : double = m

	self.dirty_money = m

	if((prevMoney - newMoney) < 0)then
		TriggerClientEvent("es:addeddMoney", self.source, math.abs(prevMoney - newMoney))
	else
		TriggerClientEvent("es:removeddMoney", self.source, math.abs(prevMoney - newMoney))
	end

	TriggerClientEvent('es:activatedMoney', self.source , self.dirty_money)
end

function Player:addDirtyMoney(m) --Add dirty money to the player
	local newMoney : double = self.dirty_money + m

	self.dirty_money = newMoney

	TriggerClientEvent("es:addeddMoney", self.source, m)
	TriggerClientEvent('es:activatedMoney', self.source , self.dirty_money)
end

function Player:removeDirtyMoney(m) --Remove dirty money from the player
	local newMoney : double = self.dirty_money - m

	self.dirty_money = newMoney

	TriggerClientEvent("es:removeddMoney", self.source, m)
	TriggerClientEvent('es:activatedMoney', self.source , self.dirty_money)
end
