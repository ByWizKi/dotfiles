-- colors.lua
local function apply_moonfly_theme()
    -- Tente d'appliquer le thème moonfly
    local status_ok, _ = pcall(vim.cmd, "colorscheme moonfly")
    if not status_ok then
        -- Si le thème moonfly n'est pas trouvé, affiche un message d'erreur
        vim.notify("Le thème moonfly n'a pas été trouvé. Veuillez vérifier l'installation.", vim.log.levels.ERROR)
    end
end

-- Exécute la fonction pour appliquer le thème
apply_moonfly_theme()

