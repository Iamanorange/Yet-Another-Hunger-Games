local function OnTaskTick(inst, self, period)
    self:DoDec(period)
end

local Distpenalty = Class(function(self, inst)
    self.inst = inst

    self.mp = c_find("multiplayer_portal")
    self.maxdist = TheWorld.Map:GetSize() * 4
    self.mindist = 2
    self.maxdays = _G.YAHG.DISTPENALTY_MAXDAYS
    self.mindays = _G.YAHG.DISTPENALTY_MINDAYS
    self.penaltymultiplier = _G.YAHG.DISTPENALTY_MULTIPLIER

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
    self:DoDec(dt)
end

function Distpenalty:DoDec(dt)
    if (self.inst.player_classified ~= nil and self.inst.player_classified.isghostmode:value()) or 
       (self.inst.player_classified == nil and self.inst:HasTag("playerghost")) then
        return
    end
    local penaltydist = self:GetPenaltydist()
    local dist = math.sqrt(self.inst:GetDistanceSqToInst(self.mp))
    if dist > penaltydist then
        if dist > 35 then
            self.inst.components.talker:Say("Too far from Portal!")
        end
        self.inst.components.health:DoDelta(-dt * (TheWorld.state.cycles + TheWorld.state.time)/self.maxdays * self.penaltymultiplier, true, "distpenalty")
    end
end

return Distpenalty
