local NotificationHolder = loadstring(game:HttpGet("https://pastebin.com/raw/KWePWhuF"))()
local Notification = loadstring(game:HttpGet("https://pastebin.com/raw/WiSeepVm"))()

Notification:Notify(
    {Title = "刺客DOORS", Description = "欢迎您的使用!"},
    {OutlineColor = Color3.fromRGB(100,150,255),Time = 3, Type = "image"},
    {Image = "http://www.roblox.com/asset/?id=15509623662", ImageColor = Color3.fromRGB(255, 255, 255)}
)

Notification:Notify(
    {Title = "请加入群组",Description = "Q 群 6 3 7 3 4 0 1 5 0"},
    {OutlineColor = Color3.fromRGB(100,150,255),Time = 3.5, Type = "image"},
    {Image = "http://www.roblox.com/asset/?id=15509623662", ImageColor = Color3.fromRGB(255, 255, 255)}
)

msg = Instance.new("Message")
msg.Parent = game.Workspace
msg.Text = "欢迎使用刺客\nD O O R S\n官方Q群637340150"
wait(2)
msg:remove()
wait(2)

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/YSlon/----GL/main/%E7%8C%8E%E6%88%B7UI.lua"))()
local Window = OrionLib:MakeWindow({Name = "刺 客 - D O O R S", HidePremium = false, SaveConfig = true,IntroText = "启动中", ConfigFolder = "启动中"})

