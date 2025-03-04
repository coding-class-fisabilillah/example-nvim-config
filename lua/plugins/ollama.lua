return {
  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "llava-llama3",
      quit_map = "q",
      retry_map = "<c-r>", -- set keymap to re-send the current prompt
      accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
      host = "cheerful-dolphin-mostly.ngrok-free.app",
      --host = "localhost",
      --port = "11434",
      display_mode = "horizontal-split", -- The display mode. Can be "float" or "split" or "horizontal-split".
      show_prompt = true, -- Shows the prompt submitted to Ollama.
      show_model = false, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = false, -- Never closes the window automatically.
      file = true, -- Write the payload to a temporary file to keep the command short.
      hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
      seed = 72,
      -- init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
      -- Function to initialize Ollama
      command = function(options)
        local body = {
          model = options.model,
          seed = options.seed,
          stream = true,
          --stream = false,
          --format = "json",
        }
        return "curl --silent --no-buffer -X POST https://" .. options.host .. "/api/chat -d $body"
        --return "curl --silent --no-buffer -X POST http://"
        --  .. options.host
        --  .. ":"
        --  .. options.port
        --  .. "/api/chat -d $body"
      end,
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a command string.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      -- list_models = '<omitted lua function>', -- Retrieves a list of model names
      debug = false, -- Prints errors and the command which is run.
    },
    config = function(_, opts)
      local gen = require("gen")
      gen.setup(opts)
      gen.prompts["Describe_Image"] = {
        prompt = "$text /run/media/officestorage/kerja/bilal_ahmed/Assets/kitchen/thumbnails/local/images/$input",
        replace = true,
      }
      gen.prompts["Write"] = {
        prompt = "$text",
        replace = true,
      }
      gen.prompts["Do_to_Text"] = {
        prompt = "$input $text",
        replace = false,
      }
    end,
    keys = {
      { "<leader>aii", ":Gen<CR>", mode = { "n", "v" } },
      {
        "<leader>ais",
        function()
          require("gen").select_model()
        end,
      },
    },
  },
}
