--[[Kill wolves on resummon
	Author: Noya
	Date: 20.01.2015.]]

--[[Edited by: Wyrm
	Data: 04.11.2017.
	For gamemode: Dota 2 Old Beta]]
function KillBoar( event )
	local caster = event.caster
	local targets = caster.boar or {}
for _,unit in pairs(targets) do	
	if unit and IsValidEntity(unit) then
		unit:ForceKill(true)
		end
	end
-- Reset table
caster.boar = {}
end

--[[
	Author: Noya
	Date: 20.01.2015.
	Gets the summoning forward direction for the new units
]]

--[[
	Edited by: Wyrm
	Data: 04.11.2017.
	For gamemode: Dota 2 Old Beta
	]]
function GetSummonPoints( event )

	local caster = event.caster
	local fv = caster:GetForwardVector()
	local origin = caster:GetAbsOrigin()
	local distance = event.distance
-- Gets 1 points facing a distance away from the caster origin and separated from each other at 30 degrees left and right
	ang_left = QAngle(0, 30, 0)
local front_position = origin + fv * distance
	point_left = RotatePosition(origin, ang_left, front_position)
local result = { }
	table.insert(result, point_left)
return result
end

-- Set the units looking at the same point of the caster
function SetUnitsMoveForward( event )
	local caster = event.caster
	local target = event.target
	local fv = caster:GetForwardVector()
	local origin = caster:GetAbsOrigin()
target:SetForwardVector(fv)
-- Add the target to a table on the caster handle, to find them later
table.insert(caster.boar, target)
end


