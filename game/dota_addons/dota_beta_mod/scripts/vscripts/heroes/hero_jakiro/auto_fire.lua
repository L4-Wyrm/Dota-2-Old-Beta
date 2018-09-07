--[[
	Author: kritth
	Date: 09.01.2015
	Reset cooldown after attack is landed

	Rework by: Wyrm
	Date: 15.12.2016
	For gamemode: Dota 2 Old Beta
]]

require('libraries/animations')

function auto_fire_set_cooldown( keys )
	-- Variables
	local caster = keys.caster
	local ability = keys.ability
	local cooldown = ability:GetCooldown( ability:GetLevel() )
	local modifierName = "modifier_jakiro_auto_fire_datadriven"
	
	-- Remove cooldown
	caster:RemoveModifierByName( modifierName )
	ability:StartCooldown( cooldown )
	Timers:CreateTimer( cooldown, function()
			ability:ApplyDataDrivenModifier( caster, caster, modifierName, {} )
			return nil
		end
	)
end

function auto_fire_anim( event )
	-- Variables
	local unit = event.caster
	
	StartAnimation(unit, {duration=1.3, activity=ACT_DOTA_ATTACK, translate="liquid_fire"})
end