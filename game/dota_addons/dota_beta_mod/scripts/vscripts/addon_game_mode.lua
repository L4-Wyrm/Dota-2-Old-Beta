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
--------------------------------------------------------------------------------
-- ACTIVATE
--------------------------------------------------------------------------------
function Activate()
    GameRules.BetaDota = BetaDota()
    GameRules.BetaDota:InitGameMode()
  
  -- Bots behavior
  local mode = GameRules:GetGameModeEntity()
    mode:SetBotThinkingEnabled( true )
  --mode:SetBotsAlwaysPushWithHuman( true )   

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

        -- Eanble bots and fill empty slots
        if IsServer() == true and 10 - self.numPlayers > 0 then
            print("Adding bots in empty slots")

            for i=1, 5 do
                Tutorial:AddBot(used_hero_name, "", "", true)
                Tutorial:AddBot(used_hero_name, "", "", false)
            end

            GameRules:GetGameModeEntity():SetBotThinkingEnabled(true)
            SendToServerConsole("dota_bot_set_difficulty 2")
            --SendToServerConsole("dota_bot_populate")
		end
	elseif state == DOTA_GAMERULES_STATE_PRE_GAME then
      Tutorial:StartTutorialMode()
    end
end
--------------------------------------------------------------------------------
-- PRECACHE
--------------------------------------------------------------------------------

function Precache( context )

	PrecacheResource( "particle_folder", "particles/units/heroes", context )	
	PrecacheResource( "material_folder", "resource/flash3/images/items", context )	
	PrecacheResource( "material_folder", "resource/flash3/images/spellicons", context )	
	PrecacheResource( "video", "*.webm", context )
	PrecacheResource( "video", "*.usm", context )
	
end

--------------------------------------------------------------------------------
-- INIT
--------------------------------------------------------------------------------
function BetaDota:InitGameMode()
	local GameMode = GameRules:GetGameModeEntity()

	GameRules:GetGameModeEntity():SetUseCustomHeroLevels( true )
    GameRules:GetGameModeEntity():SetCustomXPRequiredToReachNextLevel( XP_PER_LEVEL_TABLE )
	GameRules:GetGameModeEntity():SetDeathOverlayDisabled( true )
	GameRules:GetGameModeEntity():DisableHudFlip( true )
	GameRules:GetGameModeEntity():SetSelectionGoldPenaltyEnabled( false )
	
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 5 )
	
	
	-- Enable the standard Dota Beta game rules
	GameRules:GetGameModeEntity():SetTowerBackdoorProtectionEnabled( true )
	GameRules:SetStartingGold( 603 )
	
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