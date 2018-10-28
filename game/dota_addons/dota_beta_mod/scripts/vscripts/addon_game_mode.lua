--//////////////////////////////////////////////////////////////
-- This file is created for custom gamemode: Dota 2 Old Beta. //
-- 			DO NOT CHANGE ANYTING THERE!	      			  //
--//////////////////////////////////////////////////////////////

--[[
Dota Beta game mode
]]

print( "Dota Beta game mode loaded." )

if BetaDota == nil then
	BetaDota = class({})
end

-- This library allow for easily delayed/timed actions
require('libraries/timers')
-- This library can be used for starting customized animations on units from lua
require('libraries/animations')
-- beta_settings.lua is where you can specify different properties for this game mode.
require('beta_settings')
--------------------------------------------------------------------------------
-- ACTIVATE
--------------------------------------------------------------------------------
function Activate()
    GameRules.BetaDota = BetaDota()
    GameRules.BetaDota:InitGameMode()
	
   ListenToGameEvent( "game_rules_state_change", Dynamic_Wrap( BetaDota, 'OnGameStateChanged' ), self )
end

--------------------------------------------------------------------------------
-- GAME STATE CHANGED
--------------------------------------------------------------------------------

function BetaDota:OnGameStateChanged( keys )
    local state = GameRules:State_Get()
	
	if state == DOTA_GAMERULES_STATE_STRATEGY_TIME then
        local num = 0
		local used_hero_name = "npc_dota_hero_io"
		
		for i=0, DOTA_MAX_TEAM_PLAYERS do
            if PlayerResource:IsValidPlayer(i) then
                print(i)

                used_hero_name = PlayerResource:GetSelectedHeroName(i)
				num = num + 1
            end
        end
		
		
		
        self.numPlayers = num
        print("Number of players:", num)
		
         -- Enable bots and fill empty slots
        if IsServer() == true and 10 - self.numPlayers > 0 then
            print("Adding bots in empty slots")
            
			if GameRules:IsCheatMode() == CHEATSBOTS and IsInToolsMode() == TOOLSBOTS then
				
				if GetMapName() == "dota_681" then
					for i=1, 5 do
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, false)
					end
				end
			
				if GetMapName() == "dota_681_winter" then
					for i=1, 5 do
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, false)
					end
				end
			
				if GetMapName() == "dota_681_autumn" then
					for i=1, 5 do
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, false)
					end
				end
			
				if GetMapName() == "dota_682" then
					for i=1, 5 do
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, false)
					end
				end
			
				if GetMapName() == "dota_682_winter" then
					for i=1, 5 do
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, false)
					end
				end
			
				if GetMapName() == "dota_682_newbloom" then
					for i=1, 5 do
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, false)
					end
				end
			Tutorial:StartTutorialMode()
			end
		end
		
		-- Enable bots and fill empty slots
        if IsServer() == true and 6 - self.numPlayers > 0 then
			print("Adding bots in empty slots")
            if GameRules:IsCheatMode() == CHEATSBOTS and IsInToolsMode() == TOOLSBOTS then
			
			
				if GetMapName() == "dota_681_3v3" then
					for i=1, 3 do
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, false)
					end
				end
			
				if GetMapName() == "dota_681_winter_3v3" then
					for i=1, 3 do
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, false)
					end
				end
			
				if GetMapName() == "dota_681_autumn_3v3" then
					for i=1, 3 do
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, false)
					end
				end
			
				if GetMapName() == "dota_682_3v3" then
					for i=1, 3 do
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, false)
					end
				end
			
				if GetMapName() == "dota_682_winter_3v3" then
					for i=1, 3 do
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, false)
					end
				end
			
				if GetMapName() == "dota_682_newbloom_3v3" then
					for i=1, 3 do
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "", BOTS_DIFFICULTY, false)
					end
				end
			Tutorial:StartTutorialMode()
			end
		end
		
		-- If 1v1 map then set mid bots
		if IsServer() == true and 2 - self.numPlayers > 0 then	
			print("Adding bots in empty slots")
			if GameRules:IsCheatMode() == CHEATSBOTS and IsInToolsMode() == TOOLSBOTS then
			
				if GetMapName() == "dota_681_1v1" then
					for i=1, 2 do
						Tutorial:AddBot(used_hero_name, "mid", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "mid", BOTS_DIFFICULTY, false)
					end
				elseif GetMapName() == "dota_681_winter_1v1" then
					for i=1, 2 do
						Tutorial:AddBot(used_hero_name, "mid", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "mid", BOTS_DIFFICULTY, false)
					end
				elseif GetMapName() == "dota_681_autumn_1v1" then
					for i=1, 2 do
						Tutorial:AddBot(used_hero_name, "mid", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "mid", BOTS_DIFFICULTY, false)
					end
				elseif GetMapName() == "dota_682_1v1" then
					for i=1, 2 do
						Tutorial:AddBot(used_hero_name, "mid", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "mid", BOTS_DIFFICULTY, false)
					end
				elseif GetMapName() == "dota_682_winter_1v1" then
					for i=1, 2 do
						Tutorial:AddBot(used_hero_name, "mid", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "mid", BOTS_DIFFICULTY, false)
					end
				elseif GetMapName() == "dota_682_newbloom_1v1" then
					for i=1, 2 do
						Tutorial:AddBot(used_hero_name, "mid", BOTS_DIFFICULTY, true)
						Tutorial:AddBot(used_hero_name, "mid", BOTS_DIFFICULTY, false)
					end
				end
			Tutorial:StartTutorialMode()
			end
		end
		if GameRules:IsCheatMode() == true then
			GameRules:SetSafeToLeave( true )
			SendToServerConsole( "sv_cheats 1" )
		elseif GameRules:IsCheatMode() == false then
			GameRules:SetSafeToLeave( false )
			SendToServerConsole( "sv_cheats 0" )
		end
	end
	if state == DOTA_GAMERULES_STATE_STRATEGY_TIME then
		for i=0, DOTA_MAX_TEAM_PLAYERS do
            if PlayerResource:IsValidPlayer(i) then
                print(i)

				-- Random heroes for people who have not picked
				if PlayerResource:HasSelectedHero(i) == false then
                    print("Randoming hero for:", i)

                    local player = PlayerResource:GetPlayer(i)
                    player:MakeRandomHeroSelection()

                    local hero_name = PlayerResource:GetSelectedHeroName(i)

                    print("Randomed:", hero_name)
                end
				
				-- Give gold when hero randomed
				if PlayerResource:HasRandomed(i) == true then
					PlayerResource:SetGold( i, RANDOMED_GOLD, false )
					PlayerResource:SetGold( i, 0, true )
				end
            end
        end
	end
