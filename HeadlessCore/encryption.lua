function isWhole(n)
    return math.floor(n) == n
end

function getFactors(n)
    local factors = {}
    local otherFactors = {}
    for i = 1, math.sqrt(n) do
        if isWhole(n / i) then
            table.insert(factors, i)
            if math.pow(i, 2) ~= n then
                table.insert(factors, n / i)
            end
        end
    end
    for v in ipairs(otherFactors) do
        table.insert(factors, #factors + 1, v)
    end
    return factors
end

function gcf(a, b)
    local aFactors = getFactors(a)
    local bFactors = getFactors(b)
    for i = #aFactors, 1, -1 do
        for v in ipairs(bFactors) do
            if aFactors[i] == v then
                return v
            end
        end
    end
end

function isCoprime(a, b)
    return gcf(a, b) == 1
end

function totient(n)
    local coprimes = 0
    for i = 1, n - 1 do
        if isCoprime(n, i) then
            coprimes = coprimes + 1
        end
    end
    return coprimes
end

function isPrime(n, exact)
    if exact then
        for i = 1, math.sqrt(n) do
            if (n / i) == math.floor(n / i) then
                return false
            end
        end
    else
        if (n > 2) and isWhole(n/2) then
            return false
        end
        local c = 
        elseif not (n == 2 or n == 3 or () or ())

function getPrime(exact)
    local prime = nil
    while true do
        math.randomseed(os.time())
        local numb = math.random(math.pow(10, 15), math.pow(10, 20))
        if isPrime(numb, exact) then
            prime = numb
            break
        end
    end
    return prime
end

local p = 0
local q = 0
