-- ez crack skid night hub 😂
-- Deobfuscated by DevAurora Code

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local v = workspace
local localPlayer = Players.LocalPlayer
local genv = type(getgenv) == "function" and getgenv() or _G

if genv.NightPvp and genv.NightPvp.Unload then
	pcall(genv.NightPvp.Unload)
	task.wait(0.25)
end

local tbl = { Name = "Night Hub", Game = "Blox Fruits PvP", Build = "1.0" }
local flag = true
local tbl2 = {}
local tbl3 = {}
local currentCamera = v.CurrentCamera
local mouse = localPlayer:GetMouse()
local gethui_ = rawget(genv, "gethui")
local v2 = nil
local v3 = nil
local n = nil
local unit = nil
local v4 = nil
local position = nil
local position2 = nil
local unit2 = nil
local flag2 = false
local flag3 = false
local flag4 = false

local tbl4 = {
	pickMode = "Smart",
	smartHp = 50,
	part = "Head",
	useFov = true,
	fov = 160,
	maxDist = 1500,
	pred = 0.1,
	speed = false,
	speedValue = 80,
	jumpOn = false,
	jumpValue = 80,
	noclip = false,
	noStun = false,
	moverFilter = "Smart",
	fly = false,
	flyKey = "None",
	flyMode = "Smart",
	engageDist = 8,
	engageEdge = 10,
	retreatHp = 40,
	gankRange = 60,
	autoSkill = false,
	skillKeys = { Z = true, X = true, C = true, V = true },
	skillRange = 60,
	skillHold = 0.1,
	skillGap = 0.35,
	flySpeed = 200,
	flySafe = 180,
	flyDist = 10,
	flyUp = 8,
	kiteDist = 25,
	kiteSway = 6,
	antiAim = false,
	antiAimPower = 200,
	dodge = false,
	dodgeRange = 25,
	dodgeDist = 14,
	dodgeCd = 1.5,
	orbitRadius = 12,
	orbitSpeed = 2.5,
	flyNoclip = true,
	hitbox = false,
	hitboxSize = 12,
	hitboxShow = true,
	autoGun = false,
	gunPick = "Dragonstorm",
	gunRange = 150,
	gunRate = 0.35,
	gunSkills = false,
	gunBack = true,
	escape = false,
	escapeHp = 25,
	escapeUp = 250,
	killNote = true,
	teamCheck = true,
	wallCheck = false,
	skipFriends = false,
	lockKey = "T",
	aimbot = false,
	aimTrigger = "Hold right mouse",
	aimKey = "Q",
	smooth = 0.25,
	silent = false,
	chance = 100,
	aura = false,
	auraAll = true,
	auraRange = 55,
	auraRate = 0.12,
	auraWeapon = "Keep current",
	buso = false,
	ken = false,
	race = false,
	stick = false,
	stickUp = 6,
	stickBack = 3,
	stickRange = 150,
	spectate = false,
	infJump = false,
	antiAfk = true,
	esp = false,
	box = true,
	name = true,
	info = true,
	bar = true,
	hpText = true,
	chams = false,
	tracer = false,
	tracerFrom = "Bottom",
	espDist = 3000,
	espColor = "White",
	teamColor = false,
	showFov = true,
	tgtLine = true,
	lineFrom = "Character",
	tgtMark = true,
	tgtColor = "Red",
}

local tbl5 = {
	White = Color3.fromRGB(240, 240, 240),
	Red = Color3.fromRGB(255, 70, 70),
	Green = Color3.fromRGB(80, 230, 120),
	Blue = Color3.fromRGB(80, 160, 255),
	Yellow = Color3.fromRGB(255, 215, 70),
	Purple = Color3.fromRGB(180, 110, 255),
	Cyan = Color3.fromRGB(70, 220, 230),
}

local tbl6 = { "White", "Red", "Green", "Blue", "Yellow", "Purple", "Cyan" }
Aura = { swings = 0, note = "Off" }
Move = { on = false, clip = {} }
Gun = { shots = 0, note = "Off", aimUntil = 0 }
Fly = { note = "Off", slowUntil = 0, rubber = 0, angle = 0, step = 0 }
Hit = { orig = {} }
Esp = { pool = {} }
UI = {}

