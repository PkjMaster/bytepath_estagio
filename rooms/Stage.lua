Stage = Object:extend()

function Stage:new()
    self.area = Area() -- insere uma area dentro do objeto
    self.timer = Timer()
    
    local function process()
        self.timer:every(0.25, function()
            self.area:addGameObject('Circle', random(0, 800), random(0, 600)) 
        end, 10)
        self.timer:after(2.5, function()
            self.timer:every('every',random(0.5, 1), function()
                self.area.game_objects[love.math.random(1, #self.area.game_objects)].dead = true
                if #self.area.game_objects == 1 then 
                    process() 
                    self.timer:cancel('every') 
                end
            end)            
        end)
    end
    process()
    
end

function Stage:update(dt)
    self.area:update(dt)
    self.timer:update(dt)
end

function Stage:draw()
    self.area:draw()
end