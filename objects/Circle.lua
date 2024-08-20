Circle = GameObject:extend()

function Circle:new(area, x, y, opts)
    Circle.super:new(area , x, y, opts)
    self.radius = random(10,400)
    -- exclusão depois de 2 ou 4 segundos da criação do circulo
end

function Circle:update(dt)
    Circle.super:update(dt)
end

function Circle:draw()
    love.graphics.circle('line', self.x, self.y, self.radius)
end