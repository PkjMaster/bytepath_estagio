PolygonRoom = Object:extend()

function PolygonRoom:new()
    self.vertices = {300,250, 500,250, 400,400}
    
end

function PolygonRoom:update(dt)

end

function PolygonRoom:draw()
    love.graphics.polygon('fill', self.vertices)
end
