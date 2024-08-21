function UUID()
    local fn = function(x)
        local r = love.math.random(16) - 1
        r = (x == "x") and (r + 1) or (r % 4) + 9
        return ("0123456789abcdef"):sub(r, r)
    end
    return (("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"):gsub("[xy]", fn))
end

function random(min, max)
    if max then 
        if min > max then min, max = max, min end
        return love.math.random() * (max - min) + min
    else
        return love.math.random() * min
    end
end

function printAll(...)
    args = {...}
    for _, k in ipairs(args) do
        print(args[k])
    end
end

function printText(...)
    args = {...}
    print(M.reduce(args, function(a, b) return a .. b end))
end

function closestInt(n) 
    local remainder = n % 1
    local c -- closest

    if remainder >= (0.5) then
        c = (n + (1 - remainder))
    else
        c = (n - remainder)
    end

    print(c)
end

function distance(x1, y1, x2, y2)
    return math.sqrt((x1 - x2)^2 + (y1 - y2)^2)
end