-- ez crack skid night hub 😂
repeat
	wait()
until game:IsLoaded()

local v = (getgenv or getrenv or getfenv)()
local kaitunFruit = v.KaitunFruit and typeof(v.KaitunFruit) == "table" and v.KaitunFruit or {}
kaitunFruit.Team = kaitunFruit.Team or "Marines"
kaitunFruit.BlacklistFruits = kaitunFruit.BlacklistFruits or {}
kaitunFruit.Webhook = kaitunFruit.Webhook or {}
kaitunFruit.Webhook.Enabled = kaitunFruit.Webhook.Enabled or false
kaitunFruit.Webhook.Url = kaitunFruit.Webhook.Url or ""
kaitunFruit.UsingHopApi = kaitunFruit.UsingHopApi or true
v.KaitunFruit = kaitunFruit

local obj = setmetatable({}, { __index = function(arg, arg2)
	return game:GetService(arg2)
end })

local workspace = obj.Workspace
local replicatedStorage = obj.ReplicatedStorage
local lighting = obj.Lighting
local httpService = obj.HttpService
local tweenService = obj.TweenService
local players = obj.Players
players = players and players.LocalPlayer

local tbl = {
	["Store Fruit"] = true,
	Start = true,
	Servers = {},
	["Hop Delay"] = 1.5,
	["Bypass Teleport"] = false,
}

local tbl2 = {}
local tbl3 = { Module = {} }