bind = function(arg)
	tbl2[#tbl2 + 1] = arg
	return arg
end

spin = function(arg, arg2, arg3)
	task.spawn(function()
		local v5 = nil

		while flag do
			local ok, result, result2 = pcall(arg3)
			local flag5 = not ok and result or result == false and result2 or nil

			if flag5 and flag5 ~= v5 then
				local v6 = warn
				local str = ("! %*: %*"):format(arg, flag5)
				v6(str)
			end

			task.wait(type(arg2) == "function" and arg2() or arg2)
			v5 = flag5
		end
	end)
end

alive = function(arg)
	arg = arg and arg.Character
	local humanoid = arg and arg:FindFirstChildOfClass("Humanoid")
	local humanoidRootPart = arg and arg:FindFirstChild("HumanoidRootPart")
	if not humanoid or not humanoidRootPart or humanoid.Health <= 0 then
		return
	end
	return arg, humanoid, humanoidRootPart
end

friendly = function(arg)
	if tbl4.teamCheck and localPlayer.Team and arg.Team == localPlayer.Team and localPlayer.Team.Name == "Marines" then
		return true
	end
	return tbl4.skipFriends and tbl3[arg.UserId] == true
end

foe = function(arg)
	if arg == localPlayer or friendly(arg) then
		return
	end
	return alive(arg)
end

befriend = function(arg)
	if arg == localPlayer then
		return
	end

	task.spawn(function()
		local ok, result = pcall(localPlayer.IsFriendsWith, localPlayer, arg.UserId)
		tbl3[arg.UserId] = ok and result or nil
	end)
end

keyName = function(arg)
	return typeof(arg) == "EnumItem" and arg.Name or tostring(arg)
end

keyDown = function(arg)
	local ok, result = pcall(function()
		return Enum.KeyCode[arg]
	end)

	return ok and UserInputService:IsKeyDown(result)
end

local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude

seen = function(arg, arg2)
	raycastParams.FilterDescendantsInstances = { localPlayer.Character, arg }
	local position3 = currentCamera.CFrame.Position
	return v:Raycast(position3, arg2.Position - position3, raycastParams) == nil
end

pick = function()
	local v5, v6, v7 = alive(localPlayer)
	if not v7 then
		return
	end

	if v4 then
		local v8, v9, v10 = foe(v4)
		if v8 then
			return v4, v8:FindFirstChild(tbl4.part) or v10
		end
		v4 = nil
	end

	local mouseLocation = UserInputService:GetMouseLocation()
	local v8 = nil
	local v9 = nil
	local v10 = nil
	local v11 = nil

	for _, player in ipairs(Players:GetPlayers()) do
		local v12, v13, v14 = foe(player)

		if v12 then
			local v15 = v12:FindFirstChild(tbl4.part) or v14
			local magnitude = (v14.Position - v7.Position).Magnitude
			local v16, magnitude2 = currentCamera:WorldToViewportPoint(v15.Position)
			magnitude2 = magnitude2 and (Vector2.new(v16.X, v16.Y) - mouseLocation).Magnitude or math.huge
			local flag5 = magnitude <= tbl4.maxDist and (not tbl4.useFov or magnitude2 <= tbl4.fov or tbl4.fly and player == v2)
			local health

			if tbl4.pickMode == "Smart" then
				health = smart(magnitude, v13, magnitude2)
			else
				health = tbl4.pickMode == "Nearest cursor" and magnitude2 or tbl4.pickMode == "Lowest health" and v13.Health or magnitude
				flag5 = flag5 and health < math.huge
			end

			if flag5 and (not tbl4.wallCheck or seen(v12, v15)) then
				if player == v2 then
					v8 = health
				end

				if not v9 or health < v9 then
					v9 = health
					v10 = player
					v11 = v15
				end
			end
		end
	end

	if tbl4.pickMode == "Smart" and v8 and v10 ~= v2 and v9 > v8 - 0.08 then
		local v12, v13, v14 = alive(v2)
		return v2, v12:FindFirstChild(tbl4.part) or v14
	end
	return v10, v11
end

smart = function(arg, arg2, arg3)
	local n2 = tbl4.smartHp / 100 * 0.85
	local n3 = 0.85 - n2
	local n4 = arg2.MaxHealth > 0 and arg2.Health / arg2.MaxHealth or 1
	local n5 = arg3 == math.huge and 1

	if not n5 then
		n5 = math.clamp(arg3 / (tbl4.useFov and tbl4.fov or 800), 0, 1)
	end

	local n6 = n3 * math.clamp(arg / tbl4.maxDist, 0, 1) + n2 * n4 + 0.15 * n5

	if n4 <= 0.25 then
		n6 -= 0.2
	end

	return n6
end

triggered = function()
	if tbl4.aimTrigger == "Always" then
		return true
	end

	if tbl4.aimTrigger == "Hold key" then
		return keyDown(tbl4.aimKey)
	end
	return UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
end

dot = function(arg, arg2)
	return arg.X * arg2.X + arg.Y * arg2.Y + arg.Z * arg2.Z
end

bend = function(arg)
	local kind = typeof(arg)

	if kind == "Vector3" then
		if (arg - position2).Magnitude <= 12 then
			return n
		end

		if math.abs(arg.Magnitude - 1) < 0.01 and dot(arg, unit2) > 0.98 then
			return unit
		end
	elseif kind == "CFrame" then
		local position3 = arg.Position
		if (position3 - position2).Magnitude <= 12 then
			return CFrame.new(n)
		end

		if (position3 - position).Magnitude < 15 and dot(arg.LookVector, unit2) > 0.98 then
			return CFrame.lookAt(position3, n)
		end
	end

	return arg
end

hook = function()
	if flag3 then
		return true
	end

	if type(hookmetamethod) ~= "function" or type(getnamecallmethod) ~= "function" then
		return false, "No hookmetamethod"
	end

	local fn = type(newcclosure) == "function" and newcclosure or function(arg)
		return arg
	end

	local v5 = nil
	local v6 = nil

	local function fn2(d, ...)
		if flag2 and not checkcaller() then
		  local j = getnamecallmethod();

		  if(j == "FireServer" or j == "InvokeServer") and math.random(100) <= tbl4.chance then
		    local u = table.pack(...);

		    for Z = 1, u.n, 1 do
		      u[Z] = bend(u[Z]);
		    end;

		    if setnamecallmethod then
		      setnamecallmethod(j);
		    end;

		    return v5(d, table.unpack(u, 1, u.n));
		  end;
		end;

		return v5(d, ...);
	end

	v5 = hookmetamethod(game, "__namecall", fn(fn2))

	v6 = hookmetamethod(game, "__index", fn(function(d, j)
		if flag2 and rawequal(d, mouse) and not checkcaller() then
		  if j == "Hit" then
		    return CFrame.new(n);
		  end;

		  if j == "Target" then
		    return v3;
		  end;
		end;

		if Move.on and(rawequal(d, Move.hum)) and not checkcaller() then
		  local u = Move.real[j];
		  if u ~= nil then
		    return u;
		  end;
		end;

		return v6(d, j);
	end))

	local v7 = nil

	local function fn3(d, j, u)
		if Move.watch and not checkcaller() then
		  if rawequal(d, Move.hum) then
		    local Z = Move.forced[j];
		    if Z ~= nil then
		      Move.real[j] = u;
		      return v7(d, j, Z);
		    end;

		    if tbl4.noStun and(stunWrite(j, u)) then
		      return;
		    end;
		  elseif tbl4.noStun and(rawequal(d, Move.root)) and j == "Anchored" and u == true then
		    return;
		  end;
		end;

		return v7(d, j, u);
	end

	v7 = hookmetamethod(game, "__newindex", fn(fn3))
	flag3 = true
	return true
end

jumpHeight = function(arg)
	return arg * arg / 2 * v.Gravity
end

local tbl7 = {
	Enum.HumanoidStateType.Ragdoll,
	Enum.HumanoidStateType.FallingDown,
	Enum.HumanoidStateType.PlatformStanding,
}

stunWrite = function(arg, arg2)
	if arg == "WalkSpeed" or arg == "JumpPower" or arg == "JumpHeight" then
		return type(arg2) == "number" and arg2 <= 1
	end

	if arg == "PlatformStand" then
		return arg2 == true
	end

	if arg == "AutoRotate" then
		return arg2 == false
	end
	return false
end

unstun = function(arg, stunHum, arg2)
	local flag5 = tbl4.noStun and stunHum ~= nil

	if flag5 and (not Move.stunOff or stunHum ~= Move.stunHum) then
		Move.stunSaved = {}

		for _, v5 in ipairs(tbl7) do
			Move.stunSaved[v5] = stunHum:GetStateEnabled(v5)
			stunHum:SetStateEnabled(v5, false)
		end

		local v5 = Move
		Move.stunOff = true
		v5.stunHum = stunHum
	elseif not flag5 and Move.stunOff then
		local stunHum2 = Move.stunHum

		if stunHum2 and stunHum2.Parent then
			local v5 = pairs
			local stunSaved = Move.stunSaved or {}

			for k, v6 in v5(stunSaved) do
				stunHum2:SetStateEnabled(k, v6)
			end
		end

		local v5 = Move
		Move.stunOff = false
		v5.stunHum = nil
	end

	if not flag5 then
		return
	end

	if stunHum.PlatformStand then
		stunHum.PlatformStand = false
	end

	if not stunHum.AutoRotate then
		stunHum.AutoRotate = true
	end

	if arg2.Anchored then
		arg2.Anchored = false
	end

	local stun = arg:FindFirstChild("Stun")

	if stun and stun:IsA("ValueBase") and type(stun.Value) == "number" and stun.Value ~= 0 then
		stun.Value = 0
	end

	local busy = arg:FindFirstChild("Busy")

	if busy and busy:IsA("BoolValue") and busy.Value then
		busy.Value = false
	end
end

movement = function()
	local v5, v6, v7 = alive(localPlayer)
	Move.root = v7
	pcall(unstun, v5, v6, v7)
	Move.watch = tbl4.noStun or Move.on

	if v6 ~= Move.hum then
		Move.hum = v6
		local v8 = Move
		Move.real = {}
		v8.forced = {}
	end

	Move.real = Move.real or {}
	Move.forced = Move.forced or {}
	if not v6 then
		Move.on = false
		return
	end
	local forced = {}

	if tbl4.speed then
		forced.WalkSpeed = tbl4.speedValue
	end

	if tbl4.jumpOn then
		forced.JumpPower = tbl4.jumpValue
		forced.JumpHeight = jumpHeight(tbl4.jumpValue)
	end

	for k, v8 in pairs(Move.real) do
		if forced[k] == nil then
			v6[k] = v8
			Move.real[k] = nil
		end
	end

	for k, v8 in pairs(forced) do
		if Move.real[k] == nil then
			Move.real[k] = v6[k]
		end

		if v6[k] ~= v8 then
			v6[k] = v8
		end
	end

	Move.forced = forced
	Move.on = next(forced) ~= nil
	Move.watch = tbl4.noStun or Move.on
end

noclip = function()
	local character = localPlayer.Character
	if not character then
		return
	end
	local noclip_ = tbl4.noclip or tbl4.fly and tbl4.flyNoclip and v2 ~= nil

	for _, descendant in ipairs(character:GetDescendants()) do
		if descendant:IsA("BasePart") then
			if noclip_ then
				if Move.clip[descendant] == nil then
					Move.clip[descendant] = descendant.CanCollide
				end

				descendant.CanCollide = false
			elseif Move.clip[descendant] ~= nil then
				descendant.CanCollide = Move.clip[descendant]
				Move.clip[descendant] = nil
			end
		end
	end

	if not noclip_ then
		table.clear(Move.clip)
	end
end

escape = function()
	local v5, v6, v7 = alive(localPlayer)
	if not tbl4.escape or not v6 then
		return
	end
	local n2 = v6.MaxHealth > 0 and v6.Health / v6.MaxHealth * 100 or 100
	if tbl4.escapeHp < n2 then
		Move.fled = false
		return
	end

	if Move.fled then
		return
	end
	Move.fled = true
	v7.CFrame = v7.CFrame + Vector3.new(0, tbl4.escapeUp, 0)
	v7.AssemblyLinearVelocity = Vector3.zero

	if UI.note then
		local escapeUp = tbl4.escapeUp
		UI.note(("HP %*%%, escaped %* studs up"):format(math.floor(n2), escapeUp), "warn")
	end
end

findGun = function(arg)
	local flag5 = tbl4.gunPick == "Any gun"

	local function fn(arg2)
		if not arg2:IsA("Tool") then
			return false
		end

		if flag5 then
			return arg2.ToolTip == "Gun"
		end
		return string.find(string.lower(string.gsub(arg2.Name, "%s", "")), "dragonstorm", 1, true) ~= nil
	end

	for _, child in ipairs(arg:GetChildren()) do
		if fn(child) then
			return child, true
		end
	end

	for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
		if fn(child) then
			return child, false
		end
	end
end

press = function(arg)
	local ok, result = pcall(game.GetService, game, "VirtualInputManager")
	if not ok or not result then
		return
	end

	pcall(function()
		result:SendKeyEvent(true, Enum.KeyCode[arg], false, game)
		task.wait(0.06)
		result:SendKeyEvent(false, Enum.KeyCode[arg], false, game)
	end)
end

shoot = function()
	local v5, v6, v7 = alive(localPlayer)
	if not v5 then
		return false, "No character"
	end
	local v8, v9, v10 = alive(v2)
	if not v10 then
		return false, "No target"
	end

	if tbl4.gunRange < (v10.Position - v7.Position).Magnitude then
		return false, "Target out of range"
	end
	local v11, v12 = findGun(v5)
	if not v11 then
		return false, tbl4.gunPick == "Any gun" and "No gun in backpack" or "No Dragonstorm in backpack"
	end
	local v13, v14 = hook()
	if not v13 then
		return false, v14
	end
	local tool = v5:FindFirstChildOfClass("Tool")

	if not v12 then
		v6:EquipTool(v11)
		task.wait(0.12)
	end

	Gun.aimUntil = os.clock() + (tbl4.gunSkills and 0.9 or 0.4)
	v11:Activate()

	if tbl4.gunSkills then
		press("Z")
		press("X")
	end

	local v15 = Gun
	v15.shots = v15.shots + 1

	if tbl4.gunBack and tool and tool ~= v11 then
		task.delay(0.3, function()
			if tool.Parent == localPlayer.Backpack and alive(localPlayer) then
				v6:EquipTool(tool)
			end
		end)
	end

	return true, (("Shots %*"):format(Gun.shots))
end

net = function()
	local modules = ReplicatedStorage:FindFirstChild("Modules")
	modules = modules and modules:FindFirstChild("Net")
	return modules and modules:FindFirstChild("RE/RegisterAttack"), modules and modules:FindFirstChild("RE/RegisterHit")
end

remote = function(arg)
	local remotes = ReplicatedStorage:FindFirstChild("Remotes")
	return remotes and remotes:FindFirstChild(arg)
end

local tbl8 = { Melee = true, Sword = true }

arm = function(arg, arg2)
	local tool = arg:FindFirstChildOfClass("Tool")

	if tbl4.auraWeapon == "Keep current" then
		if tool and tbl8[tool.ToolTip] then
			return tool
		end
		return nil, "Hold a melee or sword"
	end

	if tool and tool.ToolTip == tbl4.auraWeapon then
		return tool
	end

	for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
		if child:IsA("Tool") and child.ToolTip == tbl4.auraWeapon then
			arg2:EquipTool(child)
			return child
		end
	end

	return nil, (("No %* in backpack"):format(tbl4.auraWeapon))
end

swing = function()
	local v5, v6, v7 = alive(localPlayer)
	if not v5 then
		return false, "No character"
	end
	local v8, v9 = net()
	if not v8 or not v9 then
		return false, "No combat api"
	end
	local tbl9 = {}

	for _, player in ipairs(Players:GetPlayers()) do
		local v10, v11, v12 = foe(player)

		if v10 and (tbl4.auraAll or player == v2) and (v12.Position - v7.Position).Magnitude <= tbl4.auraRange then
			local n2 = #tbl9 + 1
			local tbl10 = {}
			local head = v10:FindFirstChild("Head") or v12
			tbl10[1] = v10
			tbl10[2] = head
			tbl9[n2] = tbl10
		end
	end

	if #tbl9 == 0 then
		return false, "No one in range"
	end
	local v10, v11 = arm(v5, v6)
	if v11 then
		return false, v11
	end
	v8:FireServer(0)
	v9:FireServer(tbl9[1][2], tbl9)
	local v12 = Aura
	v12.swings = v12.swings + 1
	return true, (("Hit %*"):format(#tbl9))
end

buso = function()
	local v5 = alive(localPlayer)
	if not v5 or v5:FindFirstChild("HasBuso") then
		return
	end
	local CommF_ = remote("CommF_")
	if not CommF_ then
		return false, "No CommF_"
	end
	CommF_:InvokeServer("Buso")
end

ken = function()
	if not alive(localPlayer) then
		return
	end
	local CommE = remote("CommE")
	if not CommE then
		return false, "No CommE"
	end
	CommE:FireServer("Ken", true)
end

race = function()
	if not alive(localPlayer) then
		return false, "No character"
	end
	local CommE = remote("CommE")
	if not CommE then
		return false, "No CommE"
	end
	CommE:FireServer("ActivateAbility")
	return true
end

local tbl9 = {
	BodyVelocity = true,
	BodyPosition = true,
	BodyGyro = true,
	BodyForce = true,
	BodyAngularVelocity = true,
	BodyThrust = true,
	RocketPropulsion = true,
	LinearVelocity = true,
	AlignPosition = true,
	AlignOrientation = true,
	VectorForce = true,
	AngularVelocity = true,
}

stunMover = function(arg, arg2)
	if not tbl9[arg.ClassName] or arg:GetAttribute("NightPvp") then
		return false
	end

	if tbl4.moverFilter == "Remove all" or not arg2 then
		return true
	end
	local lookVector = arg2.CFrame.LookVector
	local velocity = arg:IsA("BodyVelocity") and arg.Velocity or arg:IsA("LinearVelocity") and arg.VectorVelocity or nil

	if velocity then
		if velocity.Magnitude < 1 then
			return true
		end
		return velocity.Unit:Dot(lookVector) < 0.3
	end

	local position3 = arg:IsA("BodyPosition") and arg.Position or arg:IsA("AlignPosition") and arg.Position or nil
	if position3 then
		local n2 = position3 - arg2.Position
		return n2.Magnitude < 4 or n2.Unit:Dot(lookVector) < 0.3
	end
	return true
end

watchMovers = function(arg)
	if Move.moverBond then
		Move.moverBond:Disconnect()
	end

	if not arg then
		return
	end

	Move.moverBond = bind(arg.DescendantAdded:Connect(function(descendant)
		if not tbl4.noStun or not tbl9[descendant.ClassName] then
			return
		end

		task.defer(function()
			if descendant.Parent and stunMover(descendant, arg:FindFirstChild("HumanoidRootPart")) then
				descendant:Destroy()
			end
		end)
	end))
end

sweepMovers = function()
	if not tbl4.noStun then
		return
	end
	local character = localPlayer.Character
	local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
	if not humanoidRootPart then
		return
	end

	for _, descendant in ipairs(character:GetDescendants()) do
		if tbl9[descendant.ClassName] and stunMover(descendant, humanoidRootPart) then
			descendant:Destroy()
		end
	end
end

flyGoal = function(arg, arg2)
	local vector = Vector3.new(0, tbl4.flyUp, 0)

	if tbl4.flyMode == "Smart" then
		local v5, v6 = alive(localPlayer)
		local v7, v8 = alive(v2)
		local n2 = v6 and v6.MaxHealth > 0 and v6.Health / v6.MaxHealth or 1
		local n3 = v8 and v8.MaxHealth > 0 and v8.Health / v8.MaxHealth or 1
		local v9 = Fly
		local flag5 = n2 * 100 >= tbl4.retreatHp

		if flag5 then
			flag5 = (Fly.crowd or 0) <= 1
		end

		v9.push = flag5 and (n2 - n3) * 100 >= -tbl4.engageEdge
		local v10 = Fly
		v10.angle = v10.angle + arg2
		local n4 = -arg.CFrame.LookVector
		local vector2 = Vector3.new(n4.X, 0, n4.Z)
		local unit3 = vector2.Magnitude > 0.1 and vector2.Unit or Vector3.new(0, 0, 1)
		local vector3 = Vector3.new(-unit3.Z, 0, unit3.X)
		if Fly.push then
			return arg.Position + unit3 * tbl4.engageDist + Vector3.new(0, 2, 0)
		end
		local kiteSway = tbl4.kiteSway
		return arg.Position + unit3 * tbl4.kiteDist + vector3 * math.sin(Fly.angle * 2) * kiteSway + vector
	end

	if tbl4.flyMode == "Kite" then
		local v5 = Fly
		v5.angle = v5.angle + arg2
		local n2 = -arg.CFrame.LookVector
		local vector2 = Vector3.new(n2.X, 0, n2.Z)
		local unit3 = vector2.Magnitude > 0.1 and vector2.Unit or Vector3.new(0, 0, 1)
		local kiteSway = tbl4.kiteSway
		return arg.Position + unit3 * tbl4.kiteDist + Vector3.new(-unit3.Z, 0, unit3.X) * math.sin(Fly.angle * 2) * kiteSway + vector
	end

	if tbl4.flyMode == "Orbit" then
		local v5 = Fly
		v5.angle = v5.angle + tbl4.orbitSpeed * arg2
		local sin = math.sin
		local angle = Fly.angle
		local orbitRadius = tbl4.orbitRadius
		return arg.Position + Vector3.new(math.cos(Fly.angle), 0, sin(angle)) * orbitRadius + vector
	end

	local assemblyLinearVelocity = arg.AssemblyLinearVelocity
	local vector2 = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)
	if vector2.Magnitude > 2 then
		return arg.Position + vector2.Unit * tbl4.flyDist + vector
	end
	return arg.Position - arg.CFrame.LookVector * tbl4.flyDist + vector
end

fly = function(arg)
	if not tbl4.fly then
		local v5 = Fly
		Fly.expect = nil
		v5.note = "Off"
		return
	end

	local v5, v6, note = alive(localPlayer)
	local v7, v8, v9 = alive(v2)

	if not note or not v9 then
		Fly.expect = nil
		local v10 = Fly
		note = note and "No target" or "No character"
		v10.note = note
		return
	end

	if Fly.expect and (note.Position - Fly.expect).Magnitude > math.max(8, Fly.step * 3) then
		Fly.slowUntil = os.clock() + 6
		local v10 = Fly
		v10.rubber = v10.rubber + 1
	end

	local slowUntil = Fly.slowUntil
	local flySafe = os.clock() < slowUntil and tbl4.flySafe or tbl4.flySpeed
	local position3 = note.Position
	local n2 = flyGoal(v9, arg) - position3
	local step = math.min(n2.Magnitude, flySafe * arg)
	local position4 = n2.Magnitude > 0.05 and note.Position + n2.Unit * step or note.Position
	note.CFrame = CFrame.lookAt(position4, Vector3.new(v9.Position.X, position4.Y, v9.Position.Z))
	note.AssemblyLinearVelocity = Vector3.zero
	note.AssemblyAngularVelocity = Vector3.zero
	local v10 = Fly
	Fly.expect = position4
	v10.step = step
	local str = tbl4.flyMode == "Smart" and (Fly.push and "ATTACK  |  " or "KITE  |  ") or ""
	local rubber = Fly.rubber
	Fly.note = ("%*%* studs/s  |  %* away  |  pulled back %*x"):format(str, flySafe, math.floor(n2.Magnitude), rubber)
end

antiAimBeat = function()
	if not tbl4.antiAim then
		return
	end
	local v5, v6, v7 = alive(localPlayer)
	if not v7 then
		return
	end
	Fly.realVel = v7.AssemblyLinearVelocity
	local antiAimPower = tbl4.antiAimPower
	local random = math.random
	v7.AssemblyLinearVelocity = Vector3.new(math.random(-antiAimPower, antiAimPower), math.random(-antiAimPower, antiAimPower) * 0.3, random(-antiAimPower, antiAimPower))
end

antiAimStep = function()
	if not Fly.realVel then
		return
	end
	local v5, v6, v7 = alive(localPlayer)

	if v7 then
		v7.AssemblyLinearVelocity = Fly.realVel
	end

	Fly.realVel = nil
end

dodge = function()
	local flag5 = not tbl4.dodge

	if not flag5 then
		flag5 = os.clock() < (Move.dodgeAt or 0)
	end

	if flag5 then
		return
	end
	local v5, v6, v7 = alive(localPlayer)
	if not v7 then
		return
	end

	for _, player in ipairs(Players:GetPlayers()) do
		local v8, v9, v10 = foe(player)

		if v8 then
			local n2 = v7.Position - v10.Position
			local magnitude = n2.Magnitude

			if magnitude > 0.1 and magnitude < tbl4.dodgeRange and v10.CFrame.LookVector:Dot(n2.Unit) > 0.85 then
				local vector = Vector3.new(n2.X, 0, n2.Z)
				local unit3 = vector.Magnitude > 0.1 and Vector3.new(-vector.Z, 0, vector.X).Unit or Vector3.new(1, 0, 0)

				if math.random() < 0.5 then
					unit3 = -unit3
				end

				v7.CFrame = v7.CFrame + unit3 * tbl4.dodgeDist
				Fly.expect = nil
				local dodgeCd = tbl4.dodgeCd
				Move.dodgeAt = os.clock() + dodgeCd
				return
			end
		end
	end
end

crowd = function()
	local v5, v6, v7 = alive(localPlayer)
	if not v7 then
		Fly.crowd = 0
		return
	end
	local crowd_ = 0

	for _, player in ipairs(Players:GetPlayers()) do
		local v8, v9, v10 = foe(player)

		if v8 and (v10.Position - v7.Position).Magnitude <= tbl4.gankRange then
			crowd_ += 1
		end
	end

	local flag5 = crowd_ >= 2

	if flag5 then
		flag5 = (Fly.crowd or 0) < 2
	end

	if flag5 and UI.note then
		UI.note(("%* enemies around you, backing off"):format(crowd_), "warn")
	end

	Fly.crowd = crowd_
end

hold = function(arg, arg2)
	local ok, result = pcall(game.GetService, game, "VirtualInputManager")
	if not ok or not result then
		return
	end

	pcall(function()
		result:SendKeyEvent(true, Enum.KeyCode[arg], false, game)
		task.wait(math.max(arg2, 0.03))
		result:SendKeyEvent(false, Enum.KeyCode[arg], false, game)
	end)
end

skills = function()
	local v5, v6, v7 = alive(localPlayer)
	if not v5 then
		return false, "No character"
	end
	local v8, v9, v10 = alive(v2)
	if not v10 then
		return false, "No target"
	end

	if tbl4.skillRange < (v10.Position - v7.Position).Magnitude then
		return false, "Target out of range"
	end
	local v11, v12 = hook()
	if not v11 then
		return false, v12
	end

	for _, v13 in ipairs({ "Z", "X", "C", "V", "F" }) do
		if not (not tbl4.autoSkill or not alive(v2)) then
			if tbl4.skillKeys[v13] then
				local skillHold = tbl4.skillHold
				Gun.aimUntil = os.clock() + skillHold + 0.5
				hold(v13, tbl4.skillHold)
				task.wait(tbl4.skillGap)
			end

			continue
		end

		break
	end
end

hitboxes = function()
	for _, player in ipairs(Players:GetPlayers()) do
		local humanoidRootPart = player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart")

		if humanoidRootPart then
			local v5 = Hit.orig[humanoidRootPart]

			if tbl4.hitbox and foe(player) then
				if not v5 then
					Hit.orig[humanoidRootPart] = { humanoidRootPart.Size, humanoidRootPart.Transparency, humanoidRootPart.CanCollide }
				end

				local size = Vector3.one * tbl4.hitboxSize

				if humanoidRootPart.Size ~= size then
					humanoidRootPart.Size = size
				end

				humanoidRootPart.Transparency = tbl4.hitboxShow and 0.8 or 1
				humanoidRootPart.CanCollide = false
			elseif v5 then
				local v6 = v5[1]
				local v7 = v5[2]
				local v8 = v5[3]
				humanoidRootPart.Size = v6
				humanoidRootPart.Transparency = v7
				humanoidRootPart.CanCollide = v8
				Hit.orig[humanoidRootPart] = nil
			end
		end
	end

	for k in pairs(Hit.orig) do
		if not k.Parent then
			Hit.orig[k] = nil
		end
	end
end

stick = function()
	if not tbl4.stick or not v2 or tbl4.fly then
		return
	end
	local v5, v6, v7 = alive(localPlayer)
	local v8, v9, v10 = alive(v2)
	if not v7 or not v10 or (v10.Position - v7.Position).Magnitude > tbl4.stickRange then
		return
	end
	local n2 = v10.Position - v10.CFrame.LookVector * tbl4.stickBack + Vector3.new(0, tbl4.stickUp, 0)
	v7.CFrame = CFrame.lookAt(n2, Vector3.new(v10.Position.X, n2.Y, v10.Position.Z))
	v7.AssemblyLinearVelocity = Vector3.zero
end

antiAfk = function()
	if type(getconnections) ~= "function" then
		return false, "No getconnections"
	end

	for _, v5 in ipairs(getconnections(localPlayer.Idled)) do
		pcall(function()
			if tbl4.antiAfk then
				v5:Disable()
			else
				v5:Enable()
			end
		end)
	end

	return true
end

local flag5 = type(Drawing) == "table" and type(Drawing.new) == "function"

draw = function(arg, arg2)
	local v5 = Drawing.new(arg)

	for k, v6 in pairs(arg2) do
		v5[k] = v6
	end

	return v5
end

kit = function(arg)
	local v5 = Esp.pool[arg]
	if v5 then
		return v5
	end

	local tbl10 = {
		edge = draw("Square", { Thickness = 3, Filled = false, Color = Color3.new(), Visible = false }),
		box = draw("Square", { Thickness = 1, Filled = false, Visible = false }),
		name = draw("Text", { Size = 14, Center = true, Outline = true, Visible = false }),
		info = draw("Text", {
			Size = 13,
			Center = true,
			Outline = true,
			Color = Color3.fromRGB(210, 210, 210),
			Visible = false,
		}),
		back = draw("Square", { Filled = true, Color = Color3.new(), Visible = false }),
		fill = draw("Square", { Filled = true, Visible = false }),
		hp = draw("Text", { Size = 12, Outline = true, Visible = false }),
		line = draw("Line", { Thickness = 1, Visible = false }),
	}

	Esp.pool[arg] = tbl10
	return tbl10
end

blank = function(arg)
	for k, v5 in pairs(arg) do
		if k ~= "cham" then
			v5.Visible = false
		end
	end
end

hide = function(arg)
	blank(arg)

	if arg.cham then
		arg.cham.Enabled = false
	end
end

drop = function(arg)
	local v5 = Esp.pool[arg]
	if not v5 then
		return
	end

	for _, v6 in pairs(v5) do
		pcall(function()
			v6:Destroy()
		end)
	end

	Esp.pool[arg] = nil
end

tintOf = function(arg)
	if arg == v2 and tbl4.tgtMark then
		return tbl5[tbl4.tgtColor]
	end

	if tbl4.teamColor and arg.Team then
		return arg.TeamColor.Color
	end
	return tbl5[tbl4.espColor]
end

lore = function(arg, arg2)
	local data = arg:FindFirstChild("Data")
	local level = data and data:FindFirstChild("Level")
	data = data and data:FindFirstChild("DevilFruit")
	local tbl10 = { (("%*m"):format(math.floor(arg2))) }

	if level then
		local insert = table.insert
		local str = ("Lv %*"):format(level.Value)
		insert(tbl10, 1, str)
	end

	if data and data.Value ~= "" then
		tbl10[#tbl10 + 1] = data.Value
	end

	return table.concat(tbl10, " | ")
end

cham = function(arg, parent, fillColor)
	if not tbl4.chams then
		if arg.cham then
			arg.cham.Enabled = false
		end

		return
	end

	if not arg.cham or arg.cham.Parent ~= parent then
		if arg.cham then
			arg.cham:Destroy()
		end

		local highlight = Instance.new("Highlight")
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.FillTransparency = 0.6
		highlight.Parent = parent
		arg.cham = highlight
	end

	arg.cham.Enabled = true
	local cham_ = arg.cham
	arg.cham.FillColor = fillColor
	cham_.OutlineColor = fillColor
end

paint = function(arg, arg2, arg3, arg4)
	local v5 = Esp.pool[arg]

	if not tbl4.esp then
		if v5 then
			hide(v5)
		end

		return
	end

	local v6 = kit(arg)
	local v7, v8, v9 = alive(arg)
	local magnitude = v7 and (v9.Position - arg2).Magnitude or math.huge
	if tbl4.espDist < magnitude then
		return hide(v6)
	end
	local v10 = tintOf(arg)
	cham(v6, v7, v10)
	local v11, v12 = currentCamera:WorldToViewportPoint(v9.Position + Vector3.new(0, 3, 0))
	local v13, v14 = currentCamera:WorldToViewportPoint(v9.Position - Vector3.new(0, 3.5, 0))
	local flag6 = v11.Z <= 0

	if not flag6 then
		flag6 = not (v12 or v14)
	end

	if flag6 then
		return blank(v6)
	end
	local n2 = math.max(v13.Y - v11.Y, 6)
	local n3 = n2 * 0.6
	local n4 = v11.X - n3 / 2
	local y = v11.Y
	local edge = v6.edge
	local box = tbl4.box
	v6.box.Visible = tbl4.box
	edge.Visible = box
	local box2 = v6.box
	local box3 = v6.box
	local box4 = v6.box
	local vector2 = Vector2.new(n3, n2)
	local vector22 = Vector2.new(n4, y)
	box2.Size = vector2
	box3.Position = vector22
	box4.Color = v10
	local edge2 = v6.edge
	local position3 = v6.box.Position
	v6.edge.Size = v6.box.Size
	edge2.Position = position3
	v6.name.Visible = tbl4.name
	v6.name.Text = arg == v2 and ("[ %* ]"):format(arg.DisplayName) or arg.DisplayName
	local name = v6.name
	v6.name.Position = Vector2.new(v11.X, y - 17)
	name.Color = v10
	v6.info.Visible = tbl4.info
	v6.info.Text = lore(arg, magnitude)
	v6.info.Position = Vector2.new(v11.X, y + n2 + 2)
	local n5 = math.clamp(v8.Health / math.max(v8.MaxHealth, 1), 0, 1)
	local v15 = Color3.fromRGB(255, 60, 60):Lerp(Color3.fromRGB(80, 230, 120), n5)
	local fill = v6.fill
	local bar = tbl4.bar
	v6.back.Visible = tbl4.bar
	fill.Visible = bar
	local back = v6.back
	local back2 = v6.back
	local vector23 = Vector2.new(n4 - 6, y - 1)
	local vector24 = Vector2.new(4, n2 + 2)
	back.Position = vector23
	back2.Size = vector24
	local fill2 = v6.fill
	local fill3 = v6.fill
	local fill4 = v6.fill
	local vector25 = Vector2.new(n4 - 5, y + n2 * (1 - n5))
	local vector26 = Vector2.new(2, n2 * n5)
	fill2.Position = vector25
	fill3.Size = vector26
	fill4.Color = v15
	v6.hp.Visible = tbl4.hpText
	v6.hp.Text = ("%*"):format(math.floor(v8.Health))
	local hp = v6.hp
	v6.hp.Position = Vector2.new(n4 - 10 - v6.hp.TextBounds.X, y + n2 * (1 - n5) - 6)
	hp.Color = v15
	v6.line.Visible = tbl4.tracer
	v6.line.From = tbl4.tracerFrom == "Center" and arg3 / 2 or tbl4.tracerFrom == "Mouse" and arg4 or Vector2.new(arg3.X / 2, arg3.Y)
	local line = v6.line
	v6.line.To = Vector2.new(v11.X, v13.Y)
	line.Color = v10
end

aimLine = function(arg, arg2, from)
	local tl = Esp.tl
	local mark = Esp.mark
	tl.Visible = false
	mark.Visible = false
	local flag6 = not v3

	if not flag6 then
		flag6 = not (tbl4.esp or tbl4.aimbot or tbl4.silent or tbl4.aura or v4)
	end

	if flag6 then
		return
	end
	local v5, v6 = currentCamera:WorldToViewportPoint(v3.Position)
	if not v6 then
		return
	end
	local vector2 = Vector2.new(v5.X, v5.Y)

	if tbl4.lineFrom == "Character" and arg then
		local v7 = currentCamera:WorldToViewportPoint(arg.Position)
		from = Vector2.new(v7.X, v7.Y)
	elseif tbl4.lineFrom == "Bottom" then
		from = Vector2.new(arg2.X / 2, arg2.Y)
	end

	local v7 = tbl5[tbl4.tgtColor]
	tl.Visible = tbl4.tgtLine
	tl.From = from
	tl.To = vector2
	tl.Color = v7
	local v8 = tbl5[tbl4.tgtColor]
	mark.Visible = tbl4.tgtMark
	mark.Position = vector2
	mark.Color = v8
end

Esp.step = function()
	if not flag5 then
		return
	end
	local viewportSize = currentCamera.ViewportSize
	local mouseLocation = UserInputService:GetMouseLocation()
	local v5, v6, v7 = alive(localPlayer)
	local position3 = v7 and v7.Position or currentCamera.CFrame.Position

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= localPlayer then
			paint(player, position3, viewportSize, mouseLocation)
		end
	end

	Esp.fov.Visible = tbl4.showFov and tbl4.useFov and (tbl4.aimbot or tbl4.silent)
	local fov = Esp.fov
	local fov2 = tbl4.fov
	Esp.fov.Position = mouseLocation
	fov.Radius = fov2
	aimLine(v7, viewportSize, mouseLocation)
end

Esp.clear = function()
	for k in pairs(Esp.pool) do
		drop(k)
	end

	for _, v5 in ipairs({ "fov", "tl", "mark" }) do
		if Esp[v5] then
			pcall(function()
				Esp[v5]:Destroy()
			end)
		end

		Esp[v5] = nil
	end
end

if flag5 then
	Esp.fov = draw("Circle", {
		Thickness = 1,
		NumSides = 64,
		Filled = false,
		Transparency = 0.7,
		Color = Color3.new(1, 1, 1),
		Visible = false,
	})

	Esp.tl = draw("Line", { Thickness = 2, Visible = false })
	Esp.mark = draw("Circle", { Thickness = 2, NumSides = 24, Radius = 8, Filled = false, Visible = false })
end

frame = function(arg)
	currentCamera = v.CurrentCamera
	local v5, v6, v7 = alive(localPlayer)
	position = v7 and v7.Position
	position2 = mouse.Hit.Position
	unit2 = position and (position2 - position).Unit
	local v8, v9 = pick()
	v2 = v8
	v3 = v9
	flag2 = false
	n = v3 and v3.Position + v3.AssemblyLinearVelocity * tbl4.pred
	unit = n and position and (n - position).Unit
	local silent = tbl4.silent

	if not silent then
		local aimUntil = Gun.aimUntil
		silent = os.clock() < aimUntil
	end

	flag2 = silent and flag3 and unit ~= nil

	if v2 ~= Move.lastTgt then
		local lastTgt = Move.lastTgt
		Move.lastTgt = v2
		local character = lastTgt and lastTgt.Character
		character = character and character:FindFirstChildOfClass("Humanoid")

		if tbl4.killNote and character and character.Health <= 0 and UI.note then
			UI.note(("Killed %*"):format(lastTgt.DisplayName), "good")
		end
	end

	if tbl4.aimbot and n and triggered() then
		local n2 = 1 - tbl4.smooth ^ (arg * 60)
		currentCamera.CFrame = currentCamera.CFrame:Lerp(CFrame.lookAt(currentCamera.CFrame.Position, n), n2)
	end

	local v10, v11 = alive(v2)

	if tbl4.spectate and v11 then
		if currentCamera.CameraSubject ~= v11 then
			currentCamera.CameraSubject = v11
		end

		flag4 = true
	elseif flag4 and v6 then
		currentCamera.CameraSubject = v6
		flag4 = false
	end

	Esp.step()
end

tgtText = function()
	if not v2 then
		return "No target"
	end
	local v5, v6, v7 = alive(v2)
	if not v5 then
		return (("%* dead"):format(v2.DisplayName))
	end
	local magnitude = position and (v7.Position - position).Magnitude or 0
	local concat = table.concat
	local tbl10 = {}
	local str = ("%* (@%*)%*"):format(v2.DisplayName, v2.Name, v4 == v2 and "  LOCKED" or "")
	local v8 = lore
	local str2 = ("HP %*/%*  |  %*"):format(math.floor(v6.Health), math.floor(v6.MaxHealth), v8(v2, magnitude))
	local str3 = ("Team %*"):format(v2.Team and v2.Team.Name or "None")
	tbl10[1] = str
	tbl10[2] = str2
	tbl10[3] = str3
	return concat(tbl10, "\n")
end

sweep = function()
	local tbl10 = { localPlayer:FindFirstChildOfClass("PlayerGui") }

	local ok, result = pcall(function()
		return gethui and gethui()
	end)

	if ok and typeof(result) == "Instance" then
		tbl10[#tbl10 + 1] = result
	end

	local ok2, result2 = pcall(function()
		return game:GetService("CoreGui")
	end)

	if ok2 and result2 then
		tbl10[#tbl10 + 1] = result2
	end

	for _, v5 in ipairs(tbl10) do
		pcall(function()
			for _, child in ipairs(v5:GetChildren()) do
				if child.Name == "NightHub" then
					child:Destroy()
				end
			end
		end)
	end
end

buildUI = function()
	sweep()

	local ok, night = pcall(function()
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/Ui-Library/V2Loader.luau"))()
	end)

	if (not ok or type(night) ~= "table") and type(isfile) == "function" and type(readfile) == "function" and isfile("NightGlass.lua") then
		ok, night = pcall(function()
			return loadstring(readfile("NightGlass.lua"))()
		end)
	end

	if not ok or type(night) ~= "table" then
		genv.gethui = gethui_
		return false, night
	end

	local v5 = night:CreateWindow({
		Title = tbl.Name,
		SubTitle = tbl.Game,
		Size = UDim2.fromOffset(680, 480),
		TabWidth = 142,
		Key = Enum.KeyCode.RightControl,
		MinimizeKey = Enum.KeyCode.RightControl,
		Glass = false,
		Settings = { Save = true, Main = tbl.Name, Folder = tbl.Name, Game = "BloxFruitsPvp" },
	})

	local tbl10 = {
		fight = v5:AddTab({ Title = "Combat", Icon = "crosshair" }),
		aura = v5:AddTab({ Title = "Kill Aura", Icon = "swords" }),
		eye = v5:AddTab({ Title = "Visuals", Icon = "eye" }),
		body = v5:AddTab({ Title = "Player", Icon = "user" }),
		conf = v5:AddTab({ Title = "Settings", Icon = "settings" }),
	}

	genv.gethui = gethui_
	local tbl11 = {}
	local tbl12 = {}

	local function note(arg, arg2)
		pcall(function()
			night:Notify({ Kind = arg2 or "info", Title = tbl.Name, Content = arg, Duration = 4 })
		end)
	end

	local function fn(arg, arg2, arg3, arg4)
		tbl11[arg2] = arg:AddParagraph({ Title = arg3, Content = "...", Icon = arg4 })
	end

	local function post(arg, arg2)
		local v6 = tbl11[arg]

		if v6 then
			pcall(function()
				v6:SetContent(arg2)
			end)
		end
	end

	local function mirror(arg, arg2)
		local v6 = tbl12[arg]

		if v6 then
			pcall(function()
				v6:SetValue(arg2, true)
			end)
		end
	end

	local function fn2(arg, arg2, arg3, arg4)
		local v6 = arg:AddSection(arg2, arg4)

		pcall(function()
			v6:SetIcon(arg3)
		end)

		return v6
	end

	local function fn3(arg, arg2, arg3, arg4, arg5, arg6)
		tbl12[arg2] = arg:AddToggle(arg2, {
			Title = arg3,
			Description = arg4,
			Icon = arg5,
			Default = tbl4[arg2],
			Callback = function(arg7)
				tbl4[arg2] = arg7

				if arg6 then
					arg6(arg7)
				end
			end,
		})
	end

	local function fn4(arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
		arg:AddSlider(arg2, {
			Title = arg3,
			Description = arg4,
			Icon = arg5,
			Min = arg6,
			Max = arg7,
			Default = tbl4[arg2],
			Rounding = arg8 or 0,
			Callback = function(arg9)
				tbl4[arg2] = arg9
			end,
		})
	end

	local function fn5(arg, arg2, arg3, arg4, arg5, arg6)
		arg:AddDropdown(arg2, {
			Title = arg3,
			Description = arg4,
			Icon = arg5,
			Values = arg6,
			Default = tbl4[arg2],
			Callback = function(arg7)
				tbl4[arg2] = arg7
			end,
		})
	end

	local function fn6(arg, arg2, arg3, arg4, arg5)
		arg:AddKeybind(arg2, { Title = arg3, Description = arg4, Icon = arg5, Default = tbl4[arg2], Mode = "Toggle" })
		local options = night.Options and night.Options[arg2]

		if options and options.OnChanged then
			options:OnChanged(function(arg6)
				tbl4[arg2] = keyName(arg6)
			end)
		end
	end

	local targeting = fn2(tbl10.fight, "Targeting", "target", "shared by aimbot, silent aim, kill aura and visuals")
	fn5(targeting, "pickMode", "Pick target by", "Smart scores distance, health and cursor together, finishes anyone under 25% first and only swaps target when a clearly better one shows up. The others use a single rule.", "list-filter", { "Smart", "Nearest cursor", "Nearest distance", "Lowest health" })
	fn4(targeting, "smartHp", "Smart: health vs distance", "0 picks purely the closest, 100 purely the weakest. Only used by Smart.", "scale", 0, 100, 0)
	fn3(targeting, "killNote", "Kill Notify", "Shows a notification when your target dies.", "skull")
	fn5(targeting, "part", "Aim part", "Falls back to HumanoidRootPart when the part is missing.", "scan", { "Head", "HumanoidRootPart" })
	fn3(targeting, "useFov", "Limit To FOV", "Only players inside the circle around your cursor can be picked.", "circle-dashed")
	fn4(targeting, "fov", "FOV radius", "In screen pixels.", "circle", 30, 600, 0)
	fn4(targeting, "maxDist", "Max distance", "Studs from your character.", "ruler", 50, 5000, 0)
	fn4(targeting, "pred", "Prediction", "Leads the aim point by the target's velocity times this many seconds. Raise it for slow projectiles.", "trending-up", 0, 0.5, 2)
	fn3(targeting, "teamCheck", "Team Check", "Skips other Marines while you are a Marine, the game blocks that damage anyway.", "shield")
	fn3(targeting, "wallCheck", "Wall Check", "Ignores anyone behind a wall from the camera's point of view.", "brick-wall")
	fn3(targeting, "skipFriends", "Ignore Friends", "Never picks a Roblox friend.", "heart")
	fn6(targeting, "lockKey", "Lock target key", "Press once to stick to the current target until it dies or you press again.", "lock")
	fn(targeting, "target", "Current target", "user")
	local aimbot = fn2(tbl10.fight, "Aimbot", "crosshair")
	fn3(aimbot, "aimbot", "Aimbot", "Turns the camera onto the target.", "crosshair")
	fn5(aimbot, "aimTrigger", "Trigger", "When the camera is allowed to lock on.", "mouse-pointer", { "Hold right mouse", "Hold key", "Always" })
	fn6(aimbot, "aimKey", "Aim key", "Only used while Trigger is Hold key.", "keyboard")
	fn4(aimbot, "smooth", "Smoothness", "0 snaps instantly, higher values glide onto the target.", "wind", 0, 0.95, 2)
	local silentAim = fn2(tbl10.fight, "Silent Aim", "scan-eye")

	fn3(silentAim, "silent", "Silent Aim", "Skills, fruit clicks and guns fly at the target while your camera stays free. Every position or direction the game sends that matches where your mouse points gets swapped for the target's predicted position.", "scan-eye", function(arg)
		if not arg then
			return
		end
		local v6, v7 = hook()
		if v6 then
			return
		end
		tbl4.silent = false
		mirror("silent", false)
		note(("Silent aim: %*"):format(v7), "warn")
	end)

	fn4(silentAim, "chance", "Hit chance", "Percent of shots that get redirected.", "percent", 1, 100, 0)
	local pvPMode = fn2(tbl10.fight, "PvP Mode", "flame")

	pvPMode:AddButton({
		Title = "PvP Mode",
		Description = "Turns on Smart target, silent aim, Smart fly, auto skills, no stun, anti aim, auto dodge, hitbox, auto haki and ESP in one go.",
		Icon = "flame",
		Label = "Enable",
		Callback = function()
			local options = night.Options or {}

			for k, v6 in pairs({
				pickMode = "Smart",
				silent = true,
				fly = true,
				flyMode = "Smart",
				autoSkill = true,
				noStun = true,
				antiAim = true,
				dodge = true,
				hitbox = true,
				buso = true,
				ken = true,
				esp = true,
				killNote = true,
			}) do
				local v7 = options[k]

				if v7 and v7.SetValue then
					pcall(function()
						v7:SetValue(v6)
					end)
				else
					tbl4[k] = v6
				end
			end

			note("PvP Mode on", "good")
		end,
	})

	fn3(pvPMode, "autoSkill", "Auto Skills", "Presses the chosen skill keys while the target is in range. Each press forces silent aim so the skill flies at the target.", "flame", function(arg)
		if not arg then
			return
		end
		local v6, v7 = hook()
		if v6 then
			return
		end
		tbl4.autoSkill = false
		mirror("autoSkill", false)
		note(("Auto skills: %*"):format(v7), "warn")
	end)

	pvPMode:AddDropdown("skillKeys", {
		Title = "Skill keys",
		Description = "Pressed in this order, Z first.",
		Icon = "keyboard",
		Values = { "Z", "X", "C", "V", "F" },
		Multi = true,
		Default = { "Z", "X", "C", "V" },
		Callback = function(skillKeys)
			tbl4.skillKeys = skillKeys
		end,
	})

	fn4(pvPMode, "skillRange", "Skill range", "Studs to the target.", "ruler", 10, 300, 0)
	fn4(pvPMode, "skillHold", "Hold time", "Seconds each key is held. Raise it for charged skills.", "timer", 0.03, 2, 2)
	fn4(pvPMode, "skillGap", "Gap between skills", "Seconds.", "timer", 0.05, 2, 2)
	local hitbox = fn2(tbl10.fight, "Hitbox", "box")
	fn3(hitbox, "hitbox", "Hitbox Expander", "Grows every enemy's HumanoidRootPart on your screen so melee, swords and skills connect from further away.", "box")
	fn4(hitbox, "hitboxSize", "Hitbox size", "Studs on each side.", "maximize", 4, 40, 0)
	fn3(hitbox, "hitboxShow", "Show Hitbox", "Draws the enlarged box faintly.", "eye")
	local autoGun = fn2(tbl10.fight, "Auto Gun", "target")

	fn3(autoGun, "autoGun", "Auto Shoot", "When the target is in range, equips the gun, aims at the target through the silent aim hook for that shot only, fires, then goes back to what you held.", "flame", function(arg)
		if not arg then
			return
		end
		local v6, v7 = hook()
		if v6 then
			return
		end
		tbl4.autoGun = false
		mirror("autoGun", false)
		note(("Auto gun: %*"):format(v7), "warn")
	end)

	fn5(autoGun, "gunPick", "Gun", "Dragonstorm matches by name, Any gun takes the first gun in your backpack.", "crosshair", { "Dragonstorm", "Any gun" })
	fn4(autoGun, "gunRange", "Fire range", "Studs to the target.", "locate", 20, 400, 0)
	fn4(autoGun, "gunRate", "Fire delay", "Seconds between shots.", "timer", 0.1, 2, 2)
	fn3(autoGun, "gunSkills", "Use Gun Skills", "Also presses Z and X on each shot.", "wand-2")
	fn3(autoGun, "gunBack", "Swap Back", "Re-equips your previous weapon after the shot.", "undo-2")
	fn(autoGun, "gun", "Auto Gun", "activity")
	local killAura = fn2(tbl10.aura, "Kill Aura", "swords")
	fn3(killAura, "aura", "Kill Aura", "Swings your melee or sword at players in range, the hit list is built client side.", "swords")
	fn3(killAura, "auraAll", "Hit Everyone In Range", "Off means only the current target gets hit.", "users")
	fn4(killAura, "auraRange", "Range", "Studs.", "locate", 5, 100, 0)
	fn4(killAura, "auraRate", "Swing delay", "Seconds between swings.", "timer", 0.05, 1, 2)
	fn5(killAura, "auraWeapon", "Weapon", "Keep current uses whatever melee or sword you hold. Melee or Sword equips one from your backpack.", "hand", { "Keep current", "Melee", "Sword" })
	fn(killAura, "aura", "Kill Aura", "activity")
	local v6 = fn2(tbl10.aura, "Haki & Race", "flame")
	fn3(v6, "buso", "Auto Buso Haki", "Turns armament back on whenever it drops.", "shield-plus")
	fn3(v6, "ken", "Auto Observation", "Fires observation every 10 seconds.", "eye")
	fn3(v6, "race", "Auto Race Ability", "Fires your race ability every 5 seconds.", "flame")

	v6:AddButton({
		Title = "Use race ability",
		Icon = "flame",
		Label = "Use",
		Callback = function()
			local v7, v8 = race()

			if not v7 then
				note(("Race: %*"):format(v8), "warn")
			end
		end,
	})

	local playerEsp = fn2(tbl10.eye, "Player ESP", "eye")

	if not flag5 then
		fn(playerEsp, "draw", "Drawing API", "triangle-alert")
	end

	fn3(playerEsp, "esp", "ESP", "Master switch for everything in this section.", "eye")
	fn3(playerEsp, "box", "Box", "2D box around each player.", "square")
	fn3(playerEsp, "name", "Name", "Display name above the box.", "type")
	fn3(playerEsp, "info", "Info", "Level, distance and fruit under the box.", "info")
	fn3(playerEsp, "bar", "Health Bar", "Bar on the left side of the box.", "heart-pulse")
	fn3(playerEsp, "hpText", "Health Number", "Current HP next to the bar.", "hash")
	fn3(playerEsp, "chams", "Chams", "Highlights bodies through walls.", "layers")
	fn3(playerEsp, "tracer", "Tracers", "A line to every player.", "git-commit-horizontal")
	fn5(playerEsp, "tracerFrom", "Tracer origin", "Where the lines start on screen.", "move", { "Bottom", "Center", "Mouse" })
	fn4(playerEsp, "espDist", "ESP distance", "Studs.", "ruler", 100, 10000, 0)
	fn5(playerEsp, "espColor", "ESP color", "Used when Team Color is off.", "palette", tbl6)
	fn3(playerEsp, "teamColor", "Team Color", "Colors each player by their team.", "flag")
	local targetVisuals = fn2(tbl10.eye, "Target Visuals", "target")
	fn3(targetVisuals, "showFov", "Show FOV Circle", "Only drawn while aimbot or silent aim is on.", "circle-dashed")
	fn3(targetVisuals, "tgtLine", "Target Line", "Draws a line to the current target.", "spline")
	fn5(targetVisuals, "lineFrom", "Line origin", "Where the target line starts.", "move", { "Character", "Bottom", "Mouse" })
	fn3(targetVisuals, "tgtMark", "Target Marker", "Rings the target and recolors its ESP.", "crosshair")
	fn5(targetVisuals, "tgtColor", "Target color", "Color for the line, marker and target ESP.", "palette", tbl6)
	local speed = fn2(tbl10.body, "Speed", "gauge")

	local function fn7(arg)
		if not arg then
			return
		end
		local v7, v8 = hook()

		if not v7 then
			note(("%*, the game may reset the value"):format(v8), "warn")
		end
	end

	fn3(speed, "speed", "Walk Speed", "Holds your WalkSpeed. The game's own writes are swapped for your value and its reads get the old value back, so it stops resetting you.", "gauge", fn7)
	fn4(speed, "speedValue", "Speed", "WalkSpeed while the toggle is on.", "gauge", 16, 350, 0)
	fn3(speed, "jumpOn", "Jump Power", "Same trick for JumpPower and JumpHeight.", "arrow-up", fn7)
	fn4(speed, "jumpValue", "Jump", "JumpPower while the toggle is on.", "arrow-up", 50, 400, 0)
	fn3(speed, "noclip", "Noclip", "Walk through walls.", "ghost")
	local survival = fn2(tbl10.body, "Survival", "heart-pulse")
	fn3(survival, "noStun", "No Stun", "Blocks the game from zeroing your speed, anchoring you, platform standing or ragdolling you, and clears the Stun and Busy values on your character when they exist.", "shield-off", fn7)
	fn5(survival, "moverFilter", "Stun filter", "Smart keeps velocity pushing you the way you face, so your own dashes and flash steps still work. Remove all deletes every BodyVelocity, BodyPosition and similar mover the game puts on you.", "filter", { "Smart", "Remove all" })
	fn3(survival, "escape", "Escape At Low HP", "Jumps you straight up once when your health drops under the limit.", "shield-alert")
	fn4(survival, "escapeHp", "HP limit", "Percent of max health.", "heart", 5, 80, 0)
	fn4(survival, "escapeUp", "Escape height", "Studs.", "arrow-up", 50, 1000, 0)
	local flyToTarget = fn2(tbl10.body, "Fly To Target", "plane")
	fn3(flyToTarget, "fly", "Fly To Target", "Flies to the current target. Kite stays behind its back at a safe distance and sways sideways. Predict parks where it is heading, in front of it, so it gets hit. Orbit circles around it.", "plane")
	fn6(flyToTarget, "flyKey", "Fly key", "Toggles Fly To Target.", "keyboard")
	fn5(flyToTarget, "flyMode", "Mode", "Smart attacks from behind when the fight is in your favour and kites when it is not. Kite always keeps distance, Predict parks in front, Orbit circles.", "compass", { "Smart", "Kite", "Predict", "Orbit" })
	fn4(flyToTarget, "engageDist", "Smart: attack distance", "Studs behind the target while attacking.", "swords", 3, 30, 0)
	fn4(flyToTarget, "engageEdge", "Smart: HP disadvantage allowed", "Still attacks while your HP percent is up to this much lower than the target's.", "scale", 0, 50, 0)
	fn4(flyToTarget, "retreatHp", "Smart: retreat below HP", "Your HP percent that switches to kiting.", "heart", 10, 80, 0)
	fn4(flyToTarget, "gankRange", "Smart: gank range", "Two or more enemies this close makes you back off.", "users", 20, 150, 0)
	fn4(flyToTarget, "kiteDist", "Kite distance", "Studs behind the target in Kite mode.", "ruler", 8, 80, 0)
	fn4(flyToTarget, "kiteSway", "Kite sway", "How far you swing side to side in Kite mode.", "move", 0, 20, 0)
	fn4(flyToTarget, "flySpeed", "Speed", "Studs per second.", "gauge", 50, 400, 0)
	fn4(flyToTarget, "flySafe", "Speed after pull back", "Used for 6 seconds whenever the server snaps you back, then it tries the normal speed again.", "gauge", 50, 400, 0)
	fn4(flyToTarget, "flyDist", "Distance", "Studs from the target in Predict mode.", "ruler", 2, 20, 0)
	fn4(flyToTarget, "flyUp", "Height", "Studs above the target.", "arrow-up", 0, 30, 0)
	fn4(flyToTarget, "orbitRadius", "Orbit radius", "Studs.", "circle", 4, 40, 0)
	fn4(flyToTarget, "orbitSpeed", "Orbit speed", "Radians per second.", "rotate-cw", 0.5, 8, 1)
	fn3(flyToTarget, "flyNoclip", "Noclip While Flying", "Passes through walls on the way.", "ghost")
	fn(flyToTarget, "fly", "Fly", "activity")
	local defense = fn2(tbl10.body, "Defense", "shield")
	fn3(defense, "antiAim", "Anti Aim", "Other players see a fake random velocity on you while you move normally, so aimbots and silent aims that lead their shots by your velocity miss.", "shield")
	fn4(defense, "antiAimPower", "Anti aim strength", "Size of the fake velocity.", "gauge", 50, 1000, 0)
	fn3(defense, "dodge", "Auto Dodge", "Side steps when an enemy in range turns to face you.", "move")
	fn4(defense, "dodgeRange", "Dodge range", "Studs.", "ruler", 8, 60, 0)
	fn4(defense, "dodgeDist", "Dodge distance", "Studs per side step.", "move", 5, 40, 0)
	fn4(defense, "dodgeCd", "Dodge cooldown", "Seconds between side steps.", "timer", 0.3, 5, 1)
	local targetMovement = fn2(tbl10.body, "Target Movement", "move")
	fn3(targetMovement, "stick", "Stick To Target", "Pins you behind and above the target every frame. Only engages inside the range below so it never jumps across the map.", "magnet")
	fn4(targetMovement, "stickUp", "Height", "Studs above the target.", "arrow-up", 0, 80, 0)
	fn4(targetMovement, "stickBack", "Behind", "Studs behind the target.", "arrow-left", 1, 15, 0)
	fn4(targetMovement, "stickRange", "Engage range", "Studs.", "locate", 20, 300, 0)
	fn3(targetMovement, "spectate", "Spectate Target", "Moves your camera onto the target.", "video")
	fn3(fn2(tbl10.body, "Movement", "footprints"), "infJump", "Infinite Jump", "Jump again in mid air.", "arrow-up-from-line")
	local misc = fn2(tbl10.conf, "Misc", "settings")

	fn3(misc, "antiAfk", "Anti AFK", "Disables the idle kick connection.", "coffee", function()
		local v7, v8 = antiAfk()

		if not v7 then
			note(("Anti AFK: %*"):format(v8), "warn")
		end
	end)

	misc:AddKeybind("uiKey", {
		Title = "Toggle key",
		Description = "Click the box on the right, then press a new key.",
		Icon = "keyboard",
		Default = "RightControl",
		Mode = "Toggle",
	})

	local uiKey = night.Options and night.Options.uiKey

	if uiKey and uiKey.OnChanged then
		uiKey:OnChanged(function(arg)
			v5:SetKey(arg)
		end)
	end

	misc:AddButton({
		Title = "Unload",
		Description = "Stops every loop, removes the drawings and closes this window.",
		Icon = "power",
		Label = "Unload",
		Callback = function()
			v5:Dialog({
				Title = "Unload the script",
				Content = "Everything turns off and the window closes.",
				Buttons = {
					{
						Title = "Unload",
						Filled = true,
						Callback = function()
							if genv.NightPvp then
								genv.NightPvp.Unload()
							end
						end,
					},
					{ Title = "Cancel" },
				},
			})
		end,
	})

	if tbl10.conf.AddInterface then
		pcall(function()
			tbl10.conf:AddInterface()
		end)
	end

	if not flag5 then
		post("draw", "Your executor has no Drawing API, only Chams will show")
	end

	local v7 = UI
	local v8 = UI
	local v9 = UI
	local v10 = UI
	UI.Night = night
	v7.Window = v5
	v8.note = note
	v9.post = post
	v10.mirror = mirror
	return true
end

unload = function()
	flag = false
	flag2 = false

	pcall(function()
		RunService:UnbindFromRenderStep("NightPvpAim")
	end)

	if flag4 then
		local v5, v6 = alive(localPlayer)

		if v6 then
			currentCamera.CameraSubject = v6
		end
	end

	for _, v5 in ipairs(tbl2) do
		pcall(function()
			v5:Disconnect()
		end)
	end

	table.clear(tbl2)
	local v5 = tbl4
	local v6 = tbl4
	local v7 = tbl4
	local v8 = tbl4
	local v9 = tbl4
	local v10 = tbl4
	local v11 = tbl4
	local v12 = tbl4
	tbl4.speed = false
	v5.jumpOn = false
	v6.noclip = false
	v7.autoGun = false
	v8.noStun = false
	v9.fly = false
	v10.hitbox = false
	v11.antiAim = false
	v12.dodge = false
	tbl4.autoSkill = false
	pcall(antiAimStep)
	pcall(hitboxes)
	pcall(movement)
	pcall(noclip)
	Move.on = false
	pcall(Esp.clear)

	if not (UI.Night and UI.Night.Glass) then
		pcall(function()
			UI.Window:Close()
		end)
	end

	pcall(function()
		UI.Night:Destroy()
	end)

	genv.NightPvp = nil
end

local ok, result, result2 = pcall(buildUI)
genv.gethui = gethui_

if not ok or not result then
	local v5 = warn
	local str = ("! UI: %*"):format(ok and result2 or result)
	v5(str)
	Esp.clear()
	return
end

for _, player in ipairs(Players:GetPlayers()) do
	befriend(player)
end

bind(Players.PlayerAdded:Connect(befriend))

bind(Players.PlayerRemoving:Connect(function(player)
	drop(player)
	tbl3[player.UserId] = nil

	if v4 == player then
		v4 = nil
	end
end))

bind(UserInputService.InputBegan:Connect(function(input)
	if UserInputService:GetFocusedTextBox() or input.KeyCode.Name ~= tbl4.lockKey then
		return
	end

	if v4 then
		v4 = nil
		UI.note("Target unlocked")
		return
	end

	if not v2 then
		return UI.note("No target", "warn")
	end
	v4 = v2
	local note = UI.note
	local str = ("Locked %*"):format(v2.DisplayName)
	note(str)
end))

bind(UserInputService.InputBegan:Connect(function(input)
	if UserInputService:GetFocusedTextBox() or tbl4.flyKey == "None" or input.KeyCode.Name ~= tbl4.flyKey then
		return
	end
	tbl4.fly = not tbl4.fly
	UI.mirror("fly", tbl4.fly)
	UI.note(tbl4.fly and "Fly on" or "Fly off")
end))

bind(UserInputService.JumpRequest:Connect(function()
	if not tbl4.infJump then
		return
	end
	local v5, v6 = alive(localPlayer)

	if v6 then
		v6:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end))

bind(RunService.Heartbeat:Connect(stick))

bind(RunService.Heartbeat:Connect(function()
	pcall(movement)
end))

bind(RunService.Stepped:Connect(function()
	pcall(antiAimStep)

	if tbl4.noclip or tbl4.fly or next(Move.clip) then
		pcall(noclip)
	end
end))

bind(RunService.Heartbeat:Connect(function(deltaTime)
	pcall(fly, deltaTime)
	pcall(sweepMovers)
	pcall(antiAimBeat)
end))

watchMovers(localPlayer.Character)
bind(localPlayer.CharacterAdded:Connect(watchMovers))
spin("Hitbox", 0.3, hitboxes)
spin("Dodge", 0.05, dodge)
spin("Crowd", 0.25, crowd)

spin("Skills", 0.1, function()
	if tbl4.autoSkill then
		return skills()
	end
end)

spin("Gun", function()
	return tbl4.autoGun and tbl4.gunRate or 0.3
end, function()
	if not tbl4.autoGun then
		Gun.note = "Off"
		return
	end
	local v5
	v5, v5 = shoot()
	Gun.note = v5
end)

spin("Escape", 0.1, escape)
RunService:BindToRenderStep("NightPvpAim", Enum.RenderPriority.Camera.Value + 1, frame)

spin("Aura", function()
	return tbl4.aura and tbl4.auraRate or 0.3
end, function()
	if not tbl4.aura then
		Aura.note = "Off"
		return
	end
	local v5
	v5, v5 = swing()
	Aura.note = v5
end)

spin("Buso", 2, function()
	if tbl4.buso then
		return buso()
	end
end)

spin("Ken", 10, function()
	if tbl4.ken then
		return ken()
	end
end)

spin("Race", 5, function()
	if tbl4.race then
		return race()
	end
end)

spin("Panels", 0.5, function()
	UI.post("target", tgtText())
	local post = UI.post
	local str = ("Swings %*  |  %*"):format(Aura.swings, Aura.note)
	post("aura", str)
	local post2 = UI.post
	local str2 = ("Shots %*  |  %*"):format(Gun.shots, Gun.note)
	post2("gun", str2)
	UI.post("fly", Fly.note)
end)

if tbl4.antiAfk then
	antiAfk()
end

genv.NightPvp = { Hub = tbl, State = tbl4, Aura = Aura, Esp = Esp, Unload = unload }
local note = UI.note
local str = ("Ready - %* build %*"):format(tbl.Game, tbl.Build)
note(str)
