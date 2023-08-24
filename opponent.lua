Opponent = {}

-- The AI's "Spawnpoint" so to speak

function Opponent:load()
    self.img = love.graphics.newImage("assets/sprites/2.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.x = love.graphics.getWidth() - self.width - 50
    self.y =love.graphics.getHeight() / 2
    self.yVel = 0
    self.speed = 500
    
    self.timer = 0
    self.rate = 0.5
end

-- realtime update function
-- this is so the other functions can actually...function

function Opponent:update(dt)
    self:move(dt)
    self:checkBoundaries()
    self.timer = self.timer + dt
    if self.timer > self.rate then
        self.timer = 0
        self:acquireTarget()
    end
end

-- this updates the paddle sprite's movement

function Opponent:move(dt)
    self.y = self.y + self.yVel * dt
end

-- This code prevents the AI paddle from going off screen

function Opponent:checkBoundaries()
    if self. y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

-- this is the AI's brain, this is how it tracks the ball and collides with it

function Opponent:acquireTarget()
    if Ball.y + Ball.height < self.y then
        self.yVel = -self.speed
    elseif Ball.y > self.y + self.height then
        self.yVel = self.speed
    else
        self.yVel = 0
    end
end

-- simple sprite drawer. Do I seriously have to keep explaining this?

function Opponent:draw()
    love.graphics.draw(self.img, self.x, self.y)
end