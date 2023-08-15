local dap = require('dap')

-- Mono debugger (netcoredbg) configuration
dap.adapters.netcoredbg = {
  type = 'executable',
  command = 'netcoredbg', -- Replace with the actual path
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = 'netcoredbg',
    name = 'launch - netcoredbg',
    request = 'attach',
    processId = 82050,
    stopAtEntry = true
  }
}


-- Key bindings
vim.keymap.set("n", "<F5>", function() require'dap'.continue() end, {desc="Debug: Continue"});
vim.keymap.set("n", "<F10>", function() require'dap'.step_over() end, {desc="Debug: Step over"});
vim.keymap.set("n", "<F11>", function() require'dap'.step_into() end, {desc="Debug: Step into"});
vim.keymap.set("n", "<F12>", function() require'dap'.step_out() end, {desc="Debug: Step out"});
vim.keymap.set("n", "<leader>b", function() require'dap'.toggle_breakpoint() end, {desc="Debug: Toggle breakpoint"});
vim.keymap.set("n", "<leader>B", function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, {desc="Debug: Set breakpoint"});
vim.keymap.set("n", "<leader>lp", function() require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, {desc="Debug: Set breakpoint"});
vim.keymap.set("n", "<leader>dr", function() require'dap'.repl.open() end, {desc="Debug: repl open"});
vim.keymap.set("n", "<leader>dl", function() require'dap'.run_last() end, {desc="Debug: Run last"});
