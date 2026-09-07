local cmp = require("blink.cmp")

-- Build the Rust fuzzy matcher when needed.
cmp.build():pwait()

cmp.setup({
  keymap = {
    preset = "default",
  },

  appearance = {
    nerd_font_variant = "mono",
  },

  completion = {
    menu = {
      auto_show = true,
      auto_show_delay_ms = 100,
    },

    documentation = {
      auto_show = true,
      auto_show_delay_ms = 350,
    },

    ghost_text = {
      enabled = false,
    },
  },

  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
    },
  },

  fuzzy = {
    implementation = "rust",
  },

  signature = {
    enabled = true,
  },
})
