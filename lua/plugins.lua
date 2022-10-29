local packer = require("packer")

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
  return string.format('require("config/%s")', name)
end

packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })

  use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
      config= get_config("treesitter")
  }

  use 'mfussenegger/nvim-jdtls'

	use ({ "williamboman/mason.nvim",
	requires = {
		"williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
    },
	config= get_config("lsp")
		})

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "lukas-reineke/cmp-rg",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = get_config("cmp"),
  })

  use({'nvim-tree/nvim-web-devicons',
  config=get_config("icons")})

    use({
    "L3MON4D3/LuaSnip",
    requires = "saadparwaiz1/cmp_luasnip",
    config = get_config("luasnip"),
  })

   	use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} },
  config = get_config("telescope")
}

use {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
    	require('telescope').load_extension('projects')
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly', -- optional, updated every week. (see issue #1193)
  config = get_config("tree")
}
-- theme
use "rebelot/kanagawa.nvim"

use {
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'},
  config = get_config("barbar")
}

use {
    "lukas-reineke/indent-blankline.nvim",
    config = get_config("indent_blankline")
}

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = get_config("lualine")
}


-- init.lua
end)

