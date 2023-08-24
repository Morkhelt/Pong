local Sound = {active = {}, source ={}}

function Sound:init(id, source, soundType)
    assert(self.source[id] == nil, "Sound with that ID already exists or has been tampered with!")
    self.source [id] = love.audio.newSource(source, soundType)
end

function Sound:play(id, channel)
    local channel = channel or "default"
    local clone = Sound.source[id]:clone()
    clone:play()

    if Sound.active[channel] == nil then
        Sound.active[channel] = {}
    end

    table.insert (Sound.active[channel], clone)
end

return Sound