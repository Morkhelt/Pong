Ball = {}

-- The basic functionality of the ball
-- When drawn, the ball sprite automatically begins in the center

function Ball:load()
    self.img = love.graphics.newImage("assets/sprites/ball.png")
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 200
    self.xVel = -self.speed
    self.yVel = 0
end

-- realtime function updater for the ball

function Ball:update(dt)
    self:move(dt)
    self:collide()
end

-- This is the ball's collision
-- without it, the ball is a ghost

function Ball:collide()
    self:collidePlayer()
    self:collideOpponent()
    self:collideWall()
    self:score()
end

function Ball:collidePlayer()
    if checkCollision(self, Player) then
        self.xVel = self.speed
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisionPosition = middleBall - middlePlayer
        self.yVel = collisionPosition * 5
    end
end

function Ball:collideOpponent()
    if checkCollision(self, Opponent) then
        self.xVel = -self.speed
        local middleBall = self.y + self.height / 2
        local middleOpponent = Opponent.y + Opponent.height / 2
        local collisionPosition = middleBall - middleOpponent
        self.yVel = collisionPosition * 5
    end  
end

function Ball:score()  
    if self.x < 0 then
       self:resetPosition(1)
       Score.Opponent = Score.Opponent + 1
    end

    if self.x + self.width > love.graphics.getWidth() then
        self:resetPosition(-1)
        Score.Player = Score.Player + 1
    end
end

function Ball:resetPosition(modifier)
    self.x = love.graphics.getWidth() / 2 - self.width / 2
    self.y = love.graphics.getHeight() / 2 - self.height / 2
    self.yVel = 0
    self.xVel = self.speed * modifier
end

function Ball:collideWall()
    if self.y < 0 then
        self.y = 0
        self.yVel = -self.yVel
    elseif self.y +self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel
    end
end

-- this updates the sprites for the ball

function Ball:move(dt)
self.x = self.x + self.xVel * dt
self.y = self.y + self.yVel * dt
end

-- drawing the sprite for the ball
-- otherwise how can you see what's coming at you?

function Ball:draw()
love.graphics.draw(self.img, self.x, self.y)
end