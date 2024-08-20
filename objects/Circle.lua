require 'objects/GameObject'
Circle = GameObject:extend()

function Circle:new(area, x, y, opts)
    Circle.super:new(area , x, y, opts)
    self.radius = 50 -- raio do circulo
    self.timer:after(random(2, 4), function() self.dead = true end)
    -- exclusão depois de 2 ou 4 segundos da criação do circulo
end

function Circle:update(dt)
    Circle.super:update(dt)
end

function Circle:draw()
    love.graphics.circle('fill', self.x, self.y, self.radius)
end