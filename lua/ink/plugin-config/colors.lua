function ColorMyPencils(color)
    color = color or "nightvision"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    vim.g.nv_contrast = 'soft'

    --local functionC      = "#12940c" 
    --local variable       = "#12940c" 
    --local param          = "#12940c"
    --local keyword        = "#12940c"
    --local typeName       = "#12940c"
    --local importedType   = "#12940c"
    --local defaultLibrary = "#12940c"
    --local stringColour   = "#12940c"
    --local enumMember     = "#12940c"
    --local enum           = "#12940c"
    --local special        = "#12940c"
    --local punctuation    = "#12940c"
    --local operator       = "#12940c"
    --local number         = "#12940c"
    --local fieldProperty  = "#12940c"
    --local attributeDec   = "#12940c"
    --local boolean        = "#12940c"

    local functionC      = "#7edb63" 
    local variable       = "#46ab41" 
    local param          = "#12940c"
    local keyword        = "#12940c"--"#22621f"
    local typeName       = "#15ab65"
    local importedType   = "#15ab65"
    local defaultLibrary = "#86bc76"
    local stringColour   = "#6c8454"
    local enumMember     = "#15ab65"
    local enum           = "#22621F"
    local special        = "#86bc76"
    local punctuation    = "#12940c"
    local operator       = "#12940c"
    local number         = "#00CA60"
    local fieldProperty  = "#A4DDA1"
    local attributeDec   = "#12940c"
    local boolean        = "#12940c"

    vim.api.nvim_set_hl(0, "@function", { fg = functionC })
    vim.api.nvim_set_hl(0, "@method", { fg = functionC })
    vim.api.nvim_set_hl(0, "@variable", { fg = variable }) 
    vim.api.nvim_set_hl(0, "@variable.member", { fg = fieldProperty })
    vim.api.nvim_set_hl(0, "@parameter", { fg = param })
    vim.api.nvim_set_hl(0, "@property", { fg = fieldProperty })
    vim.api.nvim_set_hl(0, "@field", { fg = fieldProperty })
    vim.api.nvim_set_hl(0, "@keyword", { fg = keyword })
    vim.api.nvim_set_hl(0, "@punctuation", { fg = punctuation })
    vim.api.nvim_set_hl(0, "@operator", { fg = operator })
    vim.api.nvim_set_hl(0, "@number", { fg = number })
    vim.api.nvim_set_hl(0, "@boolean", { fg = boolean })
    vim.api.nvim_set_hl(0, "@attribute", { fg = attributeDec })
    vim.api.nvim_set_hl(0, "Special", { fg = special })
    vim.api.nvim_set_hl(0, "@lsp.type.enum", { fg = enum })
    vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { fg = enumMember })
    vim.api.nvim_set_hl(0, "@type.builtin", { fg = importedType }) 
    vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary", { fg = defaultLibrary })
    vim.api.nvim_set_hl(0, "@type", { fg = typeName }) 
    vim.api.nvim_set_hl(0, "@lsp.type.type", { fg = typeName })
    vim.api.nvim_set_hl(0, "@lsp.type.typeParameter", { fg = typeName })
    vim.api.nvim_set_hl(0, "@lsp.type.string", { fg = stringColour })
    vim.api.nvim_set_hl(0, "@string", { fg = stringColour })
    vim.api.nvim_set_hl(0, "@string.delimiter", { fg = punctuation })
    vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = fieldProperty })
    vim.api.nvim_set_hl(0, "@lsp.type.field", { fg = fieldProperty })
 
end

ColorMyPencils()










