tbl3.Module.Encrypt = function()
	local tbl4 = {}
	local bxor = bit32.bxor
	local band = bit32.band
	local lshift = bit32.lshift
	local rshift = bit32.rshift
	local lrotate = bit32.lrotate
	local str = "NIGHTHUB|"
	local n = 8
	local n2 = 4
	local n3 = 4294967296
	local tbl5 = { 1634760805, 857760878, 2036477234, 1797285236 }

	local function fn(arg)
		local tbl6 = {}

		for i = 1, #arg, 2 do
			tbl6[#tbl6 + 1] = tonumber(arg:sub(i, i + 1), 16)
		end

		return tbl6
	end

	local function fn2(arg)
		local tbl6 = {}

		for i = 1, #arg do
			tbl6[i] = arg:byte(i)
		end

		return tbl6
	end

	local function fn3(arg)
		local tbl6 = {}

		for i = 1, #arg do
			tbl6[i] = string.char(arg[i])
		end

		return table.concat(tbl6)
	end

	local function fn4(arg, arg2)
		return arg[arg2] + arg[arg2 + 1] * 256 + arg[arg2 + 2] * 65536 + arg[arg2 + 3] * 16777216
	end

	local function fn5(arg, arg2, arg3, arg4, arg5)
		arg[arg2] = (arg[arg2] + arg[arg3]) % n3
		arg[arg5] = lrotate(bxor(arg[arg5], arg[arg2]), 16)
		arg[arg4] = (arg[arg4] + arg[arg5]) % n3
		arg[arg3] = lrotate(bxor(arg[arg3], arg[arg4]), 12)
		arg[arg2] = (arg[arg2] + arg[arg3]) % n3
		arg[arg5] = lrotate(bxor(arg[arg5], arg[arg2]), 8)
		arg[arg4] = (arg[arg4] + arg[arg5]) % n3
		arg[arg3] = lrotate(bxor(arg[arg3], arg[arg4]), 7)
	end

	local function fn6(arg)
		for i = 1, 10 do
			fn5(arg, 1, 5, 9, 13)
			fn5(arg, 2, 6, 10, 14)
			fn5(arg, 3, 7, 11, 15)
			fn5(arg, 4, 8, 12, 16)
			fn5(arg, 1, 6, 11, 16)
			fn5(arg, 2, 7, 12, 13)
			fn5(arg, 3, 8, 9, 14)
			fn5(arg, 4, 5, 10, 15)
		end
	end

	local function fn7(arg, arg2, arg3)
		local tbl6 = { tbl5[1], tbl5[2], tbl5[3], tbl5[4] }

		for i = 0, 7 do
			tbl6[5 + i] = fn4(arg, 1 + 4 * i)
		end

		tbl6[13] = arg2 % n3

		for i = 0, 2 do
			tbl6[14 + i] = fn4(arg3, 1 + 4 * i)
		end

		return tbl6
	end

	local function fn8(arg, arg2, arg3)
		local v2 = fn7(arg, arg2, arg3)
		local tbl6 = {}

		for i = 1, 16 do
			tbl6[i] = v2[i]
		end

		fn6(tbl6)
		local tbl7 = {}

		for i = 1, 16 do
			local n4 = (tbl6[i] + v2[i]) % n3
			local n5 = (i - 1) * 4
			tbl7[n5 + 1] = band(n4, 255)
			tbl7[n5 + 2] = band(rshift(n4, 8), 255)
			tbl7[n5 + 3] = band(rshift(n4, 16), 255)
			tbl7[n5 + 4] = band(rshift(n4, 24), 255)
		end

		return tbl7
	end

	local function fn9(arg, arg2, arg3, arg4)
		local tbl6 = {}
		local n4 = 0

		while n4 < arg4 do
			local v2 = fn8(arg, arg3, arg2)

			for i = 1, 64 do
				if not (arg4 <= n4) then
					n4 += 1
					tbl6[n4] = v2[i]
					continue
				end

				break
			end

			arg3 += 1
		end

		return tbl6
	end

	local function fn10(arg, arg2, arg3)
		local v2 = fn7(arg, 4294967295, arg2)
		fn6(v2)
		local n4 = #arg3

		for i = 0, n4 + (16 - n4 % 16) % 16 - 1, 16 do
			for i2 = 0, 3 do
				local n5 = i + 4 * i2
				v2[i2 + 1] = bxor(v2[i2 + 1], (arg3[n5 + 1] or 0) + (arg3[n5 + 2] or 0) * 256 + (arg3[n5 + 3] or 0) * 65536 + (arg3[n5 + 4] or 0) * 16777216)
			end

			fn6(v2)
		end

		v2[1] = bxor(v2[1], n4)
		fn6(v2)
		local v3 = v2[1]
		local tbl6 = {}
		local v4 = band(v3, 255)
		local v5 = band(rshift(v3, 8), 255)
		local v6 = band(rshift(v3, 16), 255)
		local v7 = rshift(v3, 24)
		tbl6[1] = v4
		tbl6[2] = v5
		tbl6[3] = v6

		do
			local values = table.pack(band(v7, 255))
			table.move(values, 1, values.n, 4, tbl6)
		end

		return tbl6
	end

	local tbl6 = {}

	local function fn11(arg)
		local str2 = table.concat(arg, ",")
		if tbl6[str2] then
			return tbl6[str2]
		end
		local v2 = fn9(arg, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 11259375, 128)
		local tbl7 = {}

		for i = 1, 64 do
			tbl7[i] = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"):sub(i, i)
		end

		for i = 64, 2, -1 do
			local n4 = i - 1
			local n5 = (v2[2 * n4 + 1] * 256 + v2[2 * n4 + 2]) % i + 1
			local v3 = tbl7[i]
			tbl7[i] = tbl7[n5]
			tbl7[n5] = v3
		end

		local str3 = table.concat(tbl7)
		tbl6[str2] = str3
		return str3
	end

	local function fn12(arg, arg2)
		local tbl7 = {}
		local n4 = #arg
		local n5 = 1

		while n5 <= n4 do
			local v2 = arg[n5]
			local v3 = arg[n5 + 1]
			local v4 = arg[n5 + 2]
			local v5 = rshift(v2, 2)
			tbl7[#tbl7 + 1] = arg2:sub(v5 + 1, v5 + 1)
			local n6 = lshift(band(v2, 3), 4) + rshift(v3 or 0, 4)
			tbl7[#tbl7 + 1] = arg2:sub(n6 + 1, n6 + 1)

			if v3 ~= nil then
				local n7 = lshift(band(v3, 15), 2) + rshift(v4 or 0, 6)
				tbl7[#tbl7 + 1] = arg2:sub(n7 + 1, n7 + 1)

				if v4 ~= nil then
					local v6 = band(v4, 63)
					tbl7[#tbl7 + 1] = arg2:sub(v6 + 1, v6 + 1)
					n5 += 3
					continue
				end
			end

			break
		end

		return table.concat(tbl7)
	end

	local function fn13(arg, arg2)
		local tbl7 = {}

		for i = 1, 64 do
			tbl7[arg2:sub(i, i)] = i - 1
		end

		local tbl8 = {}

		for i = 1, #arg do
			local v2 = tbl7[arg:sub(i, i)]
			if v2 == nil then
				return nil
			end
			tbl8[#tbl8 + 1] = v2
		end

		local tbl9 = {}

		for i = 1, #tbl8, 4 do
			local v2 = tbl8[i]
			local v3 = tbl8[i + 1]
			local v4 = tbl8[i + 2]
			local v5 = tbl8[i + 3]
			if v3 == nil then
				return nil
			end
			tbl9[#tbl9 + 1] = band(lshift(v2, 2) + rshift(v3, 4), 255)

			if v4 ~= nil then
				tbl9[#tbl9 + 1] = band(lshift(band(v3, 15), 4) + rshift(v4, 2), 255)
			end

			if v5 ~= nil then
				tbl9[#tbl9 + 1] = band(lshift(band(v4, 3), 6) + v5, 255)
			end
		end

		return tbl9
	end

	local v2 = fn("8992d555ed7846a562b058523100fbd0e59b5f6f28e98003230ffb4d9db60411")
	local new = Random and Random.new and Random.new() or nil

	local function fn14()
		local tbl7 = {}

		for i = 1, 8 do
			tbl7[i] = new and new:NextInteger(0, 255) or math.random(0, 255)
		end

		return tbl7
	end

	tbl4.encode = function(arg, arg2, arg3)
		arg2 = arg2 or v2
		arg3 = arg3 or fn14()
		local v3 = fn2(arg)
		local tbl7 = {}

		for i = 1, 8 do
			tbl7[i] = arg3[i]
		end

		for i = n + 1, 12 do
			tbl7[i] = 0
		end

		local v4 = fn9(arg2, tbl7, 1, #v3)
		local tbl8 = {}

		for i = 1, #v3 do
			tbl8[i] = bxor(v3[i], v4[i])
		end

		local v5 = fn10(arg2, tbl7, tbl8)
		local tbl9 = {}

		for i = 1, 8 do
			tbl9[#tbl9 + 1] = arg3[i]
		end

		for i = 1, 4 do
			tbl9[#tbl9 + 1] = v5[i]
		end

		for i = 1, #tbl8 do
			tbl9[#tbl9 + 1] = tbl8[i]
		end

		return str .. fn12(tbl9, fn11(arg2))
	end

	tbl4.decode = function(arg, arg2)
		local v3 = arg2 or v2
		if type(arg) ~= "string" or arg:sub(1, #str) ~= str then
			return nil, "bad prefix"
		end
		local v4 = fn13(arg:sub(#str + 1), fn11(v3))
		if not v4 or #v4 < n + n2 then
			return nil, "malformed"
		end
		local tbl7 = {}

		for i = 1, 8 do
			tbl7[i] = v4[i]
		end

		for i = n + 1, 12 do
			tbl7[i] = 0
		end

		local tbl8 = {}

		for i = n + n2 + 1, #v4 do
			tbl8[i - n - n2] = v4[i]
		end

		local v5 = fn10(v3, tbl7, tbl8)
		local n4 = 0

		for i = 1, 4 do
			n4 += v5[i] == v4[n + i] and 0 or 1
		end

		if n4 ~= 0 then
			return nil, "bad tag"
		end
		local v6 = fn9(v3, tbl7, 1, #tbl8)
		local tbl9 = {}

		for i = 1, #tbl8 do
			tbl9[i] = bxor(tbl8[i], v6[i])
		end

		return fn3(tbl9)
	end

	tbl4.decodeJobId = function(arg, arg2)
		local v3, v4 = tbl4.decode(arg, arg2)
		if not v3 then
			return nil, v4
		end

		if not v3:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
			return nil, "not a JobId"
		end
		return v3
	end

	return tbl4
end

tbl3.Module.PlayerMD = function()
	local tbl4

	tbl4 = {
		GetHumanoid = function()
			if players and players.Character then
				return players.Character:FindFirstChild("Humanoid")
			end
		end,
		GetHRP = function()
			local v2 = tbl4.GetHumanoid()
			if players and players.Character and v2 and v2.Health > 0 then
				return players.Character:FindFirstChild("HumanoidRootPart")
			end
		end,
	}

	return tbl4
end

tbl3.Module.TweenModules = function()
	local tbl4

	tbl4 = {
		GetDistance = function(arg, arg2, arg3)
			local v2 = tbl3.Module.PlayerMD.GetHRP()
			if not arg or not v2 then
				return
			end
			local position = typeof(arg) == "CFrame" and arg.Position or arg

			if arg2 then
				arg2 = typeof(arg2) == "CFrame" and arg2.Position or arg2
			end

			arg2 = arg2 or v2.Position
			return (Vector3.new(position.X, arg3 and 0 or position.Y, position.Z) - Vector3.new(arg2.X, arg3 and 0 or arg2.Y, arg2.Z)).Magnitude
		end,
		EnableNoClip = function()
			for _, descendant in pairs(players.Character:GetDescendants()) do
				if descendant:IsA("BasePart") then
					descendant.CanCollide = false
				end
			end
		end,
		ToggleBodyVelocity = function(arg)
			local v2 = tbl3.Module.PlayerMD.GetHRP()

			if arg then
				if v2 and not v2:FindFirstChild("BodyVelocity") then
					local bodyVelocity = Instance.new("BodyVelocity")
					bodyVelocity.Name = "BodyVelocity"
					bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
					bodyVelocity.Velocity = Vector3.zero
					bodyVelocity.P = 15000
					bodyVelocity.Parent = v2
				end
			elseif v2 and v2:FindFirstChild("BodyVelocity") then
				v2.BodyVelocity:Destroy()
			end
		end,
		StartTween = function(cFrame)
			if not cFrame then
				return
			end
			local v2 = tbl3.Module.PlayerMD.GetHRP()
			local v3 = tbl3.Module.PlayerMD.GetHumanoid()

			if players and v2 and v3 and v3.Health > 0 then
				local v4 = tbl4.GetDistance(cFrame)

				if v4 <= 30 then
					if v.Tween then
						v.Tween:Cancel()
					end

					v2.CFrame = cFrame
					return
				end

				v.Tween = tweenService:Create(v2, TweenInfo.new(v4 / (tonumber(tbl2["Tween Speed"]) or 300), Enum.EasingStyle.Linear), { CFrame = cFrame })
				v.Tween:Play()
			end
		end,
		TP = function(arg, arg2)
			if arg2 then
				tbl4.EnableNoClip()
			end

			tbl4.ToggleBodyVelocity(arg2)
			tbl4.StartTween(arg)
		end,
	}

	return tbl4
end

tbl3.Module.BypassTP = function()
	local n = 2000
	local n2 = 10000
	local n3 = 1000
	local n4 = 5
	local n5 = 20
	local tbl4 = { "Fist of Darkness", "God's Chalice", "Sweet Chalice" }
	local tbl5 = { Bypassing = false, Count = 0, CombatLabel = nil }

	local function fn(arg)
		local backpack = players:FindFirstChild("Backpack")
		if backpack and backpack:FindFirstChild(arg) then
			return true
		end
		local character = players.Character
		return character ~= nil and character:FindFirstChild(arg) ~= nil
	end

	local function fn2()
		local combatLabel = tbl5.CombatLabel
		if combatLabel and combatLabel.Parent then
			return combatLabel
		end
		local playerGui = players:FindFirstChild("PlayerGui")
		playerGui = playerGui and playerGui:FindFirstChild("Main")
		if not playerGui then
			return nil
		end
		local bottomHUDList = playerGui:FindFirstChild("BottomHUDList")
		bottomHUDList = bottomHUDList and bottomHUDList:FindFirstChild("InCombat") or playerGui:FindFirstChild("InCombat") or playerGui:FindFirstChild("InCombat", true)
		tbl5.CombatLabel = bottomHUDList
		return bottomHUDList
	end

	local function fn3()
		local worldOrigin = workspace:FindFirstChild("_WorldOrigin")
		worldOrigin = worldOrigin and worldOrigin:FindFirstChild("PlayerSpawns")
		if not worldOrigin then
			return nil
		end
		local name = players.Team and players.Team.Name or v.KaitunFruit.Team
		return name and worldOrigin:FindFirstChild(name) or worldOrigin:FindFirstChild("Pirates")
	end

	local tbl6

	tbl6 = {
		Runtime = tbl5,
		Distance = 3500,
		InCombat = function()
			local v2 = fn2()
			return v2 ~= nil and v2.Visible and v2.Text:lower():find("risk!") ~= nil
		end,
		GetBypassCFrame = function(arg)
			local v2 = fn3()
			if not v2 then
				return nil
			end
			local v3 = tbl3.Module.PlayerMD.GetHRP()
			if not v3 then
				return nil
			end
			local position = v3.Position
			local children = v2:GetChildren()
			local magnitude = (arg - position).Magnitude
			local huge = math.huge
			local cFrame = nil
			local name = nil

			for i = 1, #children do
				local part = children[i]:FindFirstChild("Part")

				if part then
					local magnitude2 = (part.Position - arg).Magnitude
					local magnitude3 = Vector3.new(part.Position.X - position.X, 0, part.Position.Z - position.Z).Magnitude

					if magnitude2 <= huge and magnitude2 + n3 <= magnitude and magnitude3 <= n2 and magnitude3 >= n then
						cFrame = part.CFrame
						name = children[i].Name
						huge = magnitude2
					end
				end
			end

			return cFrame, name
		end,
		CanBypass = function()
			if not tbl2["Bypass Teleport"] then
				return false
			end

			if n4 <= tbl5.Count then
				return false
			end

			if tbl6.InCombat() then
				return false
			end

			for i = 1, #tbl4 do
				if fn(tbl4[i]) then
					return false
				end
			end

			return true
		end,
		ResetCount = function()
			tbl5.Count = 0
		end,
		Start = function(arg)
			if tbl5.Bypassing or not tbl6.CanBypass() then
				return false
			end
			local v2, v3 = tbl6.GetBypassCFrame(arg)
			if not v2 or not v3 then
				return false
			end
			tbl5.Bypassing = true

			if v.Tween then
				pcall(function()
					v.Tween:Cancel()
				end)
			end

			tbl3.SetStatus("Bypass to " .. v3)

			task.spawn(function()
				pcall(function()
					local v4 = tbl3.Module.PlayerMD.GetHumanoid()
					local v5 = tbl3.Module.PlayerMD.GetHRP()
					if not v4 or not v5 then
						return
					end
					v5.Anchored = true

					while true do
						task.wait()
						v4.Health = 0
						replicatedStorage.Remotes.CommF_:InvokeServer("SetLastSpawnPoint", v3)
						local character = players.Character

						if character then
							character:PivotTo(v2)
						end

						if v5.Parent then
							v5.Anchored = false
						end

						task.wait(1)
						if not (v4.Health <= 0 or not v4.Parent or not tbl6.CanBypass()) then
							continue
						end
						break
					end

					tbl5.Count = tbl5.Count + 1
				end)

				local n6 = os.clock() + n5

				while true do
					task.wait()
					if not (tbl3.Module.PlayerMD.GetHRP() or os.clock() > n6) then
						continue
					end
					break
				end

				tbl5.Bypassing = false
				tbl3.SetStatus("Bypass done, count: " .. tostring(tbl5.Count))
			end)

			return true
		end,
	}

	return tbl6
end

tbl3.Authenticate = function()
	local tbl4

	tbl4 = {
		Whitelisted = false,
		IsPremiumUser = false,
		StartKeySystemUI = function(arg, arg2)
			local hui = gethui and gethui() or game:GetService("CoreGui")

			local tbl5 = {
				Tiktok = "https://tiktok.com/@luongminhnghia_",
				Discord = "",
				Youtube = "https://www.youtube.com/@NightXHub",
				Key1 = "https://link4m.com/Dmy9aqB",
				Key2 = "https://link4sub.com/NZFaNSJkIL",
			}

			if hui:FindFirstChild("KeyUi") then
				hui:FindFirstChild("KeyUi"):Destroy()
			end

			local screenGui = Instance.new("ScreenGui")
			local canvasGroup = Instance.new("CanvasGroup")
			local frame = Instance.new("Frame")
			local uiCorner = Instance.new("UICorner")
			local uiStroke = Instance.new("UIStroke")
			local imageLabel = Instance.new("ImageLabel")
			local textLabel = Instance.new("TextLabel")
			local textLabel2 = Instance.new("TextLabel")
			local frame2 = Instance.new("Frame")
			local imageLabel2 = Instance.new("ImageLabel")
			local frame3 = Instance.new("Frame")
			local frame4 = Instance.new("Frame")
			local uiCorner2 = Instance.new("UICorner")
			local uiStroke2 = Instance.new("UIStroke")
			local textBox = Instance.new("TextBox")
			local imageLabel3 = Instance.new("ImageLabel")
			local frame5 = Instance.new("Frame")
			local textButton = Instance.new("TextButton")
			local uiCorner3 = Instance.new("UICorner")
			local uiStroke3 = Instance.new("UIStroke")
			local textLabel3 = Instance.new("TextLabel")
			local textButton2 = Instance.new("TextButton")
			local uiCorner4 = Instance.new("UICorner")
			local uiStroke4 = Instance.new("UIStroke")
			local textLabel4 = Instance.new("TextLabel")
			local textButton3 = Instance.new("TextButton")
			local uiCorner5 = Instance.new("UICorner")
			local uiStroke5 = Instance.new("UIStroke")
			local textLabel5 = Instance.new("TextLabel")
			local frame6 = Instance.new("Frame")
			local uiListLayout = Instance.new("UIListLayout")
			local textButton4 = Instance.new("TextButton")
			local uiCorner6 = Instance.new("UICorner")
			local uiStroke6 = Instance.new("UIStroke")
			local textLabel6 = Instance.new("TextLabel")
			local textButton5 = Instance.new("TextButton")
			local uiCorner7 = Instance.new("UICorner")
			local uiStroke7 = Instance.new("UIStroke")
			local textLabel7 = Instance.new("TextLabel")
			local textButton6 = Instance.new("TextButton")
			local uiCorner8 = Instance.new("UICorner")
			local uiStroke8 = Instance.new("UIStroke")
			local textLabel8 = Instance.new("TextLabel")
			local frame7 = Instance.new("Frame")
			local uiCorner9 = Instance.new("UICorner")
			local uiGradient = Instance.new("UIGradient")
			screenGui.Name = "KeyUi"
			screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			screenGui.Parent = hui
			canvasGroup.BorderSizePixel = 0
			canvasGroup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			canvasGroup.AnchorPoint = Vector2.new(0.5, 0.5)
			canvasGroup.Size = UDim2.new(0, 365, 0, 415)
			canvasGroup.Position = UDim2.new(0.5, 0, 0.3, 0)
			canvasGroup.BorderColor3 = Color3.fromRGB(0, 0, 0)
			canvasGroup.BackgroundTransparency = 1
			canvasGroup.Parent = screenGui
			canvasGroup.GroupTransparency = 1
			MakeDraggable(canvasGroup, canvasGroup)
			frame.BorderSizePixel = 0
			frame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
			frame.AnchorPoint = Vector2.new(0.5, 0.5)
			frame.Size = UDim2.new(1, -15, 1, -15)
			frame.Position = UDim2.new(0.5, 0, 0.5, 0)
			frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame.Name = "Main"
			frame.BackgroundTransparency = 0.4
			frame.Parent = canvasGroup
			uiCorner.CornerRadius = UDim.new(0, 15)
			uiCorner.Parent = frame
			uiStroke.Transparency = 0.9
			uiStroke.Color = Color3.fromRGB(255, 255, 255)
			uiStroke.Parent = frame
			imageLabel.BorderSizePixel = 0
			imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			imageLabel.Image = "rbxassetid://118583787829543"
			imageLabel.Size = UDim2.new(0, 55, 0, 55)
			imageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			imageLabel.BackgroundTransparency = 1
			imageLabel.Name = "LogoScript"
			imageLabel.Position = UDim2.new(0, 15, 0, 15)
			imageLabel.Parent = frame
			textLabel.TextWrapped = true
			textLabel.BorderSizePixel = 0
			textLabel.TextSize = 23
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.TextYAlignment = Enum.TextYAlignment.Top
			textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
			textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			textLabel.BackgroundTransparency = 1
			textLabel.Size = UDim2.new(0, 300, 0, 20)
			textLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textLabel.Text = "NIGHT HUB KEY SYSTEM"
			textLabel.Name = "TitleKey"
			textLabel.Position = UDim2.new(0, 75, 0, 20)
			textLabel.Parent = frame
			textLabel2.TextWrapped = true
			textLabel2.BorderSizePixel = 0
			textLabel2.TextSize = 13
			textLabel2.TextXAlignment = Enum.TextXAlignment.Left
			textLabel2.TextTransparency = 0.5
			textLabel2.TextYAlignment = Enum.TextYAlignment.Top
			textLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textLabel2.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
			textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Size = UDim2.new(0, 300, 0, 20)
			textLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textLabel2.Text = "THE AUTHENTICATE SYSTEM"
			textLabel2.Name = "IDKKey"
			textLabel2.Position = UDim2.new(0, 75, 0, 42)
			textLabel2.Parent = frame
			frame2.ZIndex = 0
			frame2.BorderSizePixel = 0
			frame2.Size = UDim2.new(1, 0, 1, 0)
			frame2.Name = "DropShadowHolder"
			frame2.BackgroundTransparency = 1
			frame2.Parent = frame
			imageLabel2.ZIndex = 0
			imageLabel2.BorderSizePixel = 0
			imageLabel2.SliceCenter = Rect.new(49, 49, 450, 450)
			imageLabel2.ScaleType = Enum.ScaleType.Slice
			imageLabel2.ImageTransparency = 0.5
			imageLabel2.ImageColor3 = Color3.fromRGB(0, 0, 0)
			imageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
			imageLabel2.Image = "rbxassetid://6014261993"
			imageLabel2.Size = UDim2.new(1, 47, 1, 47)
			imageLabel2.BackgroundTransparency = 1
			imageLabel2.Name = "DropShadow"
			imageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
			imageLabel2.Parent = frame2
			frame3.BorderSizePixel = 0
			frame3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame3.Size = UDim2.new(1, -50, 1, -90)
			frame3.Position = UDim2.new(0, 25, 0, 80)
			frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame3.Name = "Container"
			frame3.BackgroundTransparency = 1
			frame3.Parent = frame
			frame4.BorderSizePixel = 0
			frame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame4.Size = UDim2.new(1, 0, 0, 50)
			frame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame4.Name = "KeyFrame"
			frame4.BackgroundTransparency = 0.95
			frame4.Parent = frame3
			uiCorner2.CornerRadius = UDim.new(0, 12)
			uiCorner2.Parent = frame4
			uiStroke2.Transparency = 0.9
			uiStroke2.Color = Color3.fromRGB(255, 255, 255)
			uiStroke2.Parent = frame4
			textBox.Name = "EnterKeyBox"
			textBox.TextXAlignment = Enum.TextXAlignment.Left
			textBox.PlaceholderColor3 = Color3.fromRGB(145, 145, 145)
			textBox.BorderSizePixel = 0
			textBox.TextSize = 14
			textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
			textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textBox.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
			textBox.ClipsDescendants = true
			textBox.PlaceholderText = "Enter Key..."
			textBox.Size = UDim2.new(1, -50, 1, -5)
			textBox.Position = UDim2.new(0, 50, 0, 2)
			textBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textBox.Text = ""
			textBox.BackgroundTransparency = 1
			textBox.Parent = frame4
			imageLabel3.BorderSizePixel = 0
			imageLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			imageLabel3.ImageTransparency = 0.5
			imageLabel3.AnchorPoint = Vector2.new(0, 0.5)
			imageLabel3.Image = "rbxassetid://83924775363502"
			imageLabel3.Size = UDim2.new(0, 23, 0, 23)
			imageLabel3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			imageLabel3.BackgroundTransparency = 1
			imageLabel3.Name = "KeyIcon"
			imageLabel3.Position = UDim2.new(0, 15, 0.5, 0)
			imageLabel3.Parent = frame4
			frame5.BorderSizePixel = 0
			frame5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame5.Size = UDim2.new(1, 0, 0, 45)
			frame5.Position = UDim2.new(0, 0, 0, 60)
			frame5.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame5.Name = "GetKeyFrame"
			frame5.BackgroundTransparency = 1
			frame5.Parent = frame3
			textButton.BorderSizePixel = 0
			textButton.AutoButtonColor = false
			textButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textButton.Selectable = false
			textButton.BackgroundTransparency = 0.95
			textButton.Size = UDim2.new(0.48, 0, 1, -5)
			textButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textButton.Text = ""
			textButton.Name = "ButtonKeyServer1"
			textButton.Position = UDim2.new(0, 0, 0, 3)
			textButton.Parent = frame5
			uiCorner3.CornerRadius = UDim.new(0, 15)
			uiCorner3.Parent = textButton
			uiStroke3.Transparency = 0.9
			uiStroke3.Color = Color3.fromRGB(255, 255, 255)
			uiStroke3.Parent = textButton
			textLabel3.BorderSizePixel = 0
			textLabel3.TextSize = 13
			textLabel3.TextTransparency = 0.3
			textLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textLabel3.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
			textLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
			textLabel3.BackgroundTransparency = 1
			textLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
			textLabel3.Size = UDim2.new(1, -20, 1, -20)
			textLabel3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textLabel3.Text = "GETKEY SERVER 1"
			textLabel3.Name = "Sibidi"
			textLabel3.Position = UDim2.new(0.5, 0, 0.5, 0)
			textLabel3.Parent = textButton
			textButton2.BorderSizePixel = 0
			textButton2.AutoButtonColor = false
			textButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textButton2.Selectable = false
			textButton2.BackgroundTransparency = 0.95
			textButton2.Size = UDim2.new(0.48, 0, 1, -5)
			textButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textButton2.Text = ""
			textButton2.Name = "ButtonKeyServer2"
			textButton2.Position = UDim2.new(0.52, 0, 0, 3)
			textButton2.Parent = frame5
			uiCorner4.CornerRadius = UDim.new(0, 15)
			uiCorner4.Parent = textButton2
			uiStroke4.Transparency = 0.9
			uiStroke4.Color = Color3.fromRGB(255, 255, 255)
			uiStroke4.Parent = textButton2
			textLabel4.BorderSizePixel = 0
			textLabel4.TextSize = 13
			textLabel4.TextTransparency = 0.3
			textLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textLabel4.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
			textLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
			textLabel4.BackgroundTransparency = 1
			textLabel4.AnchorPoint = Vector2.new(0.5, 0.5)
			textLabel4.Size = UDim2.new(1, -20, 1, -20)
			textLabel4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textLabel4.Text = "GETKEY SERVER 2"
			textLabel4.Name = "Sibidi"
			textLabel4.Position = UDim2.new(0.5, 0, 0.5, 0)
			textLabel4.Parent = textButton2
			textButton3.BorderSizePixel = 0
			textButton3.AutoButtonColor = false
			textButton3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textButton3.Selectable = false
			textButton3.BackgroundTransparency = 0.95
			textButton3.Size = UDim2.new(1, 0, 0, 40)
			textButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textButton3.Text = ""
			textButton3.Name = "ButtonSubmitKey"
			textButton3.Position = UDim2.new(0, 0, 0, 50)
			textButton3.Parent = frame5
			uiCorner5.CornerRadius = UDim.new(0, 15)
			uiCorner5.Parent = textButton3
			uiStroke5.Transparency = 0.9
			uiStroke5.Color = Color3.fromRGB(255, 255, 255)
			uiStroke5.Parent = textButton3
			textLabel5.BorderSizePixel = 0
			textLabel5.TextSize = 13
			textLabel5.TextTransparency = 0.3
			textLabel5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textLabel5.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
			textLabel5.TextColor3 = Color3.fromRGB(255, 255, 255)
			textLabel5.BackgroundTransparency = 1
			textLabel5.AnchorPoint = Vector2.new(0.5, 0.5)
			textLabel5.Size = UDim2.new(1, -20, 1, -20)
			textLabel5.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textLabel5.Text = "Submit Key"
			textLabel5.Name = "Sibidi"
			textLabel5.Position = UDim2.new(0.5, 0, 0.5, 0)
			textLabel5.Parent = textButton3
			frame6.BorderSizePixel = 0
			frame6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame6.Size = UDim2.new(1, 0, 1, -160)
			frame6.Position = UDim2.new(0, 0, 0, 160)
			frame6.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame6.Name = "IDK"
			frame6.BackgroundTransparency = 1
			frame6.Parent = frame3
			uiListLayout.Padding = UDim.new(0, 5)
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.Parent = frame6
			textButton4.BorderSizePixel = 0
			textButton4.AutoButtonColor = false
			textButton4.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			textButton4.Selectable = false
			textButton4.BackgroundTransparency = 0.5
			textButton4.Size = UDim2.new(1, 0, 0, 45)
			textButton4.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textButton4.Text = ""
			textButton4.Name = "YouTubeButton"
			textButton4.Position = UDim2.new(0, 0, 0, 3)
			textButton4.Parent = frame6
			uiCorner6.CornerRadius = UDim.new(0, 15)
			uiCorner6.Parent = textButton4
			uiStroke6.Transparency = 0.9
			uiStroke6.Color = Color3.fromRGB(255, 255, 255)
			uiStroke6.Parent = textButton4
			textLabel6.BorderSizePixel = 0
			textLabel6.TextSize = 13
			textLabel6.TextTransparency = 0.3
			textLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textLabel6.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
			textLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
			textLabel6.BackgroundTransparency = 1
			textLabel6.AnchorPoint = Vector2.new(0.5, 0.5)
			textLabel6.Size = UDim2.new(1, -20, 1, -20)
			textLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textLabel6.Text = "Youtube"
			textLabel6.Name = "Sibidi"
			textLabel6.Position = UDim2.new(0.5, 0, 0.5, 0)
			textLabel6.Parent = textButton4
			textButton5.BorderSizePixel = 0
			textButton5.AutoButtonColor = false
			textButton5.BackgroundColor3 = Color3.fromRGB(4, 4, 255)
			textButton5.Selectable = false
			textButton5.BackgroundTransparency = 0.5
			textButton5.Size = UDim2.new(1, 0, 0, 45)
			textButton5.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textButton5.Text = ""
			textButton5.Name = "DiscordButton"
			textButton5.Position = UDim2.new(0, 0, 0, 3)
			textButton5.Parent = frame6
			uiCorner7.CornerRadius = UDim.new(0, 15)
			uiCorner7.Parent = textButton5
			uiStroke7.Transparency = 0.9
			uiStroke7.Color = Color3.fromRGB(255, 255, 255)
			uiStroke7.Parent = textButton5
			textLabel7.BorderSizePixel = 0
			textLabel7.TextSize = 13
			textLabel7.TextTransparency = 0.3
			textLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textLabel7.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
			textLabel7.TextColor3 = Color3.fromRGB(255, 255, 255)
			textLabel7.BackgroundTransparency = 1
			textLabel7.AnchorPoint = Vector2.new(0.5, 0.5)
			textLabel7.Size = UDim2.new(1, -20, 1, -20)
			textLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textLabel7.Text = "Discord"
			textLabel7.Name = "Sibidi"
			textLabel7.Position = UDim2.new(0.5, 0, 0.5, 0)
			textLabel7.Parent = textButton5
			textButton6.BorderSizePixel = 0
			textButton6.AutoButtonColor = false
			textButton6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			textButton6.Selectable = false
			textButton6.BackgroundTransparency = 0.5
			textButton6.Size = UDim2.new(1, 0, 0, 45)
			textButton6.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textButton6.Text = ""
			textButton6.Name = "TiktokButton"
			textButton6.Position = UDim2.new(0, 0, 0, 3)
			textButton6.Parent = frame6
			uiCorner8.CornerRadius = UDim.new(0, 15)
			uiCorner8.Parent = textButton6
			uiStroke8.Transparency = 0.9
			uiStroke8.Color = Color3.fromRGB(255, 255, 255)
			uiStroke8.Parent = textButton6
			textLabel8.BorderSizePixel = 0
			textLabel8.TextSize = 13
			textLabel8.TextTransparency = 0.3
			textLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			textLabel8.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
			textLabel8.TextColor3 = Color3.fromRGB(255, 255, 255)
			textLabel8.BackgroundTransparency = 1
			textLabel8.AnchorPoint = Vector2.new(0.5, 0.5)
			textLabel8.Size = UDim2.new(1, -20, 1, -20)
			textLabel8.BorderColor3 = Color3.fromRGB(0, 0, 0)
			textLabel8.Text = "Tiktok"
			textLabel8.Name = "Sibidi"
			textLabel8.Position = UDim2.new(0.5, 0, 0.5, 0)
			textLabel8.Parent = textButton6
			frame7.ZIndex = -999
			frame7.BorderSizePixel = 0
			frame7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			frame7.Size = UDim2.new(1, 0, 0, 100)
			frame7.Position = UDim2.new(0, 0, 1, -100)
			frame7.BorderColor3 = Color3.fromRGB(0, 0, 0)
			frame7.Name = "Gradient"
			frame7.BackgroundTransparency = 0.8
			frame7.Parent = frame
			uiCorner9.CornerRadius = UDim.new(0, 15)
			uiCorner9.Parent = frame7
			uiGradient.Rotation = 90
			uiGradient.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })

			uiGradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)),
			})

			uiGradient.Parent = frame7
			local TweenService = game:GetService("TweenService")
			TweenService:Create(canvasGroup, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), { GroupTransparency = 0, Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()

			local function fn(arg3, arg4, arg5)
				local n = arg5 or 0.95
				local backgroundTransparency = arg3.BackgroundTransparency

				arg3.MouseEnter:Connect(function()
					local tbl6 = { BackgroundTransparency = n }
					TweenService:Create(arg3, TweenInfo.new(0.4, Enum.EasingStyle.Quad), tbl6):Play()
					TweenService:Create(arg4, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), { TextTransparency = 0 }):Play()
				end)

				arg3.MouseLeave:Connect(function()
					local tbl6 = { BackgroundTransparency = backgroundTransparency }
					TweenService:Create(arg3, TweenInfo.new(0.4, Enum.EasingStyle.Quad), tbl6):Play()
					TweenService:Create(arg4, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), { TextTransparency = 0.3 }):Play()
				end)
			end

			fn(textButton3, textLabel5)
			fn(textButton, textLabel3)
			fn(textButton2, textLabel4)
			fn(textButton4, textLabel6, 0.4)
			fn(textButton5, textLabel7, 0.4)
			fn(textButton6, textLabel8, 0.4)

			textButton3.Activated:Connect(function()
				arg(textBox.Text, false)
			end)

			textButton.Activated:Connect(function()
				arg2:Notify({ Title = "Authenticate System", Content = "Link Get key 1 Copied!", Duration = 10 })
				setclipboard(tbl5.Key1)
			end)

			textButton2.Activated:Connect(function()
				arg2:Notify({ Title = "Authenticate System", Content = "Link Get key 2 Copied!", Duration = 10 })
				setclipboard(tbl5.Key2)
			end)

			textButton4.Activated:Connect(function()
				setclipboard(tbl5.Youtube)
			end)

			textButton5.Activated:Connect(function()
				setclipboard(tbl5.Discord)
			end)

			textButton6.Activated:Connect(function()
				setclipboard(tbl5.Tiktok)
			end)

			textBox.Focused:Connect(function()
				TweenService:Create(uiStroke2, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), { Transparency = 0.75 }):Play()
				TweenService:Create(imageLabel3, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), { ImageTransparency = 0 }):Play()
			end)

			textBox.FocusLost:Connect(function()
				TweenService:Create(uiStroke2, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), { Transparency = 0.9 }):Play()
				TweenService:Create(imageLabel3, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), { ImageTransparency = 0.5 }):Play()
			end)
		end,
		DeleteKeyUi = function()
			local hui = gethui and gethui() or game:GetService("CoreGui")

			if hui and hui:FindFirstChild("KeyUi") then
				hui:FindFirstChild("KeyUi"):Destroy()
			end
		end,
		savekey = function(arg)
			writefile("NightHubKey.bin", tostring(arg))
		end,
		readkey = function()
			if not isfile("NightHubKey.bin") then
				return false, nil
			end
			return true, readfile("NightHubKey.bin")
		end,
		decodeResponse = function(arg)
			if not arg or type(arg) ~= "string" then
				return false, "no response Body or response Body is not a string"
			end
			local ok, result = pcall(httpService.JSONDecode, httpService, arg)
			if not ok then
				return false, "failed to decode response Body as JSON"
			end
			return true, result
		end,
		checkhooked = function()
			local v2 = isfunctionhooked
			if not v2 then
				return false, "no isfunctionhooked function found"
			end
			local ok, result = pcall(v2, request)
			if not ok then
				return false, "failed to check if request is hooked"
			end

			if result then
				return false, "request function is hooked"
			end
			return true, nil
		end,
		StartAuthentication = function(arg, arg2, arg3)
			if not arg or not arg2 then
				return false, "Missing Key or Hwid"
			end
			local v2, v3 = tbl4.checkhooked()
			if not v2 then
				players:Kick("[Authenticate System]\n" .. v3)
				return false, v3
			end
			local str = identifyexecutor() or "nil"
			local str2 = httpService:GenerateGUID():sub(1, 8)
			local v4 = arg2 or gethwid()
			local userId = players.UserId
			local gameId = game.GameId
			local now = tick()
			local str3 = string.format("%scheck?sign=%s&key=%s&hwid=%s&executor=%s&time=%s", "http://160.250.135.231/auth/", (str2 .. userId .. gameId):lower(), arg, v4, str, now)

			local ok, result = pcall(function()
				return request({ Url = str3, Method = "GET" })
			end)

			if not ok then
				return false, "Failed to send request to API or request is blocked"
			end

			if not result or result.StatusCode ~= 200 then
				result = result and result.StatusCode or "502"
				return false, "Failed to get valid response from API or API is down\n Status Code: " .. result
			end
			local v5, v6 = tbl3.Module.Encrypt.decode(result.Body, KEY)
			if not v5 then
				return false, "Failed to Decode Response from API or Response is Invalid"
			end
			local v7, v8 = tbl4.decodeResponse(v6)
			if not v7 then
				return false, v8
			end

			if not v8.status or v8.status ~= true then
				return false, v8.message or "Invalid Response from API"
			end

			if v8.status == true and v8.message == "Auth Success!" and v8.hash and tostring(v8.key) == tostring(arg) then
				local ok2, result2 = pcall(function()
					return request({
						Url = string.format("%sstep2?key=%s&hwid=%s&hash=%s", "http://160.250.135.231/auth/", arg, v4, v8.hash),
						Method = "GET",
					})
				end)

				if not ok2 then
					return false, "Failed to send request to API or request is blocked"
				end

				if not result2 or result2.StatusCode ~= 200 then
					result2 = result2 and tostring(result2.StatusCode) or "502"
					return false, "Failed to get valid response from API or API is down\n Status Code: " .. result2
				end
				local v9, v10 = tbl3.Module.Encrypt.decode(result2.Body, KEY)
				if not v9 then
					return false, "Failed to Decode Response from API or Response is Invalid"
				end
				local v11, v12 = tbl4.decodeResponse(v10)
				if not v11 then
					return false, v12
				end

				if not v12.hash or v8.hash ~= v12.hash then
					return false, "Hash mismatch"
				end

				if not v12.key or v12.key ~= arg then
					return false, "Key mismatch"
				end

				if v8.ispremium and v8.ispremium ~= true and arg3 == true then
					return false, "This Key is not Premium"
				end
				local ispremium = v8.ispremium or false
				tbl4.savekey(arg)
				return true, "Authentication Successful!", ispremium
			end

			return false, "Invalid Response from API"
		end,
		Start = function(arg, arg2)
			local now = tick()
			print("[Time]", "Starting Authenticate")
			local v2, v3, v4 = tbl4.StartAuthentication(arg, gethwid(), arg2)

			if not v2 then
				if isfile("NightHubKey.bin") then
					delfile("NightHubKey.bin")
				end

				tbl4.Whitelisted = false
				players:Kick("[Authenticate System]\n" .. v3)
			else
				Library:Notify({ Title = "Authenticate System", Content = v3, Duration = 8 })
				tbl4.IsPremiumUser = v4
				tbl4.Whitelisted = true
			end

			print("[Time]", "Authenticated in " .. tostring(tick() - now) .. " seconds")
		end,
		StartKeySystem = function(arg)
			print("[Authenticate]", "Start Key System")
			local v2, v3 = tbl4.readkey()

			if v2 and v3 then
				tbl4.Start(v3, arg)
			else
				tbl4.StartKeySystemUI(tbl4.Start, Library)
			end

			while tbl4.Whitelisted == false and wait() do
			end

			tbl4.DeleteKeyUi()
			print("[Authenticate]", "Whitelisted!")
		end,
	}

	-- Key bypass
	tbl4.Start = function(arg, arg2)
		Library:Notify({ Title = "Authenticate System", Content = "Authentication Successful!", Duration = 8 })
		tbl4.IsPremiumUser = true
		tbl4.Whitelisted = true
	end

	return tbl4.StartKeySystem
end

tbl3.SetStatus = function(arg)
	pcall(function()
		tbl3.Features.Status["Script Status"]:SetDesc(arg)
	end)
end

tbl3.InitModules = function()
	local module = tbl3.Module

	for k, v2 in pairs(module) do
		if typeof(v2) == "function" then
			local ok, result = pcall(v2)

			if ok and result then
				module[k] = result
			elseif not ok and result then
				warn("Loader", "Module", "Failed to load", k, result)
			end
		end
	end
end

tbl3.InitSettings = function()
	local settings

	settings = {
		SaveSettings = function()
			writefile(players.Name .. "_FindFruitConfig.json", httpService:JSONEncode(tbl))
		end,
		LoadSettings = function()
			local ok, result = pcall(function()
				return httpService:JSONDecode(readfile(players.Name .. "_FindFruitConfig.json"))
			end)

			if not ok then
				settings.SaveSettings()
				return settings.LoadSettings()
			end
			return result
		end,
	}

	local v2 = tbl
	tbl = settings.LoadSettings()
	local flag = false

	for k, v3 in pairs(v2) do
		if tbl[k] == nil then
			tbl[k] = v3
			flag = true
		end
	end

	if flag then
		settings.SaveSettings()
	end

	setmetatable(tbl2, {
		__index = tbl,
		__newindex = function(arg, arg2, arg3)
			rawset(tbl, arg2, arg3 or nil)
			settings.SaveSettings()
		end,
	})

	tbl3.Module.Settings = settings
end

tbl3.CreateWindow = function()
	tbl3.Library = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

	tbl3.Window = tbl3.Library:CreateWindow({
		Title = "Night Hub Kaitun Find Fruit",
		SubTitle = "Devs by @luongminhnghia_",
		TabWidth = 145,
		MinimizeKey = Enum.KeyCode.RightControl,
		Size = UDim2.fromOffset(450, 350),
		Acrylic = false,
		Theme = tbl2["Select Themes"],
		Image = "rbxassetid://118583787829543",
	})
end

tbl3.CreateTabs = function()
	tbl3.Tabs = {}
	tbl3.Features = {}

	local function fn(arg, arg2)
		tbl3.Features[arg] = {}
		tbl3.Tabs[arg] = tbl3.Window:AddTab({ Title = arg, Icon = arg2 })
	end

	fn("Status", "home")
	fn("Configuration", "settings")
	tbl3.Window:SelectTab(1)
end

tbl3.LoadLibrary = function()
	tbl3.CreateWindow()
	tbl3.CreateTabs()

	local function fn(arg, arg2)
		if not arg2.Title then
			warn("Paragraph Missing Title!")
			return
		end
		tbl3.Features[arg][arg2.Title] = tbl3.Tabs[arg]:AddParagraph(arg2)
	end

	local function fn2(arg, arg2)
		if not arg2.Title or not arg2.Values then
			warn("Dropdown Missing Title or Values!")
			return
		end
		arg2.Default = arg2.Default or tbl2[arg2.Title] or arg2.Multi and {} or ""

		arg2.Callback = arg2.Callback or function(arg3)
			tbl2[arg2.Title] = arg3
		end

		return tbl3.Tabs[arg]:AddDropdown("Dropdown", arg2)
	end

	local function fn3(arg, arg2)
		if not arg2.Title then
			warn("Toggle Missing Title!")
			return
		end
		arg2.Default = arg2.Default or tbl2[arg2.Title] or false

		arg2.Callback = arg2.Callback or function(arg3)
			tbl2[arg2.Title] = arg3
		end

		return tbl3.Tabs[arg]:AddToggle("Toggle", arg2)
	end

	local function fn4(arg, arg2)
		if not arg2.Title then
			warn("Textbox Missing Title!")
			return
		end
		arg2.Default = arg2.Default or tbl2[arg2.Title] or false
		arg2.PlaceHolder = arg2.PlaceHolder or ""
		arg2.Numberic = arg2.Numberic or false

		arg2.Callback = arg2.Callback or function(arg3)
			tbl2[arg2.Title] = arg3
		end

		return tbl3.Tabs[arg]:AddInput("Textbox", arg2)
	end

	fn("Status", { Title = "Fruits In Server", Content = "Finding..." })
	fn("Status", { Title = "Time Elapsed", Content = "0 Hours 0 Minutes 0 Seconds" })
	fn("Status", { Title = "Script Status", Content = "None" })

	fn2("Configuration", {
		Title = "Select Themes",
		Values = { "Dark", "Darker", "Light", "Aqua", "Amethyst", "Rose" },
		Callback = function(arg)
			tbl3.Library:SetTheme(arg)
			tbl2["Select Themes"] = arg
		end,
	})

	fn2("Configuration", { Title = "Tween Speed", Values = { "180", "250", "300", "325", "350" }, Desc = "High=Risk" })
	fn3("Configuration", { Title = "Fix lag when executing script" })
	fn3("Configuration", { Title = "Bypass Teleport", Desc = "Respawn at nearest spawn instead of long tween" })
	fn4("Configuration", { Title = "Hop Delay", PlaceHolder = "Enter Number", Numberic = true })
	fn3("Configuration", { Title = "Start", Desc = "Start kaitun find Fruit" })
	fn3("Configuration", { Title = "Store Fruit" })
end

tbl3.MakeFunctions = function()
	tbl3.Functions = {}
	tbl3.Thread = {}

	local function fn(arg, arg2)
		if tbl2[arg] and not tbl3.Thread[arg] then
			tbl3.Thread[arg] = true

			spawn(function()
				while tbl2[arg] and wait() do
					local ok, result = pcall(arg2)

					if not ok then
						warn(arg, result)
					end
				end

				tbl3.Thread[arg] = nil
			end)
		end
	end

	local tweenModules = tbl3.Module.TweenModules
	local playerMD = tbl3.Module.PlayerMD
	local encrypt = tbl3.Module.Encrypt
	local bypassTP = tbl3.Module.BypassTP
	local n = 25

	local function fn2(cFrame)
		if bypassTP.Runtime.Bypassing then
			return false
		end
		local v2 = playerMD.GetHRP()
		if not v2 then
			return false
		end
		local position = cFrame.Position
		local magnitude = (position - v2.Position).Magnitude

		if magnitude <= n then
			bypassTP.ResetCount()
			v2.CFrame = cFrame
			return true
		end

		if magnitude >= bypassTP.Distance and bypassTP.CanBypass() and bypassTP.GetBypassCFrame(position) then
			return bypassTP.Start(position)
		end
		tweenModules.TP(cFrame, true)
		return true
	end

	local function fn3()
		local tbl4 = {}
		local v2 = next
		local children, v3 = workspace:GetChildren()

		for _, v4 in v2, children, v3 do
			if (v4:IsA("Model") or v4:IsA("Tool")) and string.find(v4.Name, "Fruit") and v4.Parent and v4:FindFirstChild("Handle") then
				table.insert(tbl4, v4)
			end
		end

		return tbl4
	end

	local n2 = 500

	local function fn4(arg)
		if typeof(tbl2.Servers) ~= "table" then
			tbl2.Servers = {}
		end

		local servers = tbl2.Servers
		local flag = false

		if not table.find(servers, arg) then
			table.insert(servers, arg)
			flag = true
		end

		while n2 < #servers do
			table.remove(servers, 1)
			flag = true
		end

		if flag then
			tbl3.Module.Settings.SaveSettings()
		end

		return servers
	end

	local function fn5()
		local v2 = fn4(game.JobId)
		local tbl4 = {}

		for _, v3 in ipairs(v2) do
			tbl4[v3] = true
		end

		local ok, result = pcall(function()
			return http.request({ Url = "http://163.223.9.144/boss/Fruits", Method = "GET" })
		end)

		if not ok or typeof(result) ~= "table" or not result.Body then
			warn("HopFindFruit", ok, typeof(result) == "table" and result.StatusCode or result)
			return
		end

		local ok2, result2 = pcall(function()
			return httpService:JSONDecode(result.Body)
		end)

		if not ok2 or typeof(result2) ~= "table" or typeof(result2.data) ~= "table" then
			warn("HopFindFruit", "Invalid response", result2)
			return
		end
		local tbl5 = {}
		local tbl6 = {}

		for _, v3 in pairs(result2.data) do
			if typeof(v3) == "table" and v3.JobId and v3.Age and v3.PlaceId == game.PlaceId then
				local v4 = encrypt.decodeJobId(v3.JobId)

				if v4 and v4 ~= game.JobId and not tbl5[v4] and not tbl4[v4] and not table.find(v.KaitunFruit.BlacklistFruits, v3.Name) then
					tbl5[v4] = true
					table.insert(tbl6, { JobId = v4, Name = v3.Name, Age = v3.Age })
				end
			end
		end

		if #tbl6 <= 0 then
			return
		end

		table.sort(tbl6, function(arg, arg2)
			return arg.Age < arg2.Age
		end)

		for _, v3 in ipairs(tbl6) do
			local jobId = v3.JobId

			tbl3.Library:Notify({
				Title = "Joining Server Have Fruit",
				Content = "Fruit Name: " .. tostring(v3.Name) .. " JobId: " .. jobId .. " Age: " .. tostring(v3.Age),
				Duration = 3,
			})

			game.ReplicatedStorage.__ServerBrowser:InvokeServer("teleport", v3.JobId)
			task.wait(0.3)
		end
	end

	local function fn6()
		local serverBrowser = replicatedStorage:WaitForChild("__ServerBrowser")

		for i = 1, 100 do
			for k, v2 in next, serverBrowser:InvokeServer(i), nil do
				if game.JobId ~= k and v2.Count <= 12 then
					serverBrowser:InvokeServer("teleport", k)
					task.wait(0.3)
				end
			end
		end
	end

	tbl3.Functions["Fix lag when executing script"] = function()
		if v.KaitunFruit.FixedLag then
			return
		end
		v.KaitunFruit.FixedLag = true

		pcall(function()
			for _, descendant in pairs(lighting:GetDescendants()) do
				if descendant:IsA("Atmosphere") then
					descendant:Destroy()
				end
			end

			local terrain = workspace:FindFirstChildOfClass("Terrain")

			if terrain then
				terrain.WaterWaveSize = 0
				terrain.WaterWaveSpeed = 0
				terrain.WaterReflectance = 0
				terrain.WaterTransparency = 1
			end

			lighting.GlobalShadows = false
			lighting.FogStart = 9e9
			lighting.FogEnd = 9e9

			for _, descendant in ipairs(lighting:GetDescendants()) do
				if descendant:IsA("PostEffect") then
					descendant.Enabled = false
				end
			end

			local UserGameSettings = UserSettings():GetService("UserGameSettings")
			UserGameSettings.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
			UserGameSettings.MasterVolume = 0

			if sethiddenproperty then
				sethiddenproperty(UserGameSettings, "GraphicsQualityLevel", 1)
			end

			SoundService.Volume = 0
		end)

		local function fn7(arg)
			if arg:IsA("BasePart") then
				arg.CastShadow = false
				arg.Material = Enum.Material.Plastic
				arg.Reflectance = 0
			elseif arg:IsA("Decal") then
				arg.Texture = ""
				arg.Transparency = 1
			elseif arg:IsA("ParticleEmitter") then
				arg.Lifetime = NumberRange.new(0)
			elseif arg:IsA("Trail") then
				arg.Lifetime = 0
			elseif arg:IsA("ForceField") or arg:IsA("Sparkles") or arg:IsA("Smoke") or arg:IsA("Fire") or arg:IsA("Beam") then
				task.defer(function()
					pcall(function()
						arg:Destroy()
					end)
				end)
			end
		end

		for i, descendant in ipairs(workspace:GetDescendants()) do
			pcall(fn7, descendant)

			if i % 5000 == 0 then
				task.wait()
			end
		end

		wait(1)
	end

	tbl3.Functions["Store Fruit"] = function()
		local character = players.Character
		local backpack = players:FindFirstChild("Backpack")
		if not character or not backpack then
			return
		end

		for _, child in pairs(character:GetChildren()) do
			if child.Name:find("Fruit") and child:GetAttribute("OriginalName") then
				replicatedStorage.Remotes.CommF_:InvokeServer("StoreFruit", child:GetAttribute("OriginalName"), child)
				task.wait(0.1)
			end
		end

		for _, child in pairs(backpack:GetChildren()) do
			if child.Name:find("Fruit") and child:GetAttribute("OriginalName") then
				replicatedStorage.Remotes.CommF_:InvokeServer("StoreFruit", child:GetAttribute("OriginalName"), child)
				task.wait(0.1)
			end
		end
	end

	tbl3.Functions.Start = function()
		if bypassTP.Runtime.Bypassing then
			return
		end
		local v2 = fn3()
		local v3 = playerMD.GetHRP()

		if #v2 > 0 and v3 then
			local v4 = v2[1]

			if v4.Name == "Fruit " then
				fn2(v4.Handle.CFrame)
			else
				firetouchinterest(v4.Handle, v3, 1)
				firetouchinterest(v4.Handle, v3, 0)
			end
		elseif #v2 <= 0 then
			task.wait(tonumber(tbl2["Hop Delay"]) or 1.5)

			if v.KaitunFruit.UsingHopApi then
				fn5()
			else
				fn6()
			end
		end
	end

	spawn(function()
		while wait() do
			for k, v2 in next, tbl3.Functions, nil do
				fn(k, v2)
			end
		end
	end)

	spawn(function()
		while wait() do
			local v2 = fn3()

			if #v2 > 0 then
				for k, v3 in pairs(v2) do
					v2[k] = v3.Name
				end

				tbl3.Features.Status["Fruits In Server"]:SetDesc(table.concat(v2, ", "))
			else
				tbl3.Features.Status["Fruits In Server"]:SetDesc("No Fruit Found.")
			end
		end
	end)
end

tbl3.JoinTeam = function()
	if players.Team == nil then
		replicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", v.KaitunFruit.Team)
	end
end

tbl3.Authenticate()
tbl3.JoinTeam()
tbl3.InitModules()
tbl3.InitSettings()
tbl3.LoadLibrary()
tbl3.MakeFunctions()
