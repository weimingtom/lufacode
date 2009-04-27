function double(a)
    return a*2
end

function triple(a)
    return a*3
end

function sextuple(a)
    return double(triple(a))
end

function z(a, b, c)
    return double(a), triple(b), sextuple(c)
end

local a, b, c = z(1,2,3)