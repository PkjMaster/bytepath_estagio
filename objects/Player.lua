Player = GameObject:extend()

function Player:new(area, x, y, opts)
    Player.super.new(self, area, x, y, opts)

    self.x, self.y = x, y
    self.w, self.h = 12, 12
    self.collider = self.area.world:newCircleCollider(self.x, self.y, self.w)
    self.collider:setObject(self)

    self.r = -math.pi/2
    self.rv = 1.66*math.pi
    self.v = 0
    self.base_max_v = 100
    self.max_v = self.base_max_v
    self.a = 100

    self.boosting = false
    self.timer:every(0.24, function() self:shoot() end)
    self.timer:every(5, function() self:tick() end)

    -- Ship visuals
    self.ship = 'Fighter' 
    self.polygons = {}
    self.timer:every(0.01, function()
        if self.ship == 'Fighter' then
            self.polygons[1] = {
                self.w, 0,
                self.w/2, -self.w/2,
                -self.w/2, -self.w/2,
                -self.w, 0,
                -self.w/2, self.w/2,
                self.w/2, self.w/2,
            }

            self.polygons[2] = {
                self.w/2, -self.w/2,
                0, -self.w,
                -self.w - self.w/2, -self.w,
                -3*self.w/4, -self.w/4,
                -self.w/2, -self.w/2,
            }

            self.polygons[3] = {
                self.w/2, self.w/2,
                -self.w/2, self.w/2,
                -3*self.w/4, self.w/4,
                -self.w - self.w/2, self.w,
                0, self.w,
            }

        elseif self.ship == 'Striker' then
            self.polygons[1] = {
                self.w, 0,
                self.w/2, -self.w/2,
                -self.w/2, -self.w/2,
                -self.w, 0,
                -self.w/2, self.w/2,
                self.w/2, self.w/2,
            }

            self.polygons[2] = {
                0, self.w/2,
                -self.w/4, self.w,
                0, self.w + self.w/2,
                self.w, self.w,
                0, 2*self.w,
                -self.w/2, self.w + self.w/2,
                -self.w, 0,
                -self.w/2, self.w/2,
            }

            self.polygons[3] = {
                0, -self.w/2,
                -self.w/4, -self.w,
                0, -self.w - self.w/2,
                self.w, -self.w,
                0, -2*self.w,
                -self.w/2, -self.w - self.w/2,
                -self.w, 0,
                -self.w/2, -self.w/2,
            }
        elseif self.ship == 'Specter' then
            self.polygons[1] = {
                self.w, 0,
                self.w/3, -self.w/2,
                0, -self.w,
                -self.w/3, -self.w/2,
                -self.w, 0,
                -self.w/2, self.w/3,
                0, self.w/2,
                self.w/2, self.w/3,
            }
            
            self.polygons[2] = {
                self.w/2, -self.w/3,
                0, -self.w/1.5,
                -self.w/2, -self.w/3,
                -self.w/1.5, 0,
                -self.w/2, self.w/3,
                0, self.w/1.5,
                self.w/2, self.w/3,
            }
            
            self.polygons[3] = {
                self.w/4, -self.w/6,
                0, -self.w/3,
                -self.w/4, -self.w/6,
                -self.w/3, 0,
                -self.w/4, self.w/6,
                0, self.w/3,
                self.w/4, self.w/6,
            }
            
        
        elseif self.ship == 'Vortex' then
            self.polygons[1] = {
                self.w, 0,
                self.w/2, -self.w/2,
                0, -self.w,
                -self.w/2, -self.w/2,
                -self.w, 0,
                -self.w/2, self.w/2,
                0, self.w,
                self.w/2, self.w/2,
            }
            
            self.polygons[2] = {
                self.w/3, -self.w/3,
                0, -self.w/1.5,
                -self.w/3, -self.w/3,
                -self.w/1.5, 0,
                -self.w/3, self.w/3,
                0, self.w/1.5,
                self.w/3, self.w/3,
            }
            
            self.polygons[3] = {
                self.w/4, -self.w/6,
                0, -self.w/3,
                -self.w/4, -self.w/6,
                -self.w/3, 0,
                -self.w/4, self.w/6,
                0, self.w/3,
                self.w/4, self.w/6,
            }
            
        
        elseif self.ship == 'Shadow' then
            self.polygons[1] = {
                0, -self.w,
                -self.w/2, -self.w/3,
                -self.w, 0,
                -self.w/2, self.w/3,
                0, self.w,
                self.w/2, self.w/3,
                self.w, 0,
                self.w/2, -self.w/3,
            }
            
            self.polygons[2] = {
                0, -self.w/2,
                -self.w/3, -self.w/4,
                -self.w/2, 0,
                -self.w/3, self.w/4,
                0, self.w/2,
                self.w/3, self.w/4,
                self.w/2, 0,
                self.w/3, -self.w/4,
            }
            
            self.polygons[3] = {
                0, -self.w/1.5,
                -self.w/4, -self.w/6,
                -self.w/1.5, 0,
                -self.w/4, self.w/6,
                0, self.w/1.5,
                self.w/4, self.w/6,
                self.w/1.5, 0,
                self.w/4, -self.w/6,
            }
            
        
        elseif self.ship == 'Falcon' then
            self.polygons[1] = {
                self.w, 0,
                self.w/2, -self.w/4,
                -self.w/2, -self.w/4,
                -self.w, 0,
                -self.w/2, self.w/4,
                self.w/2, self.w/4,
            }
        
        elseif self.ship == 'Reaper' then
            self.polygons[1] = {
                0, -self.w,       
                -self.w/2, -self.w/2,  
                -self.w, -self.w/4,
                -self.w, self.w/4,
                -self.w/2, self.w/2,  
                0, self.w,      
                self.w/2, self.w/2,   
                self.w, self.w/4,     
                self.w, -self.w/4,     
                self.w/2, -self.w/2,   
            }
            
            self.polygons[2] = {
                0, -self.w/2,
                -self.w/3, -self.w/4, 
                -self.w/2, 0,    
                -self.w/3, self.w/4, 
                0, self.w/2,     
                self.w/3, self.w/4,   
                self.w/2, 0,       
                self.w/3, -self.w/4,  
            }
            
        
        elseif self.ship == 'Phantom' then
            self.polygons[1] = {
                self.w, 0,
                self.w/2, -self.w/4,
                0, -self.w/2,
                -self.w/2, -self.w/4,
                -self.w, 0,
                -self.w/2, self.w/4,
                0, self.w/2,
                self.w/2, self.w/4,
            }
            
            self.polygons[2] = {
                self.w/2, -self.w/4,
                0, -self.w/2,
                -self.w/2, -self.w/4,
                -self.w, 0,
                -self.w/2, self.w/4,
                0, self.w/2,
                self.w/2, self.w/4,
            }
            
            self.polygons[3] = {
                self.w/4, -self.w/8,
                0, -self.w/4,
                -self.w/4, -self.w/8,
                -self.w/2, 0,
                -self.w/4, self.w/8,
                0, self.w/4,
                self.w/4, self.w/8,
            }
            
        end
    end)

    -- Boost Trail
    self.trail_color = skill_point_color 
    self.timer:every(0.01, function()
        if self.ship == 'Fighter' then
            self.area:addGameObject('TrailParticle', 
            self.x - 0.9*self.w*math.cos(self.r) + 0.2*self.w*math.cos(self.r - math.pi/2), 
            self.y - 0.9*self.w*math.sin(self.r) + 0.2*self.w*math.sin(self.r - math.pi/2), 
            {parent = self, r = random(2, 4), d = random(0.15, 0.25), color = self.trail_color}) 
            self.area:addGameObject('TrailParticle', 
            self.x - 0.9*self.w*math.cos(self.r) + 0.2*self.w*math.cos(self.r + math.pi/2), 
            self.y - 0.9*self.w*math.sin(self.r) + 0.2*self.w*math.sin(self.r + math.pi/2), 
            {parent = self, r = random(2, 4), d = random(0.15, 0.25), color = self.trail_color}) 

        elseif self.ship == 'Striker' then
            self.area:addGameObject('TrailParticle', 
            self.x - 1.0*self.w*math.cos(self.r) + 0.2*self.w*math.cos(self.r - math.pi/2), 
            self.y - 1.0*self.w*math.sin(self.r) + 0.2*self.w*math.sin(self.r - math.pi/2), 
            {parent = self, r = random(2, 4), d = random(0.15, 0.25), color = self.trail_color}) 
            self.area:addGameObject('TrailParticle', 
            self.x - 1.0*self.w*math.cos(self.r) + 0.2*self.w*math.cos(self.r + math.pi/2), 
            self.y - 1.0*self.w*math.sin(self.r) + 0.2*self.w*math.sin(self.r + math.pi/2), 
            {parent = self, r = random(2, 4), d = random(0.15, 0.25), color = self.trail_color}) 
        elseif self.ship == 'Specter' then
            self.area:addGameObject('TrailParticle', 
            self.x - 0.8*self.w*math.cos(self.r), 
            self.y - 0.8*self.w*math.sin(self.r), 
            {parent = self, r = random(1, 2), d = random(0.12, 0.18), color = self.trail_color}) 

            self.area:addGameObject('TrailParticle', 
            self.x - 0.7*self.w*math.cos(self.r - math.pi/8), 
            self.y - 0.7*self.w*math.sin(self.r - math.pi/8), 
            {parent = self, r = random(1, 2), d = random(0.12, 0.18), color = self.trail_color})

            self.area:addGameObject('TrailParticle', 
            self.x - 0.7*self.w*math.cos(self.r + math.pi/8), 
            self.y - 0.7*self.w*math.sin(self.r + math.pi/8), 
            {parent = self, r = random(1, 2), d = random(0.12, 0.18), color = self.trail_color})
    
        elseif self.ship == 'Vortex' then
            self.area:addGameObject('TrailParticle', 
            self.x - 0.9*self.w*math.cos(self.r) + 0.3*self.w*math.cos(self.r - math.pi/4), 
            self.y - 0.9*self.w*math.sin(self.r) + 0.3*self.w*math.sin(self.r - math.pi/4), 
            {parent = self, r = random(2, 3), d = random(0.12, 0.18), color = self.trail_color}) 

            self.area:addGameObject('TrailParticle', 
            self.x - 0.9*self.w*math.cos(self.r) + 0.3*self.w*math.cos(self.r + math.pi/4), 
            self.y - 0.9*self.w*math.sin(self.r) + 0.3*self.w*math.sin(self.r + math.pi/4), 
            {parent = self, r = random(2, 3), d = random(0.12, 0.18), color = self.trail_color})

        elseif self.ship == 'Shadow' then
            self.area:addGameObject('TrailParticle', 
            self.x - 0.8*self.w*math.cos(self.r) + 0.1*self.w*math.cos(self.r - math.pi/3), 
            self.y - 0.8*self.w*math.sin(self.r) + 0.1*self.w*math.sin(self.r - math.pi/3), 
            {parent = self, r = random(1, 2), d = random(0.1, 0.15), color = self.trail_color}) 

            self.area:addGameObject('TrailParticle', 
            self.x - 0.8*self.w*math.cos(self.r) + 0.1*self.w*math.cos(self.r + math.pi/3), 
            self.y - 0.8*self.w*math.sin(self.r) + 0.1*self.w*math.sin(self.r + math.pi/3), 
            {parent = self, r = random(1, 2), d = random(0.1, 0.15), color = self.trail_color})

            self.area:addGameObject('TrailParticle', 
            self.x - 0.7*self.w*math.cos(self.r) + 0.1*self.w*math.cos(self.r - math.pi/6), 
            self.y - 0.7*self.w*math.sin(self.r) + 0.1*self.w*math.sin(self.r - math.pi/6), 
            {parent = self, r = random(1, 2), d = random(0.1, 0.15), color = self.trail_color})
        elseif self.ship == 'Falcon' then
            self.area:addGameObject('TrailParticle', 
            self.x - 0.85*self.w*math.cos(self.r - math.pi/6), 
            self.y - 0.85*self.w*math.sin(self.r - math.pi/6), 
            {parent = self, r = random(2, 4), d = random(0.1, 0.15), color = self.trail_color})
            self.area:addGameObject('TrailParticle', 
            self.x - 0.85*self.w*math.cos(self.r + math.pi/6), 
            self.y - 0.85*self.w*math.sin(self.r + math.pi/6), 
            {parent = self, r = random(2, 4), d = random(0.1, 0.15), color = self.trail_color})
    
        elseif self.ship == 'Reaper' then
            self.area:addGameObject('TrailParticle', 
            self.x - 0.8*self.w*math.cos(self.r) + 0.2*self.w*math.cos(self.r - math.pi/4), 
            self.y - 0.8*self.w*math.sin(self.r) + 0.2*self.w*math.sin(self.r - math.pi/4), 
            {parent = self, r = random(3, 5), d = random(0.2, 0.3), color = self.trail_color}) 

            self.area:addGameObject('TrailParticle', 
            self.x - 0.8*self.w*math.cos(self.r) + 0.2*self.w*math.cos(self.r + math.pi/4), 
            self.y - 0.8*self.w*math.sin(self.r) + 0.2*self.w*math.sin(self.r + math.pi/4), 
            {parent = self, r = random(3, 5), d = random(0.2, 0.3), color = self.trail_color})

            self.area:addGameObject('TrailParticle', 
            self.x - 0.7*self.w*math.cos(self.r) + 0.1*self.w*math.cos(self.r - math.pi/6), 
            self.y - 0.7*self.w*math.sin(self.r) + 0.1*self.w*math.sin(self.r - math.pi/6), 
            {parent = self, r = random(3, 5), d = random(0.2, 0.3), color = self.trail_color})
    
        elseif self.ship == 'Phantom' then
            self.area:addGameObject('TrailParticle', 
            self.x - 0.6*self.w*math.cos(self.r), 
            self.y - 0.6*self.w*math.sin(self.r), 
            {parent = self, r = random(1, 2), d = random(0.1, 0.15), color = self.trail_color}) 

            self.area:addGameObject('TrailParticle', 
            self.x - 0.7*self.w*math.cos(self.r - math.pi/6), 
            self.y - 0.7*self.w*math.sin(self.r - math.pi/6), 
            {parent = self, r = random(1, 2), d = random(0.1, 0.15), color = self.trail_color})

            self.area:addGameObject('TrailParticle', 
            self.x - 0.7*self.w*math.cos(self.r + math.pi/6), 
            self.y - 0.7*self.w*math.sin(self.r + math.pi/6), 
            {parent = self, r = random(1, 2), d = random(0.1, 0.15), color = self.trail_color})
        end
    end)
