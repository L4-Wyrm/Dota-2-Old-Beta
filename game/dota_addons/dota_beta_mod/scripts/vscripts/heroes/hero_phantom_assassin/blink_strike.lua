--[[Author: YOLOSPAGHETTI
	Date: February 5, 2016
	Puts Phantom Assassin ahead the target, if the target is an enemy, applies the bonus damage, 
	and queues up an attack order on the target
	
	Rework by: Wyrm
	Date: 16.01.2017.
	Updated: 01.02.2017
	For gamemode: Dota 2 Old Beta]]
function BlinkStrike( keys )
	local caster = keys.caster
	local target = keys.target
	local ability = keys.ability
	local ability_level = ability:GetLevel() - 1

	-- Ability variables
	local bonus_damage = ability:GetLevelSpecialValueFor("bonus_damage", ability_level)
	local victim_angle = target:GetAnglesAsVector()
	local victim_forward_vector = target:GetForwardVector()
	
	-- Angle and positioning variables
	local victim_angle_rad = victim_angle.y*math.pi/180
	local victim_position = target:GetAbsOrigin()
	local attacker_new = target:GetAbsOrigin() + victim_forward_vector * 100
	
	
	-- Sets Phantom Assassin ahead the victim and facing it
	caster:SetAbsOrigin(attacker_new)
	FindClearSpaceForUnit(caster, attacker_new, true)
	caster:SetForwardVector(-victim_forward_vector)
	
	-- If the target is an enemy then apply the bonus damage
	if target:GetTeamNumber() ~= caster:GetTeamNumber() then
	
		ApplyDamage({victim = target, attacker = caster, damage = bonus_damage, damage_type = ability:GetAbilityDamageType()})
	end
	
	-- Order the caster to attack the target
	-- Necessary on jumps to allies as well (does not actually attack), otherwise Riki will turn back to his initial angle
	order = 
	{
		UnitIndex = caster:entindex(),
		OrderType = DOTA_UNIT_ORDER_ATTACK_TARGET,
		TargetIndex = target:entindex(),
		AbilityIndex = ability,
		Queue = true
	}

	ExecuteOrderFromTable(order)
end