local Main = Window:MakeTab({
	Name = "主要",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

local Esp = Window:MakeTab({
	Name = "追踪",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

local Automatic = Window:MakeTab({
	Name = "自动",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

local Entity = Window:MakeTab({
	Name = "实体",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

local delete = Window:MakeTab({
	Name = "删除",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

local Tab = Window:MakeTab({
	Name = "娱乐",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})


local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid")

if not fireproximityprompt then
  local msg = Instance.new("Message",workspace)
  msg.Text = "you have fireproximityprompt function bro get better executor"
  task.wait(6)
  msg:Destroy()
  error("no prox")
end

function esp(what,color,core,name)
  local parts

  if typeof(what) == "Instance" then
    if what:IsA("Model") then
      parts = what:GetChildren()
     elseif what:IsA("BasePart") then
      parts = {what,table.unpack(what:GetChildren())}
    end
   elseif typeof(what) == "table" then
    parts = what
  end

  local bill
  local boxes = {}

  for i,v in pairs(parts) do
    if v:IsA("BasePart") then
      local box = Instance.new("BoxHandleAdornment")
      box.Size = v.Size
      box.AlwaysOnTop = true
      box.ZIndex = 1
      box.AdornCullingMode = Enum.AdornCullingMode.Never
      box.Color3 = color
      box.Transparency = 0.7
      box.Adornee = v
      box.Parent = game.CoreGui

      table.insert(boxes,box)

      task.spawn(function()
        while box do
          if box.Adornee == nil or not box.Adornee:IsDescendantOf(workspace) then
            box.Adornee = nil
            box.Visible = false
            box:Destroy()
          end
          task.wait()
        end
      end)
    end
  end

  if core and name then
    bill = Instance.new("BillboardGui",game.CoreGui)
    bill.AlwaysOnTop = true
    bill.Size = UDim2.new(0,400,0,100)
    bill.Adornee = core
    bill.MaxDistance = 2000

    local mid = Instance.new("Frame",bill)
    mid.AnchorPoint = Vector2.new(0.5,0.5)
    mid.BackgroundColor3 = color
    mid.Size = UDim2.new(0,8,0,8)
    mid.Position = UDim2.new(0.5,0,0.5,0)
    Instance.new("UICorner",mid).CornerRadius = UDim.new(1,0)
    Instance.new("UIStroke",mid)

    local txt = Instance.new("TextLabel",bill)
    txt.AnchorPoint = Vector2.new(0.5,0.5)
    txt.BackgroundTransparency = 1
    txt.BackgroundColor3 = color
    txt.TextColor3 = color
    txt.Size = UDim2.new(1,0,0,20)
    txt.Position = UDim2.new(0.5,0,0.7,0)
    txt.Text = name
    Instance.new("UIStroke",txt)

    task.spawn(function()
      while bill do
        if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
          bill.Enabled = false
          bill.Adornee = nil
          bill:Destroy()
        end
        task.wait()
      end
    end)
  end

  local ret = {}

  ret.delete = function()
    for i,v in pairs(boxes) do
      v.Adornee = nil
      v.Visible = false
      v:Destroy()
    end

    if bill then
      bill.Enabled = false
      bill.Adornee = nil
      bill:Destroy()
    end
  end

  return ret
end

local entityinfo = game.ReplicatedStorage:WaitForChild("EntityInfo")
function message(text)
  local msg = Instance.new("Message",workspace)
  msg.Text = tostring(text)
  task.wait(5)
  msg:Destroy()

  --firesignal(entityinfo.Caption.OnClientEvent,tostring(text))
end

local flags = {
  espdoors = false,
  espkeys = false,
  espitems = false,
  espbooks = false,
  esprush = false,
  espchest = false,
  esplocker = false,
  esphumans = false,
  espgold = false,
  hintrush = false,
  light = false,
  instapp = false,
  noseek = false,
  nogates = false,
  nopuzzle = false,
  noa90 = false,
  noskeledoors = false,
  noscreech = false,
  getcode = false,
  roomsnolock = false,
  draweraura = false,
  autorooms = false,
}

local DELFLAGS = {table.unpack(flags)}
local esptable = {doors={},keys={},items={},books={},entity={},chests={},lockers={},people={},gold={}}

local Main = Main:AddSection({
	Name = "主要功能"
})

Main:AddButton({
	Name = "人物微速",
	Callback = function()
  plr.Character.Humanoid.WalkSpeed = 22
    end
})

Main:AddButton({
	Name = "恢复速度",
	Callback = function()
  plr.Character.Humanoid.WalkSpeed = 16
    end
})

Main:AddToggle({
	Name = "人物穿墙",
	Default = false,
	Callback = function(Value)
		if Value then
		    Noclip = true
		    Stepped = game.RunService.Stepped:Connect(function()
			    if Noclip == true then
				    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
			    else
				    Stepped:Disconnect()
			    end
		    end)
	    else
		    Noclip = false
	    end
	end
})

Main:AddToggle({
  Name = "立即互动",
 Default = false,
  Callback = function(val)
    flags.instapp = val
    
    local holdconnect
    holdconnect = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(p)
		fireproximityprompt(p)
	end)
    
    repeat task.wait() until not flags.instapp
    holdconnect:Disconnect()
   end
})

Main:AddToggle({
  Name = "自身发光",
  Default = false,
  Callback = function(val)
    flags.light = val
   
    if val then
        local l = Instance.new("PointLight")
        l.Range = 10000
        l.Brightness = 2
        l.Parent = char.PrimaryPart
       
        repeat task.wait() until not flags.light
        l:Destroy() 
    end
    end
})

Main:AddButton({
  Name = "第三人称",
  Callback = function()
   task.spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        workspace.CurrentCamera.CFrame = (game.Players.LocalPlayer.Character.Head.CFrame * CFrame.Angles(math.rad(-30),0,0)) * CFrame.new(0,1,4)
    end)
end)
    end
})

Main:AddButton({
	Name = "秒回满血",
	Callback = function()
game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.MaxHealth 
end
})

Main:AddToggle({
  Name = "远距离互动(能隔墙摸)",
  Default = false,
  Callback = function(MALE)
  getgenv().midd = MALE
end
})

game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(v)
    if not getgenv().midd then return end
    if v.IsA(v,"ProximityPrompt") then
       if getgenv().midd then
        v.MaxActivationDistance = 25
       end
    end
end)

Main:AddButton({
  Name = "无敌(局外者模式)",
  Callback = function()
  local Collison = game.Players.LocalPlayer.Character:FindFirstChild("Collision")
Collison.Position = Collison.Position - Vector3.new(0,10,0)
wait(1)

    end
})

Main:AddToggle({
	Name = "房间刷新时通知",
	Default = false,
    Save = false,
    Flag = "PredictToggle"
})

local NotificationCoroutine = coroutine.create(function()
    LatestRoom.Changed:Connect(function()
        FloorIndicator:Set(tostring(LatestRoom.Value))
        if OrionLib.Flags["PredictToggle"].Value == true then
            local n = ChaseStart.Value - LatestRoom.Value
            if 0 < n and n < 4 then
                OrionLib:MakeNotification({
                    Name = "请注意!",
                    Content = "位于 " .. tostring(n) .. " 房间已刷新.",
                    Time = 5
                })
            end
        end
end)
end)
coroutine.resume(NotificationCoroutine)

local AutoSkipCoro = coroutine.create(function()
        while true do
            task.wait()
            pcall(function()
            if OrionLib.Flags["AutoSkip"].Value == true and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value < 100 then
                local HasKey = false
                local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom.Value
                local CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom)]:WaitForChild("Door")
                for i,v in ipairs(CurrentDoor.Parent:GetDescendants()) do
                    if v.Name == "KeyObtain" then
                        HasKey = v
                    end
                end
                if HasKey then
                    game.Players.LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position))
                    task.wait()
                    fireproximityprompt(HasKey.ModulePrompt,0)
                    game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                    task.wait()
                    fireproximityprompt(CurrentDoor.Lock.UnlockPrompt,0)
                end
                if LatestRoom == 50 then
                    CurrentDoor = workspace.CurrentRooms[tostring(LatestRoom+1)]:WaitForChild("Door")
                end
                game.Players.LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
                task.wait()
                CurrentDoor.ClientOpen:FireServer()
            elseif OrionLib.Flags["AutoSkip"].Value == true and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 100 then
                local LatestRoom =  workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]
                local ElevatorCar = LatestRoom:WaitForChild("ElevatorCar")
                local ElevatorBreaker = LatestRoom:WaitForChild("ElevatorBreaker")
                task.wait(0.2)
                game.Players.LocalPlayer.Character:PivotTo(CF(ElevatorBreaker.Box.Position))
                task.wait(0.2)
                game:GetService("ReplicatedStorage").Bricks.EBF:FireServer()
                task.wait(0.2)
                game.Players.LocalPlayer.Character:PivotTo(CF(ElevatorCar.CollisionFloor.Position + Vector3.new(0,2,0)))
            end
        end)
        end
end)
coroutine.resume(AutoSkipCoro)

Main:AddToggle({
  Name = "实体刷新时通知",
  Default = false,
  Callback = function(val)
    flags.hintrush = val
    
    if val then
        local addconnect
        addconnect = workspace.ChildAdded:Connect(function(v)
            if table.find(entitynames,v.Name) then
                repeat task.wait() until plr:DistanceFromCharacter(v:GetPivot().Position) < 1000 or not v:IsDescendantOf(workspace)
                
                if v:IsDescendantOf(workspace) then
                    OrionLib:MakeNotification({
Name = "警告!!!",
Content = v.Name:gsub("Moving",""):lower().."已刷新",
Image = "rbxassetid://",
Time = 5
})
                end
            end
        end) 
        
        repeat task.wait() until not flags.hintrush
        addconnect:Disconnect()
    end
end
})

local Esp = Esp:AddSection({
	Name = "追踪功能"
})

Esp:AddToggle({
  Name = "追踪门",
  Default = false,
  Callback = function(val)
    flags.espdoors = val

    if val then
      local function setup(room)
        local door = room:WaitForChild("Door"):WaitForChild("Door")

        task.wait(0.1)
        local h = esp(door,Color3.fromRGB(255,240,0),door,"门")
        table.insert(esptable.doors,h)

        door:WaitForChild("Open").Played:Connect(function()
          h.delete()
        end)

        door.AncestryChanged:Connect(function()
          h.delete()
        end)
      end

      local addconnect
      addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
        if room:FindFirstChild("Assets") then
          setup(room)
        end
      end

      repeat task.wait() until not flags.espdoors
      addconnect:Disconnect()

      for i,v in pairs(esptable.doors) do
        v.delete()
      end
    end
  end})

Esp:AddToggle({
  Name ="追踪钥匙/拉杆",
  Default = false,
  Callback = function(val)
    flags.espkeys = val

    if val then
      local function check(v)
        if v:IsA("Model") and (v.Name == "LeverForGate" or v.Name == "KeyObtain") then
          task.wait(0.1)
          if v.Name == "KeyObtain" then
            local hitbox = v:WaitForChild("Hitbox")
            local parts = hitbox:GetChildren()
            table.remove(parts,table.find(parts,hitbox:WaitForChild("PromptHitbox")))

            local h = esp(parts,Color3.fromRGB(90,255,40),hitbox,"钥匙")
            table.insert(esptable.keys,h)

           elseif v.Name == "LeverForGate" then
            local h = esp(v,Color3.fromRGB(90,255,40),v.PrimaryPart,"拉杆")
            table.insert(esptable.keys,h)

            v.PrimaryPart:WaitForChild("SoundToPlay").Played:Connect(function()
              h.delete()
            end)
          end
        end
      end

      local function setup(room)
        local assets = room:WaitForChild("Assets")

        assets.DescendantAdded:Connect(function(v)
          check(v)
        end)

        for i,v in pairs(assets:GetDescendants()) do
          check(v)
        end
      end

      local addconnect
      addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
        if room:FindFirstChild("Assets") then
          setup(room)
        end
      end

      repeat task.wait() until not flags.espkeys
      addconnect:Disconnect()

      for i,v in pairs(esptable.keys) do
        v.delete()
      end
    end
  end})

Esp:AddToggle({
  Name = "追踪物品",
  Default = false,
  Callback = function(val)
    flags.espitems = val

    if val then
      local function check(v)
        if v:IsA("Model") and (v:GetAttribute("Pickup") or v:GetAttribute("PropType")) then
          task.wait(0.1)

          local part = (v:FindFirstChild("Handle") or v:FindFirstChild("Prop"))
          local h = esp(part,Color3.fromRGB(160,190,255),part,v.Name)
          table.insert(esptable.items,h)
        end
      end

      local function setup(room)
        local assets = room:WaitForChild("Assets")

        if assets then
          local subaddcon
          subaddcon = assets.DescendantAdded:Connect(function(v)
            check(v)
          end)

          for i,v in pairs(assets:GetDescendants()) do
            check(v)
          end

          task.spawn(function()
            repeat task.wait() until not flags.espitems
            subaddcon:Disconnect()
          end)
        end
      end

      local addconnect
      addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
        if room:FindFirstChild("Assets") then
          setup(room)
        end
      end

      repeat task.wait() until not flags.espitems
      addconnect:Disconnect()

      for i,v in pairs(esptable.items) do
        v.delete()
      end
    end
  end})

Esp:AddToggle({
  Name = "追踪书/电池",
  Default = false,
  Callback = function(val)
    flags.espbooks = val

    if val then
      local function check(v)
        if v:IsA("Model") and (v.Name == "LiveHintBook" or v.Name == "LiveBreakerPolePickup") then
          task.wait(0.1)

          local h = esp(v,Color3.fromRGB(160,190,255),v.PrimaryPart,"书")
          table.insert(esptable.books,h)

          v.AncestryChanged:Connect(function()
            if not v:IsDescendantOf(room) then
              h.delete()
            end
          end)
        end
      end

      local function setup(room)
        if room.Name == "50" or room.Name == "100" then
          room.DescendantAdded:Connect(function(v)
            check(v)
          end)

          for i,v in pairs(room:GetDescendants()) do
            check(v)
          end
        end
      end

      local addconnect
      addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
        setup(room)
      end

      repeat task.wait() until not flags.espbooks
      addconnect:Disconnect()

      for i,v in pairs(esptable.books) do
        v.delete()
      end
    end
  end})

local entitynames = {"RushMoving","AmbushMoving","Snare","A60","A120"}
Esp:AddToggle({
  Name = "追踪怪物",
  Default = false,
  Callback = function(val)
    flags.esprush = val

    if val then
      local addconnect
      addconnect = workspace.ChildAdded:Connect(function(v)
        if table.find(entitynames,v.Name) then
          task.wait(0.1)

          local h = esp(v,Color3.fromRGB(255,25,25),v.PrimaryPart,v.Name:gsub("Moving",""))
          table.insert(esptable.entity,h)
        end
      end)

      local function setup(room)
        if room.Name == "50" or room.Name == "100" then
          local figuresetup = room:WaitForChild("FigureSetup")

          if figuresetup then
            local fig = figuresetup:WaitForChild("FigureRagdoll")
            task.wait(0.1)

            local h = esp(fig,Color3.fromRGB(255,25,25),fig.PrimaryPart,"Figure")
            table.insert(esptable.entity,h)
          end
         else
          local assets = room:WaitForChild("Assets")

          local function check(v)
            if v:IsA("Model") and table.find(entitynames,v.Name) then
              task.wait(0.1)

              local h = esp(v:WaitForChild("Base"),Color3.fromRGB(255,25,25),v.Base,"Snare")
              table.insert(esptable.entity,h)
            end
          end

          assets.DescendantAdded:Connect(function(v)
            check(v)
          end)

          for i,v in pairs(assets:GetDescendants()) do
            check(v)
          end
        end
      end

      local roomconnect
      roomconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
        setup(room)
      end

      repeat task.wait() until not flags.esprush
      addconnect:Disconnect()
      roomconnect:Disconnect()

      for i,v in pairs(esptable.entity) do
        v.delete()
      end
    end
  end})

Esp:AddToggle({
  Name = "储物柜追踪",
  Default = false,
  Callback = function(val)
    flags.esplocker = val

    if val then
      local function check(v)
        if v:IsA("Model") then
          task.wait(0.1)
          if v.Name == "Wardrobe" then
            local h = esp(v.PrimaryPart,Color3.fromRGB(145,100,25),v.PrimaryPart,"柜子")
            table.insert(esptable.lockers,h)
           elseif (v.Name == "Rooms_Locker" or v.Name == "Rooms_Locker_Fridge") then
            local h = esp(v.PrimaryPart,Color3.fromRGB(145,100,25),v.PrimaryPart,"储物柜")
            table.insert(esptable.lockers,h)
          end
        end
      end

      local function setup(room)
        local assets = room:WaitForChild("Assets")

        if assets then
          local subaddcon
          subaddcon = assets.DescendantAdded:Connect(function(v)
            check(v)
          end)

          for i,v in pairs(assets:GetDescendants()) do
            check(v)
          end

          task.spawn(function()
            repeat task.wait() until not flags.esplocker
            subaddcon:Disconnect()
          end)
        end
      end

      local addconnect
      addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
        setup(room)
      end

      repeat task.wait() until not flags.esplocker
      addconnect:Disconnect()

      for i,v in pairs(esptable.lockers) do
        v.delete()
      end
    end
  end})

Esp:AddToggle({
  Name = "追踪箱子",
  Default = false,
  Callback = function(val)
    flags.espchest = val

    if val then
      local function check(v)
        if v:IsA("Model") then
          task.wait(0.1)
          if v.Name == "ChestBox" then
            warn(v.Name)
            local h = esp(v,Color3.fromRGB(205,120,255),v.PrimaryPart,"箱子")
            table.insert(esptable.chests,h)
           elseif v.Name == "ChestBoxLocked" then
            local h = esp(v,Color3.fromRGB(255,120,205),v.PrimaryPart,"Locked Chest")
            table.insert(esptable.chests,h)
          end
        end
      end

      local function setup(room)
        local subaddcon
        subaddcon = room.DescendantAdded:Connect(function(v)
          check(v)
        end)

        for i,v in pairs(room:GetDescendants()) do
          check(v)
        end

        task.spawn(function()
          repeat task.wait() until not flags.espchest
          subaddcon:Disconnect()
        end)
      end

      local addconnect
      addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
        if room:FindFirstChild("Assets") then
          setup(room)
        end
      end

      repeat task.wait() until not flags.espchest
      addconnect:Disconnect()

      for i,v in pairs(esptable.chests) do
        v.delete()
      end
    end
  end})

Esp:AddToggle({
  Name ="追踪玩家",
  Default = false,
  Callback = function(val)
    flags.esphumans = val

    if val then
      local function personesp(v)
        v.CharacterAdded:Connect(function(vc)
          local vh = vc:WaitForChild("Humanoid")
          local torso = vc:WaitForChild("UpperTorso")
          task.wait(0.1)

          local h = esp(vc,Color3.fromRGB(255,255,255),torso,v.DisplayName)
          table.insert(esptable.people,h)
        end)

        if v.Character then
          local vc = v.Character
          local vh = vc:WaitForChild("Humanoid")
          local torso = vc:WaitForChild("UpperTorso")
          task.wait(0.1)

          local h = esp(vc,Color3.fromRGB(255,255,255),torso,v.DisplayName)
          table.insert(esptable.people,h)
        end
      end

      local addconnect
      addconnect = game.Players.PlayerAdded:Connect(function(v)
        if v ~= plr then
          personesp(v)
        end
      end)

      for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= plr then
          personesp(v)
        end
      end

      repeat task.wait() until not flags.esphumans
      addconnect:Disconnect()

      for i,v in pairs(esptable.people) do
        v.delete()
      end
    end
  end})

Esp:AddToggle({
  Name = "追踪金币",
  Default = false,
  Callback = function(val)
    flags.espgold = val

    if val then
      local function check(v)
        if v:IsA("Model") then
          task.wait(0.1)
          local goldvalue = v:GetAttribute("GoldValue")

          if goldvalue and goldvalue >= flags.goldespvalue then
            local hitbox = v:WaitForChild("Hitbox")
            local h = esp(hitbox:GetChildren(),Color3.fromRGB(255,255,0),hitbox,"金币 [".. tostring(goldvalue).."]")
            table.insert(esptable.gold,h)
          end
        end
      end

      local function setup(room)
        local assets = room:WaitForChild("Assets")

        local subaddcon
        subaddcon = assets.DescendantAdded:Connect(function(v)
          check(v)
        end)

        for i,v in pairs(assets:GetDescendants()) do
          check(v)
        end

        task.spawn(function()
          repeat task.wait() until not flags.espchest
          subaddcon:Disconnect()
        end)
      end

      local addconnect
      addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
        setup(room)
      end)

      for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
        if room:FindFirstChild("Assets") then
          setup(room)
        end
      end

      repeat task.wait() until not flags.espgold
      addconnect:Disconnect()

      for i,v in pairs(esptable.gold) do
        v.delete()
      end
    end
  end})
  
