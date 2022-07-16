function interpretKB(s)
    local bytes = {}
    local cursor = 1
    for i = 1, 50000 do
        table.insert(bytes,1)
    end
    local inloop = false
    local skip = false
    local temp = 0
    local i = 0
    local l = string.sub(s,i,i)
    local debug = false

    while i < #s do
        i = i + 1
        l = string.sub(s,i,i)
        temp = 0

        if skip == false then
        if l == ">" then
            cursor = cursor + 1
        elseif l == "<" then
            cursor = cursor - 1
        elseif l == "+" then
            bytes[cursor] = bytes[cursor] + bytes[cursor + 1]
        elseif l == "-" then
            bytes[cursor] = bytes[cursor] - bytes[cursor + 1]
        elseif l == "*" then
            bytes[cursor] = bytes[cursor] * bytes[cursor + 1]
        elseif l == "/" then
            bytes[cursor] = bytes[cursor] / bytes[cursor + 1]
        elseif l == "=" then
            bytes[cursor] = bytes[cursor + 1]
        elseif l == "?" then
            temp = bytes[cursor - 1]
            bytes[cursor - 1] = bytes[cursor]
            bytes[cursor] = temp
        elseif l == "!" then
            temp = bytes[cursor + 1]
            bytes[cursor + 1] = bytes[cursor]
            bytes[cursor] = temp
        elseif l == "." then
            if skip ~= true then
                io.write(string.char(bytes[cursor]))
                if debug == true then
                    io.write(bytes[cursor])
                end
            end
        elseif l == "_" then
            bytes[cursor] = bytes[cursor] .. bytes[cursor + 1]
        elseif l == "," then
            bytes[cursor] = string.byte(io.read(1))
        elseif l == "$" then
            bytes[cursor + 1] = 1
        elseif l == "^" then
            bytes[cursor] = bytes[cursor]^bytes[cursor + 1]
        elseif l == ":" then
            bytes[cursor] = bytes[cursor]^(1/bytes[cursor + 1])
        elseif l == "[" then
            if bytes[cursor] ~= 0 then
                inloop = true
            else skip = true end
        elseif l == "]" then
            while l ~= "[" do
                l = string.sub(s,i,i)
                i = i - 1
                end
            end
        elseif l == "{" then
            if bytes[cursor] ~= 1 then
                inloop = true
            else skip = true end
        elseif l == "}" then
            while l ~= "{" do
                l = string.sub(s,i,i)
                i = i - 1
                end
            end
        end
        if l == "]" and bytes[cursor] ~= 0 then
            skip = false
        end
        if l == "}" and bytes[cursor] ~= 1 then
            skip = false
        end
    end

interpretKB("+!+++_.")
interpretKB("-[------->+<]>-.")