local Update = (loadstring(Game:HttpGet("https://raw.githubusercontent.com/AnhDzaiScript/GiaoDien/refs/heads/main/UITuanAnhIOS.lua")))();

local Library = Update:Window({
	SubTitle = "NM | UI",
	Size = UDim2.new(0, 470, 0, 320),
	TabWidth = 140
});

local MainTab = Library:Tab("Main", "rbxassetid://10723407389");
local FarmTab = Library:Tab("Farming", "rbxassetid://10723415335");


(getgenv()).Load = function()
	if readfile and writefile and isfile and isfolder then
		if not isfolder("Relz Hub") then
			makefolder("Relz Hub");
		end;

		if not isfolder("Relz Hub/Blox Fruits/") then
			makefolder("Relz Hub/Blox Fruits/");
		end;

		if not isfile(("Relz Hub/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json")) then
			writefile("Relz Hub/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", (game:GetService("HttpService")):JSONEncode(_G.Settings));
		else

			local Decode = (game:GetService("HttpService")):JSONDecode(readfile("Relz Hub/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"));
			for i, v in pairs(Decode) do
				_G.Settings[i] = v;
			end;
		end;
		print("Loaded!");
	else

		return warn("Status : Undetected Executor");
	end;
end;

(getgenv()).SaveSetting = function()
	if Update:SaveSettings() then
		if readfile and writefile and isfile and isfolder then
			if not isfile(("Relz Hub/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json")) then
				(getgenv()).Load();
			else

				local Decode = (game:GetService("HttpService")):JSONDecode(readfile("Relz Hub/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"));
				local Array = {};
				for i, v in pairs(_G.Settings) do
					Array[i] = v;
				end;

				writefile("Relz Hub/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", (game:GetService("HttpService")):JSONEncode(Array));
			end;
		else

			return warn("Status : Undetected Executor");
		end;
	end;
end;

(getgenv()).Load();


MainTab:Toggle("Toggle", "Toggle", function(value)

	(getgenv()).SaveSetting();
end);

MainTab:Button("Button", function()

end);

MainTab:Dropdown("Dropdown", function(value)

	(getgenv()).SaveSetting();
end);

