--[[
	Author: Noya
	Date: 9.1.2015.
	Absorbs damage up to the max absorb, substracting from the shield until removed.
	
	Reworked by: Wyrm
	Date: 08.01.2018.
	For gamemode: Dota 2 Old Beta
]]
function KrakenShell( event )
	-- Variables
	local target = event.target

	-- Strong Dispel
	local RemovePositiveBuffs = false
	local RemoveDebuffs = true
	local BuffsCreatedThisFrameOnly = false
	local RemoveStuns = true
	local RemoveExceptions = false
	target:Purge( RemovePositiveBuffs, RemoveDebuffs, BuffsCreatedThisFrameOnly, RemoveStuns, RemoveExceptions)

	end