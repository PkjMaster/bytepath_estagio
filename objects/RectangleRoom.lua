RectangleRoom = Object:extend()

function RectangleRoom:new()
    self.x = 400
    self.y = 300
    self.w = 200
    self.h = 300
end

function RectangleRoom:update(dt)

end

function RectangleRoom:draw()
    love.graphics.rectangle('fill', self.x - self.w/2, self.y - self.h/2, self.w, self.h)
end
