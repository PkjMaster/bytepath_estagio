Rectangle = GameObject:extend()

function Rectangle:new(area, x, y, opts)
    Rectangle.super:new(area , x, y, opts)
    self.w = random(800)
    self.h = random(600)
end

function Rectangle:update(dt)
    Rectangle.super:update(dt)
end

function Rectangle:draw()
    love.graphics.rectangle('fill', self.x - self.w/2, self.y- self.h/2, self.w, self.h)
end