-----------------------------------------------------自动

local Automatic = Automatic:AddSection({
	Name = "自动功能"
})

Automatic:AddToggle({
  Name = "自动收集",
  Default = false,
  Callback = function(val)
    flags.draweraura = val
    
    if val then
        local function setup(room)
            local function check(v)
                if v:IsA("Model") then
                    if v.Name == "DrawerContainer" then
                        local knob = v:WaitForChild("Knobs")
                        
                        if knob then
                            local prompt = knob:WaitForChild("ActivateEventPrompt")
                            local interactions = prompt:GetAttribute("Interactions")
                            
                            if not interactions then
                                task.spawn(function()
                                    repeat task.wait(0.1)
                                        if plr:DistanceFromCharacter(knob.Position) <= 12 then
                                            fireproximityprompt(prompt)
                                        end
                                    until prompt:GetAttribute("Interactions") or not flags.draweraura
                                end)
                            end
                        end
                    elseif v.Name == "GoldPile" then
                        local prompt = v:WaitForChild("LootPrompt")
                        local interactions = prompt:GetAttribute("Interactions")
                            
                        if not interactions then
                            task.spawn(function()
                                repeat task.wait(0.1)
                                    if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then
                                        fireproximityprompt(prompt) 
                                    end
                                until prompt:GetAttribute("Interactions") or not flags.draweraura
                            end)
                        end
                    elseif v.Name:sub(1,8) == "ChestBox" then
                        local prompt = v:WaitForChild("ActivateEventPrompt")
                        local interactions = prompt:GetAttribute("Interactions")
                        
                        if not interactions then
                            task.spawn(function()
                                repeat task.wait(0.1)
                                    if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then
                                        fireproximityprompt(prompt)
                                    end
                                until prompt:GetAttribute("Interactions") or not flags.draweraura
                            end)
                        end
                    elseif v.Name == "RolltopContainer" then
                        local prompt = v:WaitForChild("ActivateEventPrompt")
                        local interactions = prompt:GetAttribute("Interactions")
                        
                        if not interactions then
                            task.spawn(function()
                                repeat task.wait(0.1)
                                    if plr:DistanceFromCharacter(v.PrimaryPart.Position) <= 12 then
                                        fireproximityprompt(prompt)
                                    end
                                until prompt:GetAttribute("Interactions") or not flags.draweraura
                            end)
                        end
                    end 
                end
            end
    
            local subaddcon
            subaddcon = room.DescendantAdded:Connect(function(v)
                check(v) 
            end)
            
            for i,v in pairs(room:GetDescendants()) do
                check(v)
            end
            
            task.spawn(function()
                repeat task.wait() until not flags.draweraura
                subaddcon:Disconnect() 
            end)
        end
        
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            setup(room)
        end)
        
        for i,room in pairs(workspace.CurrentRooms:GetChildren()) do
            if room:FindFirstChild("Assets") then
                setup(room) 
            end
        end
        
        repeat task.wait() until not flags.draweraura
        addconnect:Disconnect()
    end
end
})