end

function Player:update(dt)
    Player.super.update(self, dt)

    -- Change ship
    if input:pressed('1') then 
        self.ship = 'Fighter' 
    end
    if input:pressed('2') then 
        self.ship = 'Striker'
    end
    if input:pressed('3') then 
        self.ship = 'Specter'
    end
    if input:pressed('4') then 
        self.ship = 'Vortex'
    end
    if input:pressed('5') then 
        self.ship = 'Shadow'
    end
    if input:pressed('6') then 
        self.ship =  'Falcon'
    end
    if input:pressed('7') then 
        self.ship = 'Reaper'
    end
    if input:pressed('8') then 
        self.ship = 'Phantom'
    end


    -- Collision
    if self.x < 0 then self:die() end
    if self.y < 0 then self:die() end
    if self.x > gw then self:die() end
    if self.y > gh then self:die() end

    -- Boost
    self.max_v = self.base_max_v
    self.boosting = false
    if input:down('up') then 
        self.boosting = true
        self.max_v = 1.5*self.base_max_v 
    end
    if input:down('down') then 
        self.boosting = true
        self.max_v = 0.5*self.base_max_v 
    end
    self.trail_color = skill_point_color 
    if self.boosting then self.trail_color = boost_color end

    -- Movement
    if input:down('left') then self.r = self.r - self.rv*dt end
    if input:down('right') then self.r = self.r + self.rv*dt end
    self.v = math.min(self.v + self.a*dt, self.max_v)
    self.collider:setLinearVelocity(self.v*math.cos(self.r), self.v*math.sin(self.r))
end

function Player:draw()
    pushRotate(self.x, self.y, self.r)
    love.graphics.setColor(default_color)
    for _, vertice_group in ipairs(self.polygons) do
        local points = fn.map(vertice_group, function(k, v) if k % 2 == 1 then return self.x + v + random(-1, 1) else return self.y + v + random(-1, 1) end end)
        love.graphics.polygon('line', points)
    end
    love.graphics.pop()
end

function Player:destroy()
    Player.super.destroy(self)
end

function Player:tick()
    self.area:addGameObject('TickEffect', self.x, self.y, {parent = self})
end

function Player:shoot()
    local d = 1.2*self.w
    self.area:addGameObject('ShootEffect', self.x + d*math.cos(self.r), self.y + d*math.sin(self.r), {player = self, d = d})
    self.area:addGameObject('Projectile', self.x + 1.5*d*math.cos(self.r), self.y + 1.5*d*math.sin(self.r), {r = self.r})
end

function Player:die()
    self.dead = true 
    flash(12)
    camera:shake(6, 60, 0.4)
    slow(0.15, 1)
    for i = 1, love.math.random(8, 12) do self.area:addGameObject('ExplodeParticle', self.x, self.y) end
end
