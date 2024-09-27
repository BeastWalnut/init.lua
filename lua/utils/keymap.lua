local M = {}

---@class keymap.Options
---@field mode string | string[]
---@field name? string
---@field prefix? string
---@field buffer? number
---@field noremap? boolean
---@field nowait? boolean
---@field silent? boolean
---@field unique? boolean
---@field expr? boolean
M.DEFAULT_OPTS = {
    mode = "n",
    name = nil,
    prefix = nil,
    buffer = nil,
    noremap = true,
    nowait = false,
    silent = true,
    unique = false,
    expr = false,
}

---@class keymap.Spec
---@field [1] string | fun() keymap rhs
---@field desc? string description

---@alias keymap.Specs table<string, keymap.Spec>

---@param lhs string
---@param spec keymap.Spec
---@param nil_rhs? boolean
---@return table<string, vim.validate.Spec>
local function validate_spec(lhs, spec, nil_rhs)
    return {
        spec = { spec, "t" },
        ["spec.lhs"] = { lhs, "s" },
        ["spec.rhs"] = { spec[1], { "s", "f" }, nil_rhs },
        ["spec.desc"] = { spec.desc, "s", true },
    }
end

---Defines all keymaps from `keyspec` adding `opts` to each of them
---@param keyspec keymap.Specs
---@param opts? keymap.Options
function M.set_keymap(keyspec, opts)
    opts = vim.tbl_extend("force", M.DEFAULT_OPTS, opts or {})

    for lhs, keymap in pairs(keyspec) do
        vim.validate(validate_spec(lhs, keymap))
        local _opts = vim.tbl_extend("force", opts, keymap)

        if _opts.prefix then
            lhs = _opts.prefix .. lhs
        end

        if _opts.name then
            if _opts.desc then
                _opts.desc = ("%s: %s"):format(_opts.name, _opts.desc)
            else
                local raw_lhs = vim.api.nvim_replace_termcodes(lhs, true, true, false)
                _opts.desc = ("%s: %s"):format(_opts.name, raw_lhs)
            end
        end

        local rhs = keymap[1]
        local mode = _opts.mode
        _opts[1] = nil
        _opts.prefix = nil
        _opts.name = nil
        _opts.mode = nil

        vim.keymap.set(mode, lhs, rhs, _opts)
    end
end

return M
