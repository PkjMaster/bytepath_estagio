
function love.load()
    local object_files = {}
    recursiveEnumerate('objects', object_files)
    requireFiles(object_files)
end

function requireFiles(files)
    for _, file in ipairs(files) do
        local file = file:sub(1, -5)
        require(file)
    end
end

function love.update(dt)

end

function love.draw()
    love.graphics.draw(image,love.math.random(0,600),love.math.random(0,600))
end
