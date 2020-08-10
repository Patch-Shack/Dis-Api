--[[
	https://discordapp.com/api/webhooks/ID/TOKEN

	local api = THE LINK AS A LOADSTRING
	local webhook1 = api.new(webhook id, the token)

	webhook1:post{
		username = "wow idk",
		content = "this is text ok"
	}
]]--
local webHook = {}
webHook.__index = webHook

function webHook.new(id,key)
	local mt = setmetatable({id=id,key=key}, webHook)
	return mt
end

function webHook:post(config,host)
	local data = nil
	local success = pcall(function()
		data = game:GetService("HttpService"):JSONEncode(config)
	end)
	if not success then warn("Discord API can't be converted to JSON.") return end
	game:GetService("HttpService"):PostAsync("http://discord.osyr.is/api/webhooks/".. self.id .. "/" .. self.key,data)
end

return webHook
