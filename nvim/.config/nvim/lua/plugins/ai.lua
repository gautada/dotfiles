-- # Plug-In Spec: AI
--
-- This is an attempt to setup an in editor AI. The OPENAI_API_KEY is set using
-- the private repo dotenv file.
--
-- ## Sub Plug-In(s)
--
-- - [avante](https://github.com/yetone/avante.nvim)
return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = "openai",

      -- this file can contain specific instructions for your project
      instructions_file = "avante.md",

      -- Avante migrated provider configs under `providers`
      -- (not `provides`) :contentReference[oaicite:3]{index=3}
      providers = {
        openai = {
          endpoint = "https://api.openai.com/v1",
          -- api_key_name = API Key is set via an environment variable in order
          -- to allow for this config to remain public.

          -- NOTE: I wanted to use gpt-X.Y-codex but the model returned errors
          -- This is because I am still too conversational in my coding style.
          model = "gpt-4.1",

          timeout = 60000, -- increase for bigger diffs / slower models

          extra_request_body = {
            temperature = 0.1,          -- low = more deterministic code
            max_completion_tokens = 8192, -- avoid cut-off on larger edits
          },
        },
      },

      -- [Tavily WebSerch]
      web_search_engine = {
        provider = "tavily",
        proxy = nil, -- e.g. "http://127.0.0.1:7890" if you need it
      },

      -- “safer-by-default” behavior for infra repos
      behaviour = {
        auto_apply_diff_after_generation = false, -- review diffs before applying
        auto_focus_sidebar = false,
      },

      -- optional: reduce noise if you already use cmp/copilot for inline completion
      auto_suggestions = false,
    },

    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
