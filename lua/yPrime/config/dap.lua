vim.cmd.packadd({'nvim-dap-ui'})
vim.cmd.packadd({'nvim-dap'})

local dap = require('dap')
local dap_widget = require('dap.ui.widgets')
local dapui = require("dapui")

dapui.setup()

dap.defaults.fallback.force_external_terminal = false
dap.defaults.fallback.external_terminal = {
	command = os.getenv('TERM');
	args = {'-e'};
}

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

vim.keymap.set('n', '<space>dc', function() dap.continue() end)
vim.keymap.set('n', '<space>do>', function() dap.step_over() end)
vim.keymap.set('n', '<space>dI', function() dap.step_into() end)
vim.keymap.set('n', '<space>dO', function() dap.step_out() end)
vim.keymap.set('n', '<space>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<space>dB', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<space>dlp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<space>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<space>dR', function() dap.run_last() end)
vim.keymap.set({'n', 'v'}, '<space>dK', function()
	dap_widget.hover()
end)
vim.keymap.set({'n', 'v'}, '<space>dp', function()
	dap_widget.preview()
end)
vim.keymap.set('n', '<space>df', function()
	dap_widget.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<space>ds', function()
	dap_widget.centered_float(widgets.scopes)
end)

vim.keymap.set('n', '<space>duo', function() dapui.open() end)
vim.keymap.set('n', '<space>duc', function() dapui.close() end)
vim.keymap.set('n', '<space>dut', function() dapui.toggle() end)
vim.keymap.set('n', '<space>duu', function() dapui.float_element() end)
vim.keymap.set({'v', 'n'}, '<space>de', function () dapui.eval() end)

dap.adapters.coreclr = {
	type = 'executable',
	command = vim.fn.stdpath('data') .. '/mason/bin/netcoredbg',
	args = {'--interpreter=vscode'}
}
dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
		end,
	},
}

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
	command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
    args = {"--port", "${port}"},
  }
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
