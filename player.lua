Player = {}

-- Drawing the shape of the rectangle and aligning it in the center
-- we don't want the paddle to start at the top or the bottom now do we?

function Player:load()
    self.x = 50
    self.y = love.graphics.getHeight()/2
    self.img = love.graphics.newImage("assets/sprites/1.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 500
end

-- realtime function updater for the player

function Player:update(dt)
    self:move(dt)
    self:checkBoundaries()
end

-- this one's pretty self-explanatory.
-- this code makes the paddle go up and down

function Player:move(dt)
    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
end

-- creating a boundary so the paddle doesn't 
-- infinitely travel across the void into darkness

function Player:checkBoundaries()
    if self. y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

-- this just draws the paddle sprite. That's all

function Player:draw()
    love.graphics.draw(self.img, self.x, self.y)
end