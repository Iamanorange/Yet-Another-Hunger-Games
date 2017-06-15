local function OnTaskTick(inst, self, period)
    self:DoDec(period)
end

local Distpenalty = Class(function(self, inst)
    self.inst = inst

    self.mp = c_find("multiplayer_portal")
    self.maxdist = TheWorld.Map:GetSize() * 4
    self.mindist = 2
    self.maxdays = TUNING.DISTPENALTY_MAXDAYS
    self.mindays = TUNING.DISTPENALTY_MINDAYS
    self.penaltymultiplier = TUNING.DISTPENALTY_MULTIPLIER

    local period = 2
    self.inst:DoPeriodicTask(period, OnTaskTick, nil, self, period)
end,
nil,
{
})

function Distpenalty:GetMaxDays()
    return self.maxdays
end

function Distpenalty:GetPenaltydist()
    local day = TheWorld.state.cycles + TheWorld.state.time
    if day <= self.mindays then
        day = 0
    end
    return Lerp(self.maxdist, self.mindist, math.min(day/self.maxdays, 1))
end

function Distpenalty:LongUpdate(dt)
    self:DoDec(dt, true)
end

function Distpenalty:DoDec(dt)
    if (self.inst.player_classified ~= nil and self.inst.player_classified.isghostmode:value()) or 
        (self.inst.player_classified == nil and self.inst:HasTag("playerghost")) then
        return
    end
    local penaltydist = self:GetPenaltydist()
    local dist = math.sqrt(self.inst:GetDistanceSqToInst(self.mp))
    if dist > penaltydist then
        self.inst.components.talker:Say("Too far from Portal!")
        self.inst.components.health:DoDelta(-dt * (dist/self.maxdist) * math.max((TheWorld.state.cycles + TheWorld.state.time)/self.maxdays, 1) * self.penaltymultiplier, true, "distpenalty")
    end
end

return Distpenalty
