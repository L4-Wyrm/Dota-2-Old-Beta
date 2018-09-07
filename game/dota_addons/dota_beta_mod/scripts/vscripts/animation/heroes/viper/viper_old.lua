--============ Copyright (c) Valve Corporation, All rights reserved. ==========
--
-- source1import auto-generated animation script
-- local changes will be overwritten if source1import if run again on this asset
--
-- mdl: models\heroes\viper\viper.mdl
--
-- Edited by Wyrm, for custom made gamemode Dota 2 Old Beta
--
--=============================================================================

--[[
model:CreateWeightlist(
	"spine",
	{
		{ "root", 1 },
		{ "Arm1_0_R", 1 },
		{ "Arm0_0_L", 1 },
		{ "Tail0_0", 0 },
		{ "spine1", 0 },
		{ "spine2", 0 }
	}
)

model:CreateWeightlist(
	"full",
	{
		{ "root", 1 }
	}
)


-- AsLookLayer
model:CreateSequence(
	{
		name = "@turns_lookFrame_0",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turns", frame = 0, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@turns_lookFrame_1",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turns", frame = 1, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@turns_lookFrame_2",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turns", frame = 2, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)


model:CreateSequence(
	{
		name = "turns",
		delta = true,
		poseParamX = model:CreatePoseParameter( "turn", -1, 1, 0, false ),
		sequences = {
			{ "@turns_lookFrame_0", "@turns_lookFrame_1", "@turns_lookFrame_2" }
		}
	}
)
--]]

model:CreateSequence(
	{
		name = "wings",
		sequences = {
			{ "@wings" }
		},
		weightlist = "spine",
		activities = {
			{ name = "ACT_DOTA_CONSTANT_LAYER", weight = 1 }
		}
	}
)
