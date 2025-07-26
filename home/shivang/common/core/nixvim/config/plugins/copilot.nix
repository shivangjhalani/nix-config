{
  programs.nixvim = {
    plugins.copilot-lua = {
      enable = true;
    };

    plugins.copilot-cmp = {
      enable = true;
    };

    plugins.copilot-chat = {
      enable = false;
      settings = {
        model = "claude-3.5-sonnet";
        suggestion.enabled = false;
        panel.enabled = false;
        answer_header = "## Copilot ";
        question_header = "## User ";
        error_header = "## Error ";
        auto_follow_cursor = false;
        mappings = {
          accept_diff = {
            insert = "<C-y>";
            normal = "<C-y>";
          };
          close = {
            insert = "<C-c>";
            normal = "q";
          };
          complete = {
            insert = "<Tab>";
          };
          jump_to_diff = {
            normal = "gj";
          };
          quickfix_diffs = {
            normal = "gq";
          };
          reset = {
            insert = "<C-l>";
            normal = "<C-l>";
          };
          show_context = {
            normal = "gc";
          };
          show_diff = {
            normal = "gd";
          };
          show_help = {
            normal = "gh";
          };
          show_info = {
            normal = "gi";
          };
          submit_prompt = {
            insert = "<C-s>";
            normal = "<CR>";
          };
          toggle_sticky = {
            detail = "Makes line under cursor sticky or deletes sticky line.";
            normal = "gr";
          };
          yank_diff = {
            normal = "gy";
            register = "\"";
          };
        };
        prompts = {
          Commit = {
            prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.";
            selection = "require('CopilotChat.select').gitdiff";
          };
          CommitStaged = {
            prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.";
            selection = ''
              function(source)
                return select.gitdiff(source, true)
              end
            '';
          };
          Docs = {
            prompt = "/COPILOT_GENERATE Please add documentation comment for the selection.";
          };
          Explain = {
            prompt = "/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.";
          };
          Fix = {
            prompt = "/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.";
          };
          FixDiagnostic = {
            prompt = "Please assist with the following diagnostic issue in file:";
            selection = "require('CopilotChat.select').diagnostics";
          };
          Optimize = {
            prompt = "/COPILOT_GENERATE Optimize the selected code to improve performance and readablilty.";
          };
          Review = {
            callback = ''
              function(response, source)
                -- see config.lua for implementation
              end
            '';
            prompt = "/COPILOT_REVIEW Review the selected code.";
          };
          Tests = {
            prompt = "/COPILOT_GENERATE Please generate tests for my code.";
          };
        };
        show_help = false;
        window = {
          layout = "vertical";
          # relative = "editor";
        };
      };
    };
  };
}