Automatic:AddButton({
  Name = "自动完成电闸游戏",
  Callback = function()
   game:GetService("ReplicatedStorage").Bricks.EBF:FireServer()
    end
})

Automatic:AddToggle({
	Name = "自动跳过房间",
	Default = false,
    Save = false,
    Flag = "AutoSkip"
})


Automatic:AddToggle({
  Name = "自动破解图书馆密码",
  Default = false,
  Callback = function(val)
    flags.getcode = val
    
    if val then
        local function deciphercode()
        local paper = char:FindFirstChild("LibraryHintPaper")
        local hints = plr.PlayerGui:WaitForChild("PermUI"):WaitForChild("Hints")
        
        local code = {[1]="_",[2]="_",[3]="_",[4]="_",[5]="_"}
            
            if paper then
                for i,v in pairs(paper:WaitForChild("UI"):GetChildren()) do
                    if v:IsA("ImageLabel") and v.Name ~= "Image" then
                        for i,img in pairs(hints:GetChildren()) do
                            if img:IsA("ImageLabel") and img.Visible and v.ImageRectOffset == img.ImageRectOffset then
                                local num = img:FindFirstChild("TextLabel").Text
                                
                                code[tonumber(v.Name)] = num 
                            end
                        end
                    end
                end 
            end
            
            return code
        end
        
        local addconnect
        addconnect = char.ChildAdded:Connect(function(v)
            if v:IsA("Tool") and v.Name == "LibraryHintPaper" then
                task.wait()
                
                local code = table.concat(deciphercode())
                
                if code:find("_") then
                    message("请获取书籍")
                else
                    message("密码: ".. code)
                end
            end
        end)
        
        repeat task.wait() until not flags.getcode
        addconnect:Disconnect()
    end
end
})

---------------自动

local Entity = Entity:AddSection({
	Name = "实体功能"
})

Entity:AddButton({
  Name = "大厅变KFC",
  Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/MCDonalds"))()
    end
})

