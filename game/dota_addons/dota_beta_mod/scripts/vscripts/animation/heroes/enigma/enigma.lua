--============ Copyright (c) Valve Corporation, All rights reserved. ==========
--
-- source1import auto-generated animation script
-- local changes will be overwritten if source1import if run again on this asset
--
-- mdl: models\heroes\enigma\enigma.mdl
--
-- Edited by Wyrm, for custom made gamemode Dota 2 Old Beta
--
--=============================================================================


--[[
-- AsLookLayer
model:CreateSequence(
	{
		name = "@turn_layer_lookFrame_0",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turn_layer", frame = 0, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turn_layer", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@turn_layer_lookFrame_1",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turn_layer", frame = 1, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turn_layer", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@turn_layer_lookFrame_2",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turn_layer", frame = 2, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turn_layer", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "turn_layer",
		delta = true,
		poseParamX = model:CreatePoseParameter( "turn", -1, 1, 0, false ),
		sequences = {
			{ "@turn_layer_lookFrame_0", "@turn_layer_lookFrame_1", "@turn_layer_lookFrame_2" }
		}
	}
)


-- AsTurningRun

model:CreateSequence(
	{
		name = "run_anim",
		sequences = {
			{ "@run_anim" }
		},
		addlayer = {
			"turn_layer",
			"turn_layer"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 }
		}
	}
)


-- AsTurningRun

model:CreateSequence(
	{
		name = "run_chase_anim",
		sequences = {
			{ "@run_chase_anim" }
		},
		addlayer = {
			"turn_layer",
			"turn_layer"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 },
			{ name = "chase", weight = 1 }
		}
	}
)


-- AsTurningRun

model:CreateSequence(
	{
		name = "run_haste_anim",
		sequences = {
			{ "@run_haste_anim" }
		},
		addlayer = {
			"turn_layer",
			"turn_layer"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 },
			{ name = "haste", weight = 1 }
		}
	}
)


-- AsTurningRun

model:CreateSequence(
	{
		name = "run_injured_anim",
		sequences = {
			{ "@run_injured_anim" }
		},
		addlayer = {
			"turn_layer",
			"turn_layer"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 },
			{ name = "injured", weight = 1 }
		}
	}
)

--]]