end
--------------------------------------------------------------------------------
-- PRECACHE
--------------------------------------------------------------------------------

function Precache( context )
	
	--Cache particles for heroes
		PrecacheResource( "particle_folder", "particles/units/heroes/hero_elder_titan", context )
		PrecacheResource( "particle_folder", "particles/units/heroes/hero_jakiro", context )
		PrecacheResource( "particle_folder", "particles/units/heroes/hero_nevermore", context )
		PrecacheResource( "particle_folder", "particles/units/heroes/hero_skeletonking", context )
		PrecacheResource( "particle_folder", "particles/units/heroes/hero_slardar", context )
		PrecacheResource( "particle_folder", "particles/units/heroes/hero_spectre", context )
		PrecacheResource( "particle_folder", "particles/units/heroes/hero_stormspirit", context )
		PrecacheResource( "particle_folder", "particles/units/heroes/hero_vengeful", context )
		PrecacheResource( "particle_folder", "particles/units/heroes/hero_venomancer", context )
		PrecacheResource( "particle_folder", "particles/units/heroes/hero_zeus", context )
		PrecacheResource( "particle_folder", "particles/units/heroes/hero_zuus", context )
		
	--Cache particles for items
		PrecacheResource( "particle_folder", "particles/econ/items/storm_spirit/storm_spirit_orchid_hat", context )

	--Cache particles for fx
		PrecacheResource( "particle_folder", "particles/themed_fx", context )
		PrecacheResource( "particle_folder", "particles/winter_fx", context )
		PrecacheResource( "particle_folder", "particles/world_environmental_fx", context )
		PrecacheResource( "particle_folder", "particles/generic_hero_status", context )

	--Cache models for heroes
		PrecacheResource( "model_folder", "models/heroes/axe", context )
		PrecacheResource( "model_folder", "models/heroes/beastmaster", context )
		PrecacheResource( "model_folder", "models/heroes/brewmaster", context )
		PrecacheResource( "model_folder", "models/heroes/broodmother", context )
		PrecacheResource( "model_folder", "models/heroes/chen", context )
		PrecacheResource( "model_folder", "models/heroes/dazzle", context )
		PrecacheResource( "model_folder", "models/heroes/earthshaker", context )
		PrecacheResource( "model_folder", "models/heroes/enigma", context )
		PrecacheResource( "model_folder", "models/heroes/faceless_void", context )
		PrecacheResource( "model_folder", "models/heroes/gyro", context )
		PrecacheResource( "model_folder", "models/heroes/jakiro", context )
		PrecacheResource( "model_folder", "models/heroes/lion", context )
		PrecacheResource( "model_folder", "models/heroes/luna", context )
		PrecacheResource( "model_folder", "models/heroes/phantom_assassin", context )
		PrecacheResource( "model_folder", "models/heroes/puck", context )
		PrecacheResource( "model_folder", "models/heroes/pudge", context )
		PrecacheResource( "model_folder", "models/heroes/rikimaru", context )
		PrecacheResource( "model_folder", "models/heroes/shadow_fiend", context )
		PrecacheResource( "model_folder", "models/heroes/skeleton_king", context )
		PrecacheResource( "model_folder", "models/heroes/slardar", context )
		PrecacheResource( "model_folder", "models/heroes/sniper", context )
		PrecacheResource( "model_folder", "models/heroes/spectre", context )
		PrecacheResource( "model_folder", "models/heroes/storm_spirit", context )
		PrecacheResource( "model_folder", "models/heroes/twin_headed_dragon", context )
		PrecacheResource( "model_folder", "models/heroes/vengeful", context )
		PrecacheResource( "model_folder", "models/heroes/venomancer", context )
		PrecacheResource( "model_folder", "models/heroes/viper", context )
		PrecacheResource( "model_folder", "models/heroes/wraith_king", context )
		PrecacheResource( "model_folder", "models/heroes/zeus", context )
		
	--Cache models for items
		PrecacheResource( "model_folder", "models/items/deathbringer_arms", context )
		PrecacheResource( "model_folder", "models/items/deathbringer_head", context )
		PrecacheResource( "model_folder", "models/items/deathbringer_shoulders", context )
		PrecacheResource( "model_folder", "models/items/deathbringer_tail", context )

	--Cache models for creeps
		PrecacheResource( "model_folder", "models/creeps/neutral_creeps/n_creep_beast", context )
		PrecacheResource( "model_folder", "models/creeps/neutral_creeps/n_creep_dragonspawn_a", context )
		PrecacheResource( "model_folder", "models/creeps/neutral_creeps/n_creep_dragonspawn_b", context )
		PrecacheResource( "model_folder", "models/creeps/neutral_creeps/n_creep_forest_trolls", context )
		PrecacheResource( "model_folder", "models/creeps/neutral_creeps/n_creep_furbolg", context )
		PrecacheResource( "model_folder", "models/creeps/neutral_creeps/n_creep_satyr_a", context )
		
	--Cache materials for heroes
