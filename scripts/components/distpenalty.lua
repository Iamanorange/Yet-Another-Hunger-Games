local function OnTaskTick(inst, self, period)
    self:DoDec(period)
end

local Distpenalty = Class(function(self, inst)
    self.inst = inst

    self.day = TheWorld.state.cycles
    self.mp = c_find("multiplayer_portal")
    self.maxdist = TheWorld.Map:GetSize() * 4
    self.mindist = 0
    self.maxdays = TUNING.DISTPENALTY_MAXTIME
    self.mindays = 0

    local period = 10
    self.inst:DoPeriodicTask(period, OnTaskTick, nil, self, period)
end,
nil,
{
})

function Distpenalty:GetMaxDays()
    return self.maxdays
end

function Distpenalty:GetPenaltydist()
    local day = TheWorld.state.cycles
    if day <= self.mindays then
        day = 0
    end
    local penaltydist = Lerp(self.maxdist, self.mindist, day/self.maxdays)
    return penaltydist
end

function Distpenalty:LongUpdate(dt)
    self:DoDec(dt, true)
end

function Distpenalty:DoDec(dt)
    local day = TheWorld.state.cycles
    if day <= self.mindays then
        day = 0
    end
    local penaltydist = Lerp(self.maxdist, self.mindist, day/self.maxdays)
    if not self.inst:IsNear(self.mp, penaltydist) then
        self.inst.components.talker:Say("Too far from Portal!")
        self.inst.components.health:DoDelta(-dt, true, "distpenalty")
    end
end

return Distpenalty
