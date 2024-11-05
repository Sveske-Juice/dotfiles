vim.notify("Starting Godot server...");
vim.lsp.start({
    name = 'Godot',
    cmd = { 'nc', '127.0.0.1', '6005' },
    root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
    on_attach = function(client, bufnr)
    end
})
