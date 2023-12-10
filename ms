local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/EKbJaTCT"))()

local Window = OrionLib:MakeWindow({Name = "刺客卡密系统", HidePremium = false, SaveConfig = false, IntroText = "正在启动 刺客密钥系统", ConfigFolder = "密钥系统"})
 
local Key = Window:MakeTab({
  Name = "刺客密钥",
  Icon = "rbxassetid://15509623662",
  PremiumOnly = false
})
 
playername=tostring(game.Players.LocalPlayer.Character);
 
function rightkey()
  OrionLib:MakeNotification({
    Name = "密钥正确",
    Content = "正在加载脚本中…",
    Image = "rbxassetid://15509623662",
    Time = 10
  })
end
 
function load()
  rightkey()
  loadstring(game:HttpGet("https://raw.github.com/cikeV/SFHH/main/RS.lua"))()
end
 
function wrong()
  OrionLib:MakeNotification({
    Name = "密钥错误",
    Content = "进群免费获取密钥",
    Image = "rbxassetid://15509623662",
    Time = 8
  })
end
 
--密钥和用户名的编辑区
 
function yhm()
    if Input == "cikems886" then
      load()
     else
      wrong()
    end
end

--验证区
Key:AddParagraph("欢迎使用刺客DOORS/"..playername,"")
 
Key:AddTextbox({
  Name = "请输入刺客密钥",
  Default = "",
  TextDisappear = true,
  Callback = function(Value)
    Input = Value
  end
})
 
Key:AddButton({
  Name = "确定密钥",
  Callback = function()
    yhm()
  end
})

OrionLib:Init()
