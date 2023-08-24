-- GNU/PONG
-- A Free and Open Source Pong Clone
-- Developed by RJ "Morkhelt" Al Sultan
-- licensed under GNU GPLv3

require("player")
require("ball")
require("opponent")
require("background")

function love.load()
 Player:load()
 Ball:load()
 Opponent:load()
 Background:load()

 Score = {Player = 0, Opponent = 0}
 font = love.graphics.newFont(30)
end


function love.update(dt)
 Player:update(dt)
 Ball:update(dt)
 Opponent:update(dt)
 Background:update(dt)
end


function love.draw()
Background:draw()
Player:draw()
Ball:draw()
Opponent:draw()
drawScore()
end

function drawScore()
    love.graphics.setFont(font)
    love.graphics.print("Player: "..Score.Player, 100, 50)
    love.graphics.print("Opponent: "..Score.Opponent, 1635, 50)
end

function checkCollision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else 
        return false
    end
end