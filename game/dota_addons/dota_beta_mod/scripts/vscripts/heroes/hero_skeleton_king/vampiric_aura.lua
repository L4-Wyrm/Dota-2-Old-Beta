--[[
	Author: Noya
	Date: 14.01.2015.
	Applies a Lifesteal modifier if the attacked target is not a building and not a mechanical unit
	
	Rework by: Wyrm
	Date: 20.09.2018.
	Removed IsMechanical function, due to it has been removed from entire game!
	For gamemode: Dota 2 Old Beta]]
function VampiricAuraApply( event )
	-- Variables
	local attacker = event.attacker
	local target = event.target
	local ability = event.ability

--[[
	if target.GetInvulnCount == nil and not target:IsMechanical() then
		ability:ApplyDataDrivenModifier(attacker, attacker, "modifier_skeleton_king_vampiric_aura_datadriven", {duration = 0.03})
	end
]]
end