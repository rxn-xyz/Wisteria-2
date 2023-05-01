-- Wisteria 2 | xyz
-- Loader
repeat task.wait() until game:IsLoaded() and game:GetService("Players"); task.wait(5); if game.PlaceId ~= 11573834824 then return end
-- Reroll
task.spawn(function()
	while true do task.wait()
		pcall(function()
			-- Player Variables
			local Players = game:GetService("Players")
			local LocalPlayer = Players.LocalPlayer
			local PlayerGui = LocalPlayer.PlayerGui
			-- Wisteria 2 Variables
			local Clan = PlayerGui:WaitForChild("CC"):WaitForChild("Main"):WaitForChild("Clan")
			-- Data Rollback
			PlayerGui.Gui.Ui.UiModule.Modules.Settings.Set:InvokeServer(1, "\255")
			-- Reroll
			Clan.RRLastName.LocalScript.RR:InvokeServer("RRLastName"); task.wait(0.05)
			-- Check Clan
			print(Clan.LName.Text)
			if table.find(Clans, Clan.LName.Text) then
				-- Save Data
				PlayerGui.Gui.Ui.UiModule.Modules.Settings.Set:InvokeServer(1, "B")
				-- Webhook
				if Webhook[1] then
					local Data = {
						["content"] = "@everyone",
						["embeds"] = {{
								["title"] = "**Clan Obtained**",
								["description"] = "Clan: " .. Clan.LName.Text .. "\n" .. "Account: " .. LocalPlayer.Name,
								["type"] = "rich",
								["color"] = tonumber(0x7269da),
						}}
					}
					syn.request({Url = Webhook[2], Body = game:GetService("HttpService"):JSONEncode(Data), Method = "POST", Headers = {["content-type"] = "application/json"}})
				end
			break end
			-- Check Spins
			if Clan.Spins.Text == "0 Spins Left" then
				game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
			break end
		end)
	end
end)
-- End