--[[		
		PrecacheResource( "material_folder", "materials/models/heroes/antimage", context )
		PrecacheResource( "material_folder", "materials/models/heroes/axe", context )
		PrecacheResource( "material_folder", "materials/models/heroes/beastmaster", context )
		PrecacheResource( "material_folder", "materials/models/heroes/brewmaster", context )
		PrecacheResource( "material_folder", "materials/models/heroes/broodmother", context )
		PrecacheResource( "material_folder", "materials/models/heroes/chen", context )
		PrecacheResource( "material_folder", "materials/models/heroes/dazzle", context )
		PrecacheResource( "material_folder", "materials/models/heroes/death_prophet", context )
		PrecacheResource( "material_folder", "materials/models/heroes/dragon_knight", context )
		PrecacheResource( "material_folder", "materials/models/heroes/drow", context )
		PrecacheResource( "material_folder", "materials/models/heroes/earthshaker", context )
		PrecacheResource( "material_folder", "materials/models/heroes/enigma", context )
		PrecacheResource( "material_folder", "materials/models/heroes/faceless_void", context )
		PrecacheResource( "material_folder", "materials/models/heroes/gyro", context )
		PrecacheResource( "material_folder", "materials/models/heroes/jakiro", context )
		PrecacheResource( "material_folder", "materials/models/heroes/lion", context )
		PrecacheResource( "material_folder", "materials/models/heroes/luna", context )
		PrecacheResource( "material_folder", "materials/models/heroes/nevermore", context )
		PrecacheResource( "material_folder", "materials/models/heroes/omniknight", context )
		PrecacheResource( "material_folder", "materials/models/heroes/phantom_assassin", context )
		PrecacheResource( "material_folder", "materials/models/heroes/puck", context )
		PrecacheResource( "material_folder", "materials/models/heroes/pudge", context )
		PrecacheResource( "material_folder", "materials/models/heroes/rikimaru", context )
		PrecacheResource( "material_folder", "materials/models/heroes/silencer", context )
		PrecacheResource( "material_folder", "materials/models/heroes/skeleton_king", context )
		PrecacheResource( "material_folder", "materials/models/heroes/slardar", context )
		PrecacheResource( "material_folder", "materials/models/heroes/sniper", context )
		PrecacheResource( "material_folder", "materials/models/heroes/storm_spirit", context )
		PrecacheResource( "material_folder", "materials/models/heroes/twin_headed_dragon", context )
		PrecacheResource( "material_folder", "materials/models/heroes/vengeful", context )
		PrecacheResource( "material_folder", "materials/models/heroes/venomancer", context )
		PrecacheResource( "material_folder", "materials/models/heroes/venommancer", context )
		PrecacheResource( "material_folder", "materials/models/heroes/viper", context )
		PrecacheResource( "material_folder", "materials/models/heroes/witchdoctor", context )
]]		

	--Cache materials for creeps
		PrecacheResource( "material", "materials/models/creeps/neutral_creeps/neutral_beast_color.vmat", context )
		PrecacheResource( "material", "materials/models/creeps/neutral_creeps/neutral_beast_disrupter_color.vmat", context )
		PrecacheResource( "material", "materials/models/creeps/neutral_creeps/neutral_troll_b_color.vmat", context )
		PrecacheResource( "material", "materials/models/creeps/neutral_creeps/satyr_a.vmat", context )

	--Cache materials for overviews
		PrecacheResource( "material", "materials/overviews/dota_600.vmat", context )		
		PrecacheResource( "material", "materials/overviews/dota_681_autumn.vmat", context )		
		PrecacheResource( "material", "materials/overviews/dota_681_winter.vmat", context )		
		PrecacheResource( "material", "materials/overviews/dota_682.vmat", context )		
		PrecacheResource( "material", "materials/overviews/dota_682_winter.vmat", context )		
		
	--Cache materials for minimap
		PrecacheResource( "material", "materials/vgui/hud/minimap_enemyicon.vmat", context )	
		PrecacheResource( "material", "materials/vgui/hud/minimap_hero_sheet.vmat", context )	
		
	--Cache textures for heroes
		PrecacheResource( "texture_folder", "panorama/images/heroes", context )	

	--Cache textures for minimap
		PrecacheResource( "texture", "panorama/images/minimap/dotamap.vtex", context )				

	--Cache sound events
		PrecacheResource( "soundfile", "soundevents/game_sounds_ambient.vsndevts", context )				
		PrecacheResource( "soundfile", "soundevents/game_sounds_roshan_halloween.vsndevts", context )				
		PrecacheResource( "soundfile", "soundevents/voscripts/game_sounds_vo_skeleton_king.vsndevts", context )				
		PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_pudge.vsndevts", context )				
