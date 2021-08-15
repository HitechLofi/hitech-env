local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local b = vim.b
local fn = vim.fn

local properties = {
  force_inactive = {
    filetypes = {},
    buftypes = {},
    bufnames = {}
  }
}

local components = {
  left = {
    active = {},
    inactive = {}
  },
  mid = {
    active = {},
    inactive = {}
  },
  right = {
    active = {},
    inactive = {}
  }
}

properties.force_inactive.filetypes = {
  'NvimTree',
  'dbui',
  'packer',
  'startify',
  'fugitive',
  'fugitiveblame'
}

properties.force_inactive.buftypes = {
  'terminal'
}

components.left.active[1] = {
  provider = ' ',
  hl = {
    fg = 'subtlegray',
    bg = 'white'
  }
}

-- get mode
local mode_map = {
	['n'] = '(⊃⌐■_■)⊃', -- normal
	['no'] = '(⊃⌐■_■)⊃ ?', -- normal pending
	['v'] = '( ・・)⊃-二', -- visual
	['V'] = '( ・・)⊃-二二', -- visual line
	['s'] = '( ・・)⊃-二 S', -- select
	['S'] = '( ・・)⊃-二 SL', -- select line
	['i'] = ' _〆(￣ー￣)', -- insert
	['R'] = ' ─=≡Σ((( つ＞＜)つ', -- replace
	['Rv'] = 'VISUAL_REPLACE',
	['c'] = 'v(-_-)v',
	['cv'] = 'VIM_EX',
	['ce'] = 'EX',
	['r'] = 'PROMPT',
	['rm'] = 'MORE',
	['r?'] = 'CONFIRM',
	['!'] = 'SHELL',
	['t'] = 'TERMINAL'
}
local function mode()
	local m = vim.api.nvim_get_mode().mode
	if mode_map[m] == nil then
    return '( ・・)つ●'
  end
	return mode_map[m]
end

components.left.active[2] = {
  provider = function()
    local mode = mode()
    return mode
  end,
  icon = '',
  hl = function()
    local val = {}

    val.name = vi_mode_utils.get_mode_highlight_name()
    val.fg = vi_mode_utils.get_mode_color()
    val.style = 'bold'

    return val
  end,
  left_sep = ' ',
  right_sep = ' '
}

components.left.active[3] = {
  provider = 'file_info',
  hl = {
    fg = '#FFFFFF',
    bg = 'violet',
    style = 'bold'
  },
  left_sep = {
    ' ', 'left_rounded',
    {str = ' ', hl = {bg = 'violet', fg = 'NONE'}}
  },
  right_sep = { 'right_rounded', ' ' }
}

components.left.active[4] = {
  provider = 'diagnostic_errors',
  enabled = function() return lsp.diagnostics_exist('Error') end,
  right_sep = { ' ' },
  hl = { fg = '#ff759c' }
}

components.left.active[5] = {
  provider = 'diagnostic_warnings',
  enabled = function() return lsp.diagnostics_exist('Warning') end,
  right_sep = { ' ' },
  hl = { fg = '#fff569' }
}

components.left.active[6] = {
  provider = 'diagnostic_hints',
  enabled = function() return lsp.diagnostics_exist('Hint') end,
  right_sep = { ' ' },
  hl = { fg = '#69e6ff' }
}

components.left.active[7] = {
  provider = 'diagnostic_info',
  enabled = function() return lsp.diagnostics_exist('Information') end,
  right_sep = { ' ' },
  hl = { fg = '#d4b3ff' }
}

components.left.active[8] = {
  provider = '',
  left_sep = ' ',
  hl = {
    fg = 'subtlegray',
    bg = 'white'
  }
}

components.right.active[1] = {
  provider = '',
  hl = {
    fg = 'subtlegray',
    bg = 'white'
  }
}

components.right.active[2] = {
  provider = 'git_branch',
  hl = {
    fg = '#FFFFFF',
    bg = 'black',
    style = 'bold'
  },
  right_sep = function()
    local val = {hl = {fg = 'NONE', bg = 'black'}}
    if b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

    return val
  end
}

components.right.active[3] = {
  provider = 'git_diff_added',
  hl = {
    fg = 'green',
    bg = 'black'
  }
}

components.right.active[4] = {
  provider = 'git_diff_changed',
  hl = {
    fg = 'orange',
    bg = 'black'
  }
}

components.right.active[5] = {
  provider = 'git_diff_removed',
  hl = {
    fg = 'red',
    bg = 'black'
  },
  right_sep = function()
    local val = {hl = {fg = 'NONE', bg = 'black'}}
    if b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

    return val
  end
}

components.right.active[6] = {
  provider = 'line_percentage',
  hl = {
    style = 'bold'
  },
  left_sep = ' ',
  right_sep = ' '
}

components.right.active[7] = {
  provider = ' ',
  hl = {
    fg = 'subtlegray',
    bg = 'white'
  }
}

components.left.inactive[1] = {
  provider = 'file_type',
  hl = {
    fg = '#FFFFFF',
    bg = 'violet',
    style = 'bold'
  },
  left_sep = {
    str = ' ',
    hl = {
      fg = 'NONE',
      bg = 'violet'
    }
  },
  right_sep = {
    {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'violet'
      }
    },
    'right_rounded'
  }
}

-- This table is equal to the default colors table
local colors = {
  black = '#1B1B1B',
  subtlegray = '#6B6BaB',
  skyblue = '#50B0F0',
  cyan = '#009090',
  green = '#60A040',
  oceanblue = '#0066cc',
  magenta = '#C26BDB',
  orange = '#FF9000',
  red = '#F17777',
  violet = '#371eb3',
  white = 'none',
  yellow = '#E1E120'
}

-- This table is equal to the default separators table
local separators = {
  vertical_bar = '┃',
  vertical_bar_thin = '│',
  left = '',
  right = '',
  block = '█',
  left_filled = '',
  right_filled = '',
  slant_left = '',
  slant_left_thin = '',
  slant_right = '',
  slant_right_thin = '',
  slant_left_2 = '',
  slant_left_2_thin = '',
  slant_right_2 = '',
  slant_right_2_thin = '',
  left_rounded = '',
  left_rounded_thin = '',
  right_rounded = '',
  right_rounded_thin = '',
  circle = '●'
}

-- This table is equal to the default vi_mode_colors table
local vi_mode_colors = {
  NORMAL = '#FFFFFF',
  OP = '#FFFFFF',
  INSERT = '#FFFFFF',
  VISUAL = '#FFFFFF',
  BLOCK = '#FFFFFF',
  REPLACE = '#FFFFFF',
  ['V-REPLACE'] = '#FFFFFF',
  ENTER = '#FFFFFF',
  MORE = '#FFFFFF',
  SELECT = '#FFFFFF',
  COMMAND = '#FFFFFF',
  SHELL = '#FFFFFF',
  TERM = '#FFFFFF',
  NONE = '#FFFFFF'
}

require('feline').setup({
  default_bg = 'subtlegray',
  default_fg = '#FFFFFF',
  colors = colors,
  separators = separators,
  components = components,
  properties = properties,
  vi_mode_colors = vi_mode_colors
})
