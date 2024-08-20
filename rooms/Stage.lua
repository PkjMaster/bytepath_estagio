Stage = Object:extend()

function Stage:new()
    self.area = Area() -- insere uma area dentro do objeto
    self.timer = Timer()

    for i=1,10,1 do
        self.timer:after(i*0.25, function() 
            self.area:addGameObject('Circle', random(0, 800), random(0, 600)) 
        end)
    end

    
end

function Stage:update(dt)
    self.area:update(dt)
    self.timer:update(dt)
end

function Stage:draw()
    self.area:draw()
end