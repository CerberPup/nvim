return {
    'folke/todo-comments.nvim',
    config = function()
        require("todo-comments").setup()
    end,
-- TODO: = { icon = " ", color = "info" },
-- HACK: = { icon = " ", color = "warning" },
-- WARN: = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
-- PERF: = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
-- NOTE: = { icon = " ", color = "hint", alt = { "INFO" } },
-- TEST: = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
}
