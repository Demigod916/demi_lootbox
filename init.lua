if IsDuplicityVersion() then
	Bridge = {}
	PlayerLootQueue = {}
	PoolSize = 100
	Debug = true
end

---source https://github.com/overextended/ox_inventory/blob/main/init.lua#L194
if not LoadResourceFile(GetCurrentResourceName(), "web/build/index.html") then
	return error("^1UI has not been built, build the UI or download a release build.^0")
end