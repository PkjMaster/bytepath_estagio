Stage = Object:extend()

function Stage:new()
    self.area = Area() -- insere uma area dentro do objeto
    self.timer = Timer()
    self.timer:every(2, function()     
        self.area:addGameObject('Circle', random(0, 800), random(0, 600))
    end) -- a cada 2 segundos cria um circulo em uma posição aleatória

end

function Stage:update(dt)
    self.area:update(dt)
    self.timer:update(dt)
end

function Stage:draw()
    self.area:draw()
end