Entity:AddButton({
  Name = "大厅时空裂缝",
  Callback = function()
   local Table =  workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("Desk_Bell", true)
local RiftCFrame = Table.Base.CFrame
local model = game:GetObjects("rbxassetid://12500938429")[1]
model.Parent = workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
model:PivotTo(RiftCFrame)

model.Center.Prompt.Triggered:Connect(function()
    local Rift = model.Center
    model.Center.Prompt.Enabled = false
               
    task.spawn(function() 
        _G.OnShop = true

        loadstring(game:HttpGet('https://raw.githubusercontent.com/DeividComSono/Scripts/main/Scanner.lua'))()
    end)
    
    for _,v in pairs(Rift.ParticlesIn:GetChildren()) do
        v.Enabled = false
    end
    
    for _,v in pairs(Rift:GetDescendants()) do
        if v:IsA("Sound") then
            v.Volume = 0
        end
    end

    for _,v in pairs(Rift:GetDescendants()) do
        if v:IsA("Light") then
            v.Enabled = false
        end
    end

    Rift.ItemHolder.Item.Enabled = false
    Rift.Parent.Rift.Transparency = 1

    Rift.ParticlesOut.Core:Emit(5)
    Rift.ParticlesOut.Explosion:Emit(1)
    Rift.ParticlesOut.RiftLines2:Emit(1)
    Rift.ParticlesOut.RiftLines:Emit(1)
    Rift.ParticlesOut.Triangles:Emit(5)
    Rift.ParticlesOut.ZoomParticle:Emit(5)
end)
    end
})
  
Entity:AddButton({
  Name = "变身Seek(第一人称)",
  Callback = function()
   MorphedEntity = game:GetObjects("rbxassetid://12388758648")[1] game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true MorphedEntity.Name = "MorphedEntity" MorphedEntity.Parent = game.ReplicatedStorage local emergeAnim = MorphedEntity.SeekRig.AnimationController:LoadAnimation(MorphedEntity.SeekRig.Animations.raise) game:GetService("Workspace")["Ambience_Seek"]:Play() game:GetService("Workspace")["Ambience_Seek"].Looped = true MorphedEntity.Figure.CanCollide = false task.spawn(function() game:GetService("RunService").RenderStepped:Connect(function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20 MorphedEntity:PivotTo(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0.2, 0)) end) end) for i,v in pairs(MorphedEntity.SeekRig:GetChildren()) do if v.Name == "StringCheese" then v.Enabled = true end end emergeAnim:Play() MorphedEntity.Parent = game.Workspace wait(6.85) for i,v in pairs(MorphedEntity.SeekRig:GetChildren()) do if v.Name == "StringCheese" then v.Enabled = false end end wait(.15) 			emergeAnim:Stop() MorphedEntity.SeekRig.AnimationController:LoadAnimation(MorphedEntity.SeekRig.Animations.run):Play() MorphedEntity.Figure.Footsteps.Looped = true MorphedEntity.Figure.Footsteps:Play() MorphedEntity.Figure.FootstepsFar.Looped = true MorphedEntity.Figure.FootstepsFar:Play() game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false local Pos = MorphedEntity.SeekRig.SeekPuddle.Position.Y - 2.5 repeat MorphedEntity.SeekRig.SeekPuddle.Position = MorphedEntity.SeekRig.SeekPuddle.Position - Vector3.new(0, 0.035, 0) wait() MorphedEntity.SeekRig.SeekPuddle.ParticleHitbox.Position = MorphedEntity.SeekRig.SeekPuddle.ParticleHitbox.Position - Vector3.new(0, 0.035, 0) wait() until MorphedEntity.SeekRig.SeekPuddle.Position.Y < Pos MorphedEntity.SeekRig.SeekPuddle:Destroy()
    end
})

Entity:AddButton({
  Name = "变身Screech",
  Callback = function()
   local Screech = game:GetService("ReplicatedStorage").Entities.Screech:Clone()
for i,v in pairs(game.Workspace:GetChildren()) do
    if v.Name == "Screech" then
        v:Destroy()
    end
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v:IsA("MeshPart") then
        v.Transparency = 1
    end
    if v:IsA("Part") then
        v.Transparency = 1
    end
    if v:IsA("Accessory") then
        v:Destroy()
    end
    game.Players.LocalPlayer.Character.Head.face.Transparency = 1
end
Screech.Parent = game.Workspace
game:GetService("RunService").RenderStepped:Connect(function()
   Screech:PivotTo(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0.2, -1.25))
end)
Screech.AnimationController:LoadAnimation(Screech.Animations.Idle):Play()
    end
})

Entity:AddButton({
	Name = "有伤害Rush",
	Callback = function()
  local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Rush", -- Custom name of your entity
    Model = "https://github.com/Johnny39871/assets/blob/main/Rush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 100, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 25,
    BreakLights = true,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 1,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        true, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(0, 0, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 4,
                Max = 4,
            },
        },
    },
    CustomDialog = {"你死于Rush.", "....", "...."}, -- Custom death message
})

Creator.runEntity(entity)
    end
})

Entity:AddButton({
	Name = "有伤害Ambush",
	Callback = function()
  local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

-- Create entity
local entity = Creator.createEntity({
    CustomName = "Ambush", -- Custom name of your entity
    Model = "https://github.com/RegularVynixu/Utilities/blob/main/Doors%20Entity%20Spawner/Models/Ambush.rbxm?raw=true", -- Can be GitHub file or rbxassetid
    Speed = 200, -- Percentage, 100 = default Rush speed
    DelayTime = 2, -- Time before starting cycles (seconds)
    HeightOffset = 0,
    CanKill = true,
    KillRange = 25,
    BreakLights = true,
    BackwardsMovement = false,
    FlickerLights = {
        true, -- Enabled/Disabled
        1, -- Time (seconds)
    },
    Cycles = {
        Min = 2,
        Max = 6,
        WaitTime = 2,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Image1 = "rbxassetid://10483855823", -- Image1 url
            Image2 = "rbxassetid://10483999903", -- Image2 url
            Shake = true,
            Sound1 = {
                10483790459, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Sound2 = {
                10483837590, -- SoundId
                { Volume = 0.5 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(0, 0, 255), -- Color
            },
            Tease = {
                true, -- Enabled/Disabled
                Min = 4,
                Max = 4,
            },
        },
    },
    CustomDialog = {"你死于Ambush...", "你在看什么"}, -- Custom death message
})

Creator.runEntity(entity)
    end
})

local EnabledEntities={
    EnabledScreech=false,
    EnabledHalt=false,
    EnabledGlitch=false,
}

Entity:AddToggle({
    Name = "禁用Screech伤害",
	CurrentValue = false,
	Flag = "IgnoreScreech",
	Callback = function(Value)
        EnabledEntities.EnabledScreech = Value
	end
})

Entity:AddToggle({
    Name = "禁用Glitch伤害",
	CurrentValue = false,
	Flag = "IgnoreGlitch",
	Callback = function(Value)
        EnabledEntities.EnabledGlitch = Value
	end
})

Entity:AddToggle({
    Name = "禁用Halt伤害",
	CurrentValue = false,
	Flag = "IgnoreHalt",
	Callback = function(Value)
        EnabledEntities.EnabledHalt = Value
	end
})

workspace.Camera.ChildAdded:Connect(function(c)
    if c.Name == "Screech" then
        wait(0.1)
        if EnabledEntities.EnabledScreech then
            removeDebris(c, 0)
        end
    end

    if c.Name == "Shade" then
        wait(.1)
        if EnabledEntities.EnabledHalt then
            removeDebris(c, 0)
        end
    end
end)

workspace.CurrentRooms.ChildAdded:Connect(function()
    if EnabledEntities.EnabledGlitch then
        local currentRoom=game.Players.LocalPlayer:GetAttribute("CurrentRoom")
        local roomAmt=#workspace.CurrentRooms:GetChildren()
        local lastRoom=game.ReplicatedStorage.GameData.LatestRoom.Value
    
        if roomAmt>=4 and currentRoom<lastRoom-3 then
            game.Players.LocalPlayer.Character:PivotTo(CFrame.new(lastRoom.RoomStart.Position))
        end    
    end
end)

----------------------------删除
local delete = delete:AddSection({
	Name = "删除功能"
})

delete:AddToggle({
  Name = "删除Seek追逐",
  Default = false,
  Callback = function(val)
    flags.noseek = val
    
    if val then
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            local trigger = room:WaitForChild("TriggerEventCollision",2)
            
            if trigger then
                trigger:Destroy() 
            end
        end)
        
        repeat task.wait() until not flags.noseek
        addconnect:Disconnect()
    end
end
})

