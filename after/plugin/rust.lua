local rt = require("rust-tools")

analyzer = '/home/smortimer/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer'
if vim.loop.os_uname().sysname == "Darwin" then
    analyzer = '/Users/smortimer/.rustup/toolchains/stable-aarch64-apple-darwin/bin/rust-analyzer'
end

rt.setup({
    server = {
        cmd = { analyzer },
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>ra", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})
