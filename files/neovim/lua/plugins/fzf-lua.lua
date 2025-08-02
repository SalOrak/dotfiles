return {
  "ibhagwan/fzf-lua",
  dependencies = { 
	  "echasnovski/mini.icons", 
	  "rktjmp/lush.nvim" -- For automatic colorscheme generation
  },
  opts = {
      "ivy",
      keymap ={
          builtin = {
              -- neovim `:tmap` mappings for the fzf win
              -- true,        -- uncomment to inherit all the below in your custom config
              ["<M-<leader>>"]     = "hide",     -- hide fzf-lua, `:FzfLua resume` to continue
              -- ["<F1>"]        = "toggle-help",
              ["<M-F>"]        = "toggle-fullscreen",
              -- Only valid with the 'builtin' previewer
              ["<M-W>"]        = "toggle-preview-wrap",
              ["<M-P>"]        = "toggle-preview",
              -- `ts-ctx` binds require `nvim-treesitter-context`
              ["<F7>"]        = "toggle-preview-ts-ctx",
              ["<F8>"]        = "preview-ts-ctx-dec",
              ["<F9>"]        = "preview-ts-ctx-inc",
              ["<S-Left>"]    = "preview-reset",
              ["<S-down>"]    = "preview-page-down",
              ["<S-up>"]      = "preview-page-up",
              ["<M-S-down>"]  = "preview-down",
              ["<M-S-up>"]    = "preview-up",
          },
          fzf = {
              -- fzf '--bind=' options
              -- true,        -- uncomment to inherit all the below in your custom config
              ["ctrl-z"]      = "abort",
              ["ctrl-u"]      = "unix-line-discard",
              ["ctrl-f"]      = "half-page-down",
              ["ctrl-b"]      = "half-page-up",
              ["ctrl-a"]      = "beginning-of-line",
              ["ctrl-e"]      = "end-of-line",
              ["alt-a"]       = "toggle-all",
              ["alt-A"]       = "select-all",
              ["alt-g"]       = "first",
              ["alt-G"]       = "last",
              -- Only valid with fzf previewers (bat/cat/git/etc)
              ["alt-w"]          = "toggle-preview-wrap",
              ["alt-p"]          = "toggle-preview",
              ["alt-j"]    = "preview-page-down",
              ["alt-k"]    = "preview-page-up",
          }
      }
  }
}