delete:AddToggle({
  Name = "删除大门",
  Default = false,
  Callback = function(val)
    flags.nogates = val
    
    if val then
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            local gate = room:WaitForChild("Gate",2)
            
            if gate then
                local door = gate:WaitForChild("ThingToOpen",2)
                
                if door then
                    door:Destroy() 
                end
            end
        end)
        
        repeat task.wait() until not flags.nogates
        addconnect:Disconnect()
    end
end
})

delete:AddToggle({
  Name = "删除拼图门",
  Default = false,
  Callback = function(val)
    flags.nopuzzle = val
    
    if val then
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            local assets = room:WaitForChild("Assets")
            local paintings = assets:WaitForChild("Paintings",2)
            
            if paintings then
                local door = paintings:WaitForChild("MovingDoor",2)
            
                if door then
                    door:Destroy() 
                end 
            end
        end)
        
        repeat task.wait() until not flags.nopuzzle
        addconnect:Disconnect()
    end
end
})

local screechremote = entityinfo:FindFirstChild("Screech")

if screechremote then
    
delete:AddToggle({
  Name = "删除Screech",
  Default = false,
  Callback = function(val)
        flags.noscreech = val
        
        if val then
            screechremote.Parent = nil
            repeat task.wait() until not flags.noscreech
            screechremote.Parent = entityinfo
        end
    end
})
end

delete:AddButton({
  Name = "删除恐惧",
  Callback = function()
   game:GetService("ReplicatedStorage").Bricks.Jumpscare:Destroy()
    end
})

delete:AddToggle({
  Name = "删除骷髅门",
  Default = false,
  Callback = function(val)
    flags.noskeledoors = val
    
    if val then
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            local door = room:WaitForChild("Wax_Door",2)
            
            if door then
                door:Destroy() 
            end
        end)
        
        repeat task.wait() until not flags.noskeledoors
        addconnect:Disconnect()
    end
end
})

delete:AddToggle({
  Name = "删除A-000锁",
  Default = false,
  Callback = function(val)
    flags.roomsnolock = val
    
    if val then
        local function check(room)
            local door = room:WaitForChild("RoomsDoor_Entrance",2)
            
            if door then
                local prompt = door:WaitForChild("Door"):WaitForChild("EnterPrompt")
                prompt.Enabled = true
            end 
        end
        
        local addconnect
        addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room)
            check(room)
        end)
        
        for i,v in pairs(workspace.CurrentRooms:GetChildren()) do
            check(room)
        end
        
        repeat task.wait() until not flags.roomsnolock
        addconnect:Disconnect()
    end
end
})

-------------删除





local Section = Tab:AddSection({
	Name = "娱乐功能"
})

Section:AddParagraph("购买东西时开启")

Tab:AddButton({
	Name = "拯救耶稣",
	Callback = function()
	local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xinhaoxian/doors/main/zjysOQHAIAIWHWVGSAIWHAAH64648454.lua"))()
  	end
})

Tab:AddButton({
	Name = "答辩剪刀",
	Callback = function()
local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))()
local UIS = game:GetService("UserInputService")
local exampleTool = LoadCustomInstance("rbxassetid://") -- wand model

if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.ItemShop.Visible == true then
    -- Create custom shop item
    CustomShop.CreateItem(exampleTool, {
        Title = "shit",
        Desc = "图片答辩模型剪刀",
        Image = "https://raw.githubusercontent.com/persopoiu/scripts/main/66963_easter_egg_green_icon.png",
        Price = "免费",
        Stack = 1,
    })
    ----------------------------------------- parenting
else
    exampleTool.Parent = game.Players.LocalPlayer.Backpack
end
local Tool = game:GetObjects("rbxassetid://12685165702")[1]
local Humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
local Sound = Instance.new("Sound")

Tool.Parent = game.Players.LocalPlayer.Backpack

Sound.PlaybackSpeed = 1.25
Sound.SoundId = "rbxassetid://9118823101"
Sound.Parent = Tool

Tool.Activated:Connect(function()
    local Use = Tool.Animations.use
    local UseTrack = Humanoid:LoadAnimation(Use)

    UseTrack:Play()
    Sound:Play()
    wait(0.25)
    Sound:Play()
    game:GetService("Players").LocalPlayer:GetMouse().Target:FindFirstAncestorOfClass("Model"):Destroy()
end)

Tool.Equipped:Connect(function()
    local Idle = Tool.Animations.idle
    local IdleTrack = Humanoid:LoadAnimation(Idle)

    IdleTrack:Play()
end)
Tool.Unequipped:Connect(function()
    for _,anim in pairs(Humanoid.Animator:GetPlayingAnimationTracks()) do
        anim:Stop()
    end
end)
end
})

Tab:AddButton({
	Name = "彩虹剑",
	Callback = function()
	local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))()
local UIS = game:GetService("UserInputService")
local exampleTool = LoadCustomInstance("rbxassetid://") -- wand model

if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.ItemShop.Visible == true then
    -- Create custom shop item
    CustomShop.CreateItem(exampleTool, {
        Title = "彩虹剑",
        Desc = "awa",
        Image = "https://raw.githubusercontent.com/persopoiu/scripts/main/66963_easter_egg_green_icon.png",
        Price = "free",
        Stack = 1,
    })
    ----------------------------------------- parenting
else
    exampleTool.Parent = game.Players.LocalPlayer.Backpack
end
      	local shadow=game:GetObjects("rbxassetid://159229806")[1]
        shadow.Parent = game.Players.LocalPlayer.Backpack
        local anim = Instance.new("Animation")
        anim.AnimationId = 'https://www.roblox.com/Assest?ID=159229806'
        local track
         
        shadow.Equipped:Connect(function()
            track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim) 
                track.Priority = Enum.AnimationPriority.Action
                track:Play()
                track.Looped = true
         
        end)
         
        shadow.Unequipped:Connect(function()
            if track then
                track:Stop()
            end
        end)
  	end
})

Tab:AddButton({
	Name = "蛋糕",
	Callback = function()
	local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))()
