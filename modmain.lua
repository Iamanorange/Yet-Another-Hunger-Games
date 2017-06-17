local _G = GLOBAL

local TheNet = _G.TheNet
local STRINGS = _G.STRINGS
local AllPlayers = _G.AllPlayers

_G.YAHG = {
    DISTPENALTY_MAXDAYS = GetModConfigData("maxdays"),
    DISTPENALTY_MINDAYS = 0,
    DISTPENALTY_MULTIPLIER = GetModConfigData("penaltymultiplier"),
    DISTPENALTY_REBALANCE = GetModConfigData("rebalance"),
}

if _G.YAHG.DISTPENALTY_REBALANCE then
    -- Global
    TUNING.PVP_DAMAGE_MOD = 1

    -- Wilson
    
    -- Willow
    TUNING.WILLOW_FIRE_DAMAGE = 0

    -- Wolfgang
    TUNING.WOLFGANG_ATTACKMULT_MIGHTY_MAX = 1.5
    TUNING.WOLFGANG_ATTACKMULT_MIGHTY_MIN = 1
    TUNING.WOLFGANG_ATTACKMULT_NORMAL = 1
    TUNING.WOLFGANG_ATTACKMULT_WIMPY_MAX = 1
    TUNING.WOLFGANG_ATTACKMULT_WIMPY_MIN = 0

    -- Wendy

    -- WX78

    -- Wickerbottom

    -- Woodie
    TUNING.BEAVER_DAMAGE = 51
    TUNING.BEAVER_SANITY_PENALTY = 0

    -- Wes

    -- Waxwell

    -- Wigfrid
    TUNING.WATHGRITHR_DAMAGE_MULT = 1.01
    TUNING.WATHGRITHR_ABSORPTION = 0.01

    -- Webber

end

STRINGS.NAMES.DISTPENALTY = "Escape Penalty"

local function Broadcast()
    if #AllPlayers == 0 then
        return 
    end
	local broadcast = string.format("Safe distance: %d", GLOBAL.AllPlayers[1].components.distpenalty:GetPenaltydist())
	TheNet:Announce(broadcast)
end

AddComponentPostInit("playerspawner", function(OnAnnounce, inst)
	if _G.TheWorld.ismastershard then
		_G.scheduler:ExecutePeriodic(10, Broadcast)
	end
end)
