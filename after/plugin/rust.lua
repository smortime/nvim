local rt = require("rust-tools")

rt.setup({
    server = {
        cmd = { '/home/smortimer/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer' },
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>ra", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})
