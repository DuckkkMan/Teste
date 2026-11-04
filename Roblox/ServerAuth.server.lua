--[[
    Teste - GitHub Token Auth (prototype)
    Place this Script in ServerScriptService.
    Enable Game Settings > Security > Allow HTTP Requests.

    IMPORTANT:
    This is only a demonstration. The GitHub repository is public,
    so anyone can read tokens.json and copy its test token.
    Do not use this as real security or for valuable game permissions.
]]

local HttpService = game:GetService("HttpService")

local URL = "https://raw.githubusercontent.com/DuckkkMan/Teste/main/tokens.json"
local SToken = "TESTE-1234"

local function validateToken()
    local success, result = pcall(function()
        local response = HttpService:GetAsync(URL)
        local data = HttpService:JSONDecode(response)

        if type(data) ~= "table" or type(data.tokens) ~= "table" then
            error("Invalid token list format")
        end

        return table.find(data.tokens, SToken) ~= nil
    end)

    if not success then
        warn("[AuthSystem] Could not contact/read GitHub: " .. tostring(result))
        return false
    end

    return result
end

if validateToken() then
    print("[AuthSystem] AUTHORIZED")
else
    warn("[AuthSystem] DENIED")
end