local UIS = game:GetService("UserInputService")
local exampleTool = LoadCustomInstance("rbxassetid://") -- wand model

if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.ItemShop.Visible == true then
    -- Create custom shop item
    CustomShop.CreateItem(exampleTool, {
        Title = "蛋糕",
        Desc = "可以最后一块就不能吃了",
        Image = "https://raw.githubusercontent.com/persopoiu/scripts/main/66963_easter_egg_green_icon.png",
        Price = "免费",
        Stack = 1,
    })
    ----------------------------------------- parenting
else
    exampleTool.Parent = game.Players.LocalPlayer.Backpack
end
local tool = game:GetObjects("rbxassetid://13175107839")[1]
tool.Parent = game.Players.LocalPlayer.Backpack
tool.Activated:Connect(function()
    tool.Eat:play()
    tool.Cake:Destroy()
    task.wait(1)
    tool.yay:Play()
    end)
  	end
})

Tab:AddButton({
	Name = "狙击枪",
	Callback = function()
	local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))()
local UIS = game:GetService("UserInputService")
local exampleTool = LoadCustomInstance("rbxassetid://") -- wand model

if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.ItemShop.Visible == true then
    -- Create custom shop item
    CustomShop.CreateItem(exampleTool, {
        Title = "狙击枪",
        Desc = ":）",
        Image = "https://cdn.discordapp.com/attachments/1049016956231102465/1078727375631679688/image_2023-02-24_121721211-removebg-preview.png",
        Price = "免费",
        Stack = 1,
    })
    ----------------------------------------- parenting
else
    exampleTool.Parent = game.Players.LocalPlayer.Backpack
end
    local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local debrisService = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local runservice = game:GetService("RunService")

local SCARH = game:GetObjects("rbxassetid://13125400869")[1] or LoadCustomInstance("rbxassetid://13125400869")
SCARH.Parent = game.Players.LocalPlayer.Backpack

local shot = Instance.new("Sound", SCARH)
shot.SoundId = "rbxassetid://2025903231"
shot.Volume = 1.5
shot.PlaybackSpeed = 1.5

local bullet = game:GetObjects("rbxassetid://13115337607")[1]
bullet.Anchored = true
bullet.Massless = true

local bulletAttachment = Instance.new("Attachment", bullet)
bulletAttachment.Name = "BulletAttachment"
bullet.Parent = workspace


local bolt = SCARH.Bolt
local boltWeld = bolt.ManualWeld

local tweenService = game:GetService("TweenService")

local scopeObject
local camera = workspace.CurrentCamera
for _,deivid in ipairs(SCARH:GetDescendants()) do
    if deivid.Name == "Reticle" then
            scopeObject = deivid -- im so pro -divid
            break
        end
    end


local isTweening = false

local function tween()
    if isTweening then
        return
    end
    isTweening = true

    local startPos = bolt.ManualWeld.C0
    local tween1 = tweenService:Create(bolt.ManualWeld, TweenInfo.new(0.02, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
        C0 = bolt.ManualWeld.C0 * CFrame.new(0, 0, -0.40)
    })
    tween1:Play()
    tween1.Completed:Wait()

    local tween2 = tweenService:Create(bolt.ManualWeld, TweenInfo.new(0.02, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
        C0 = startPos
    })
    tween2:Play()
    tween2.Completed:Wait()
    
    isTweening = false
end
local function shootBullet()
    local mouse = game.Players.LocalPlayer:GetMouse()
    local targetPos = mouse.Hit.p
    local bulletPos = SCARH.Flash.Position

    local shootDirection = (mouse.Hit.p - SCARH.Handle.Position * CFrame.new(mat.random(1,3),math.random(1,3),math.random(1,3))).Unit
    local bulletClone = bullet:Clone()
    bulletClone.CFrame = CFrame.new(bulletPos, targetPos)
    bulletClone.Parent = workspace

    local bulletVelocity = shootDirection * 10000
    bulletClone.Anchored = false
    bulletClone.Massless = false
    bulletClone.CanCollide = true
    bulletClone.CanTouch = true
    bulletClone.Transparency = 0

    local bulletForce = Instance.new("BodyForce", bulletClone)
    bulletForce.Force = bulletVelocity * bulletClone:GetMass()
    bulletClone.Touched:Connect(function(part)
        local Model = part:FindFirstAncestorWhichIsA("Model")
        if Model ~= nil and Model:GetAttribute("IsCustomEntity") == true then
            Model:Destroy()
        end
    end)
    debrisService:AddItem(bulletClone, 5)

    bulletClone.Touched:Connect(function(part)
        local Model = part:FindFirstAncestorWhichIsA("Model")
        if Model ~= nil and Model:GetAttribute("IsCustomEntity") == true then
            Model:Destroy()
        end
    end)
end


SCARH.Activated:Connect(function()
    while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do 
        task.wait(0.09)
        spawn(function()
            shot:Play()
            tween()
            shootBullet()
            SCARH.Flash.Light.Enabled = true
            SCARH.Flash.lite.Enabled = true
            task.wait(0.1)
            SCARH.Flash.lite.Enabled = false
            SCARH.Flash.Light.Enabled = false
        end)
    end

end)

local isPressedRight = false
UserInputService.InputBegan:Connect(function (input, _gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        isPressedRight = true
    end
end)

UserInputService.InputEnded:Connect(function (input, _gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        isPressedRight = false
    end
end)

local rsconnection
local didTween = false

rsconnection = runservice.RenderStepped:Connect(function()
    if SCARH ~= nil then
        if isPressedRight then
            print(didTween)
            if didTween == false then
                didTween = true
                local tween = tweenService:Create(camera,TweenInfo.new(0.5),{
                    ["CFrame"] = scopeObject.CFrame * CFrame.new(0,0,-0.6)
                }):Play()
                wait(0.5)
            else
                camera.CFrame = scopeObject.CFrame
            end
        end
        if not isPressedRight then
            if didTween == true then
                local tween = tweenService:Create(camera,TweenInfo.new(0.5),{
                    ["CFrame"] = Game.Players.LocalPlayer.Character.Head.CFrame
                }):Play()
                wait(0.5)
                didTween = false
            end
        end
    else
        rsconnection:Disconnect()
        return
    end
end)

UserInputService.InputBegan:Connect(function(input)
    
    -- no ballers? :c
    if SCARH.Parent == game.Players.LocalPlayer.Character then
        if input.KeyCode == Enum.KeyCode.Q then
            print("l")
            local MagClone = SCARH.Mag:Clone()
            MagClone.Parent = workspace
            MagClone.CFrame = SCARH.Mag.CFrame
            MagClone.ManualWeld:Destroy()
            Magclone.CanCollide = true
            task.wait(10)
            MagClone:Destroy()
        end
    end
end)
  	end
})

Tab:AddButton({
	Name = "烈焰剑",
	Callback = function()
	local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))()
local UIS = game:GetService("UserInputService")
local exampleTool = LoadCustomInstance("rbxassetid://") -- wand model

