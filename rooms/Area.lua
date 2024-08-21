Area = Object:extend()

function Area:new(room)
    self.room = room
    self.game_objects = {}
end

function Area:update(dt)
    for i = #self.game_objects, 1, -1 do
        local game_object = self.game_objects[i]
        game_object:update(dt)
        if game_object.dead then table.remove(self.game_objects, i) end
    end
end

function Area:draw()
    for _, game_object in ipairs(self.game_objects) do game_object:draw() end
end

function Area:addGameObject(game_object_type, x, y, opts)
    local opts = opts or {}
    local game_object = _G[game_object_type](self, x or 0, y or 0, opts)
    game_object.class = game_object_type
    table.insert(self.game_objects, game_object)
    return game_object
end

function Area:getGameObjects(f)
    return M.select(self.game_objects, f)
end

function Area:queryCircleArea(x, y, radius, object_types)
    out = {}
    for game_object in ipairs(object_types) do
        if M.include(object_types, game_object.class) then
            local d = distance(x, y, game_object.x, game_object.y)
            if d <= radius then
                out.insert(out, game_object)
            end
        end
    end
end

function Area:getClosestObject(x, y, radius, object_types)
    local objects = self:queryCircleArea(x, y, radius, object_types)
    table.sort(objects, function(a, b)
        local da = distance(x, y, a.x, a.y)
        local db = distance(x, y, b.x, b.y)
        return da < db
    end)
    return objects[1]
end

    
    