end

--------------------------------------------------------------------------------
-- INIT
--------------------------------------------------------------------------------
function BetaDota:InitGameMode()
	local GameMode = GameRules:GetGameModeEntity()
	
	-- Announcer timers
	self.countdown = nil
	self.pick_countdown = nil
	self.pick2_countdown = nil
	self.countdown_st = nil
	self.pregame = 60
	self.pick = 60
	self.pick2 = 90
	
	-- Enable the standard Dota Beta game rules
	GameRules:GetGameModeEntity():SetTowerBackdoorProtectionEnabled( true )
	GameRules:SetStartingGold( 603 )
	
	GameRules:GetGameModeEntity():SetUseCustomHeroLevels( true )
    GameRules:GetGameModeEntity():SetCustomXPRequiredToReachNextLevel( XP_PER_LEVEL_TABLE )
	GameRules:GetGameModeEntity():SetSelectionGoldPenaltyEnabled( true )
	GameRules:GetGameModeEntity():SetAnnouncerDisabled( false )
	GameRules:GetGameModeEntity():SetKillingSpreeAnnouncerDisabled( false )
	GameRules:SetCustomGameSetupAutoLaunchDelay( 15 )
	GameRules:LockCustomGameSetupTeamAssignment( true )
	GameRules:EnableCustomGameSetupAutoLaunch( true )
	GameRules:SetPreGameTime( 60 )
	GameRules:SetHeroSelectionTime( 60.0 )
	GameRules:SetHeroSelectionTime( 60.0 )
	GameRules:SetCustomGameSetupRemainingTime ( -1 )
    GameRules:SetCustomGameSetupTimeout( -1 )
	GameRules:SetSafeToLeave( false )
	GameRules:SetShowcaseTime( 0 )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 5 )
	GameRules:GetGameModeEntity():SetRuneEnabled( DOTA_RUNE_BOUNTY , false )
	GameRules:GetGameModeEntity():SetRuneEnabled( DOTA_RUNE_ARCANE , false )
	
	-- Remove TP scrolls
	GameRules:GetGameModeEntity():SetItemAddedToInventoryFilter(function(ctx, event)
		local item = EntIndexToHScript(event.item_entindex_const)
			if item:GetAbilityName() == TPSCROLL and item:GetPurchaser() == nil then return false end
		return true
	end, self)
	
	-- Remove bonus armor and tower armor bonus modifiers from all towers
	local allTowers = Entities:FindAllByClassname('npc_dota_tower')
	for i = 1, #allTowers, 1 do
		local tower = allTowers[i]
		if tower:HasModifier('modifier_tower_aura') then
			tower:RemoveModifierByName('modifier_tower_aura')
		end
		if tower:HasModifier('modifier_tower_armor_bonus') then
			tower:RemoveModifierByName('modifier_tower_armor_bonus')
		end
	end
	
	-- Bots behavior
	GameRules:GetGameModeEntity():SetBotThinkingEnabled(true)
	GameRules:GetGameModeEntity():SetBotsAlwaysPushWithHuman( true )   
  
  	-- Sets max players in both teams for 3v3 and 1v1 maps
	-- Also enable snow particles on winter maps (EXPEREMENTAL)
	if GetMapName() == "dota_681_1v1" then
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 1 )
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 1 )
	elseif GetMapName() == "dota_681_3v3" then
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 3 )
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 3 )
	elseif GetMapName() == "dota_681_winter" then
	elseif GetMapName() == "dota_681_winter_1v1" then
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 1 )
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 1 )
	elseif GetMapName() == "dota_681_winter_3v3" then
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 3)
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 3 )
	elseif GetMapName() == "dota_681_autumn_1v1" then
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 1 )
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 1 )
	elseif GetMapName() == "dota_681_autumn_3v3" then
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 3)
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 3 )
	elseif GetMapName() == "dota_682_1v1" then
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 1 )
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 1 )
	elseif GetMapName() == "dota_682_3v3" then
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 3 )
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 3 )
	elseif GetMapName() == "dota_682_winter" then
	elseif GetMapName() == "dota_682_winter_1v1" then
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 1)
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 1 )
	elseif GetMapName() == "dota_682_winter_3v3" then
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 3 )
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 3 )
	elseif GetMapName() == "dota_682_newbloom_1v1" then
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 1)
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 1 )
	elseif GetMapName() == "dota_682_newbloom_3v3" then
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 3)
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 3 )
	end
  
	-- Register Think
	GameMode:SetContextThink( "BetaDota:GameThink", function() return self:GameThink() end, 0.25 )

	-- Register Game Events