if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.ItemShop.Visible == true then
    -- Create custom shop item
    CustomShop.CreateItem(exampleTool, {
        Title = "冒着火的剑",
        Desc = "冒火加光特效",
        Image = "https://raw.githubusercontent.com/persopoiu/scripts/main/66963_easter_egg_green_icon.png",
        Price = "免费",
        Stack = 1,
    })
    ----------------------------------------- parenting
else
    exampleTool.Parent = game.Players.LocalPlayer.Backpack
end
local shadow=game:GetObjects("rbxassetid://93136746")[1]
        shadow.Parent = game.Players.LocalPlayer.Backpack
        local anim = Instance.new("Animation")
        anim.AnimationId = 'https://www.roblox.com/Assest?ID=93136746'
        local track
         
        shadow.Equipped:Connect(function()
            track = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(anim) 
                track.Priority = Enum.AnimationPriority.Action
                track:Play()
                track.Looped = true
         
        end)
         
        shadow.Unequipped:Connect(function()
            if track then
                track:Stop()
            end
        end)
  	end
})

Tab:AddButton({
	Name = "枪",
	Callback = function()
	local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))()
local UIS = game:GetService("UserInputService")
local exampleTool = LoadCustomInstance("rbxassetid://12848567274") -- wand model

if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.ItemShop.Visible == true then
    -- Create custom shop item
    CustomShop.CreateItem(exampleTool, {
        Title = "枪",
        Desc = "免费",
        Image = "https://cdn.discordapp.com/attachments/1049016956231102465/1078727375631679688/image_2023-02-24_121721211-removebg-preview.png",
        Price = "枪",
        Stack = 1,
    })
    ----------------------------------------- parenting
else
    exampleTool.Parent = game.Players.LocalPlayer.Backpack
end
local tool = exampleTool
local function Shoot()
    local bullet = game:GetObjects("rbxassetid://12848374097")[1]
    task.wait()
    bullet.Anchored = false
    bullet.Massless = false
    local Sound = Instance.new("Sound", game.StarterPlayer)
    Sound.Volume = 3.5
    Sound.SoundId = "rbxassetid://5238024665"
    Sound.PlayOnRemove = true
    Sound:Destroy()
    HRP = exampleTool.BulletPart.CFrame * CFrame.Angles(0,math.rad(-90),0)
    local Attachment = Instance.new("Attachment", bullet)
    local LV = Instance.new("LinearVelocity", Attachment) -- creating the linear velocity
    LV.MaxForce = math.huge -- no need to worry about this
    LV.VectorVelocity = (game:GetService("Players").LocalPlayer:GetMouse().Hit.Position - tool.BulletPart.Position).Unit * 100-- HRP.lookVector * 50 -- change 100 with how fast you want the projectile to go
    LV.Attachment0 = Attachment --Required Attachment
    bullet.Parent = game.Workspace
    bullet.CFrame = tool.BulletPart.CFrame * CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
    bullet.Touched:Connect(function(part)
        local Model = part:FindFirstAncestorWhichIsA("Model")
        if Model ~= nil and Model:GetAttribute("IsCustomEntity") == true then
            Model:Destroy()
        end
    end)
    task.wait(0.3)
    bullet:Destroy()
    end
----------------------------------------------- Shooting!
   
UIS.InputBegan:Connect(function(input)
    if tool.Parent == game.Players.LocalPlayer.Character then
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
        getgenv().BulletType = "12848374097"
        Shoot()
       
        end
    end
end)
  	end
})

Tab:AddButton({
	Name = "无限手电筒",
	Callback = function()
	local Functions = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()
local CustomShop = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Shop%20Items/Source.lua"))()
local UIS = game:GetService("UserInputService")
local exampleTool = LoadCustomInstance("rbxassetid://") -- wand model

if game:GetService("Players").LocalPlayer.PlayerGui.MainUI.ItemShop.Visible == true then
    -- Create custom shop item
    CustomShop.CreateItem(exampleTool, {
        Title = "手电筒",
        Desc = "固定姿势无法改变无法关闭",
        Image = "https://raw.githubusercontent.com/persopoiu/scripts/main/66963_easter_egg_green_icon.png",
        Price = "免费",
        Stack = 1,
    })
    ----------------------------------------- parenting
else
    exampleTool.Parent = game.Players.LocalPlayer.Backpack
end
local shadow=game:GetObjects("rbxassetid://11475447684")[1] shadow.Parent = game.Players.LocalPlayer.Backpack local Players = game:GetService("Players") local Plr = Players.LocalPlayer local Char = Plr.Character or Plr.CharacterAdded:Wait() local Hum = Char:WaitForChild("Humanoid") local RightArm = Char:WaitForChild("RightUpperArm") local LeftArm = Char:WaitForChild("LeftUpperArm") local RightC1 = RightArm.RightShoulder.C1 local LeftC1 = LeftArm.LeftShoulder.C1 local function setupCrucifix(tool) RightArm.Name = "R_Arm" LeftArm.Name = "L_Arm" RightArm.RightShoulder.C1 = RightC1 * CFrame.Angles(math.rad(-90), math.rad(-15), 10) LeftArm.LeftShoulder.C1 = LeftC1 * CFrame.new(-0.2, -0.3, -0.5) * CFrame.Angles(math.rad(-125), math.rad(25), math.rad(25)) for _, v in next, Hum:GetPlayingAnimationTracks() do v:Stop() end end shadow.Equipped:Connect(function() setupCrucifix(shadow) game.Players.LocalPlayer:SetAttribute("Hidden", true) end) shadow.Unequipped:Connect(function() game.Players.LocalPlayer:SetAttribute("Hidden", false) RightArm.Name = "RightUpperArm" LeftArm.Name = "LeftUpperArm" RightArm.RightShoulder.C1 = RightC1 LeftArm.LeftShoulder.C1 = LeftC1 end)
  	end
})

----------------无效果区

OtherA:AddButton({
    Name = "全成就",
    Callback = function ()
        local Data = require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game)
        for i,v in pairs(require(game.ReplicatedStorage.Achievements)) do
            spawn(function()
                require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.AchievementUnlock)(nil, i)
            end)
        end
    end
})

OtherA:AddButton({
	Name = "金币",
	PlaceholderText = game.Players.LocalPlayer.PlayerGui.PermUI.Topbar.Knobs.Text,
	RemoveTextAfterFocusLost = false,
	Callback = function()
        require(game.ReplicatedStorage.ReplicaDataModule).event.Knobs:Fire(tonumber(99999))
	end
})

:AddTextbox({
	Name = "复活",
	PlaceholderText = game.Players.LocalPlayer.PlayerGui.PermUI.Topbar.Revives.Text,
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
        require(game.ReplicatedStorage.ReplicaDataModule).event.Revives:Fire(tonumber(Text))
	end
})

OtherA:AddTextbox({
	Name = "加成",
	PlaceholderText = game.Players.LocalPlayer.PlayerGui.PermUI.Topbar.Boosts.Text,
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
        require(game.ReplicatedStorage.ReplicaDataModule).event.Boosts:Fire(tonumber(Text))
    end
})

----------无效果
