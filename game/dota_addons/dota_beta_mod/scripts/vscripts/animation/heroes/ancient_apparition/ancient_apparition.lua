--============ Copyright (c) Valve Corporation, All rights reserved. ==========
--
-- source1import auto-generated animation script
-- local changes will be overwritten if source1import if run again on this asset
--
-- mdl: models\heroes\ancient_apparition\ancient_apparition.mdl
--
-- Edited by Wyrm, for custom made gamemode Dota 2 Old Beta
--
--=============================================================================


-- AsLookLayer
model:CreateSequence(
	{
		name = "@aa_turns_lookFrame_0",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@aa_turns", frame = 0, dst = 0 },
			{ cmd = "fetchframe", sequence = "@aa_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@aa_turns_lookFrame_1",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@aa_turns", frame = 1, dst = 0 },
			{ cmd = "fetchframe", sequence = "@aa_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@aa_turns_lookFrame_2",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@aa_turns", frame = 2, dst = 0 },
			{ cmd = "fetchframe", sequence = "@aa_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "aa_turns",
		delta = true,
		poseParamX = model:CreatePoseParameter( "turn", -1, 1, 0, false ),
		sequences = {
			{ "@aa_turns_lookFrame_0", "@aa_turns_lookFrame_1", "@aa_turns_lookFrame_2" }
		}
	}
)

-- AsTurningRun

model:CreateSequence(
	{
		name = "ancient_run",
		sequences = {
			{ "@ancient_run" }
		},
		addlayer = {
			"aa_turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 }
		}
	}
)


-- AsTurningRun

model:CreateSequence(
	{
		name = "ancient_run_haste",
		sequences = {
			{ "@ancient_run_haste" }
		},
		addlayer = {
			"aa_turns"
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
		name = "ancient_run_injured",
		sequences = {
			{ "@ancient_run_injured" }
		},
		addlayer = {
			"aa_turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 },
			{ name = "injured", weight = 1 }
		}
	}
)

-- AsLookLayerDupe1
model:CreateSequence(
	{
		name = "@aa_turns_dupe1_lookFrame_0",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@aa_turns_dupe1", frame = 0, dst = 0 },
			{ cmd = "fetchframe", sequence = "@aa_turns_dupe1", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@aa_turns_dupe1_lookFrame_1",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@aa_turns_dupe1", frame = 1, dst = 0 },
			{ cmd = "fetchframe", sequence = "@aa_turns_dupe1", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@aa_turns_dupe1_lookFrame_2",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@aa_turns_dupe1", frame = 2, dst = 0 },
			{ cmd = "fetchframe", sequence = "@aa_turns_dupe1", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "aa_turns_dupe1",
		delta = true,
		poseParamX = model:CreatePoseParameter( "turn", -1, 1, 0, false ),
		sequences = {
			{ "@aa_turns_dupe1_lookFrame_0", "@aa_turns_dupe1_lookFrame_1", "@aa_turns_dupe1_lookFrame_2" }
		}
	}
)

-- AsLookLayerDupe2
model:CreateSequence(
	{
		name = "@aa_turns_dupe2_lookFrame_0",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@aa_turns_dupe2", frame = 0, dst = 0 },
			{ cmd = "fetchframe", sequence = "@aa_turns_dupe2", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@aa_turns_dupe2_lookFrame_1",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@aa_turns_dupe2", frame = 1, dst = 0 },
			{ cmd = "fetchframe", sequence = "@aa_turns_dupe2", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@aa_turns_dupe2_lookFrame_2",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@aa_turns_dupe2", frame = 2, dst = 0 },
			{ cmd = "fetchframe", sequence = "@aa_turns_dupe2", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "aa_turns_dupe2",
		delta = true,
		poseParamX = model:CreatePoseParameter( "turn", -1, 1, 0, false ),
		sequences = {
			{ "@aa_turns_dupe2_lookFrame_0", "@aa_turns_dupe2_lookFrame_1", "@aa_turns_dupe2_lookFrame_2" }
		}
	}
)