end

--------------------------------------------------------------------------------
-- THINK
--------------------------------------------------------------------------------
function BetaDota:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Dota Beta addon script is running." )
		-- Announcer on hero pick
		elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_HERO_SELECTION then	
		if self.pick_countdown == nil then
			self.pick_countdown = 60
			Timers:CreateTimer(self.pick-60, function()			
				if self.pick_countdown == 60 then 
					EmitAnnouncerSound("announcer_announcer_choose_hero")
					self.pick_countdown = 10
					return 50
				elseif self.pick_countdown == 10 then 
--					EmitAnnouncerSound("announcer_announcer_count_pick_10")
					self.pick_countdown = 5
					return 5
				elseif self.pick_countdown == 5 then
--					EmitAnnouncerSound("announcer_announcer_count_pick_5")
					return nil
				end
			end)
		end
		if self.pick2_countdown == nil then
			self.pick2_countdown = 90
			Timers:CreateTimer(self.pick2-90, function()			
				if self.pick2_countdown == 90 then
					self.pick2_countdown = 10
					return 80
				elseif self.pick2_countdown == 10 then 
--					EmitAnnouncerSound("announcer_announcer_count_pick_10")
					self.pick2_countdown = 5
					return 5
				elseif self.pick2_countdown == 5 then
--					EmitAnnouncerSound("announcer_announcer_count_pick_5")
					return nil
				end
			end)
		end
		-- Announcer timer reset on strategy time
		elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_STRATEGY_TIME  then	
		if self.countdown_st == nil then
			self.pick_countdown = nil
			self.pick2_countdown = nil
		end
		-- Announcer on pre game (after hero pick)
		elseif GameRules:State_Get() == DOTA_GAMERULES_STATE_PRE_GAME then	
		if self.countdown == nil then
			self.countdown = 50
			self.pick_countdown = nil
			self.pick2_countdown = nil
			Timers:CreateTimer(self.pregame-50, function()						
				if self.countdown == 50 then 
--					EmitAnnouncerSound("announcer_announcer_battle_prepare_01")
					self.countdown = 30
					return 20
				elseif self.countdown == 30 then 
--					EmitAnnouncerSound("announcer_announcer_count_battle_30")
					self.countdown = 10
					return 20
				elseif self.countdown == 10 then
--					EmitAnnouncerSound("announcer_announcer_count_battle_10")
					self.countdown = 3
					return 7
				elseif self.countdown == 3 then
--					EmitAnnouncerSound("announcer_announcer_battle_begin_01")
					return nil
				end
			end)
		end
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end

--------------------------------------------------------------------------------
function BetaDota:GameThink()
	return 0.25
end

-- Leveling/gold data
XP_PER_LEVEL_TABLE = {
    0,-- 1
    200,-- 2
    500,-- 3
    900,-- 4
    1400,-- 5
    2000,-- 6
    2600,-- 7
    3200,-- 8
    4400,-- 9
    5400,-- 10
    6000,-- 11
    8200,-- 12
    9000,-- 13
    10400,-- 14
    11900,-- 15
    13500,-- 16
    15200,-- 17
    17000,-- 18
    18900,-- 19
    20900,-- 20
    23000,-- 21
    25200,-- 22
    27500,-- 23
    29900,-- 24
    32400 -- 25
}