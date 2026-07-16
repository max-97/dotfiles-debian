return {
    name = "meson build",
    builder = function()
        return {
            cmd = {"meson", "compile", "-C", "build"},
            components = { "default" },
        }
    end,
    condition = {
        filetype = { "cpp", "c", "meson" },
    }
}
