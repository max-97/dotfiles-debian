local term = require("nvchad.term")

local function get_meson_build_dir()
	local root = vim.fs.find("meson.build", {
		upward = true,
		stop = vim.loop.os_homedir(),
	})[1]

	if not root then
		vim.notify("meson.build not found", vim.log.levels.ERROR)
		return
	end

	local project_root = vim.fs.dirname(root)
	local build_dir = project_root .. "/build"

	if vim.fn.isdirectory(build_dir) == 0 then
		vim.notify("Meson build directory not found: " .. build_dir, vim.log.levels.ERROR)
		return
	end
	return build_dir
end

local function find_executable(dir)
	local handle = vim.loop.fs_scandir(dir)
	if not handle then
		vim.notify("Failed to scan directory for exectuable: " .. dir, vim.log.levels.ERROR)
		return
	end

	while true do
		::continue::
		local name, t = vim.loop.fs_scandir_next(handle)
		if not name then
			break
		end

		local path = dir .. "/" .. name
		if t ~= "file" then
			goto continue
		end

		local stat = vim.loop.fs_stat(path)
		if stat and stat.type == "file" then
			if bit.band(stat.mode, 0x40) ~= 0 then
				if not name:match("%.so") and not name:match("%.a") then
					return path
				end
			end
		end
	end
	return nil
end

local function meson_compile(dir)
	term.runner({
		cmd = "cd " .. vim.fn.fnameescape(dir) .. " && meson compile",
		pos = "sp",
		size = 0.4,
		id = "meson",
	})
end

local function run_executable(exectuable)
	term.runner({
		cmd = exectuable,
		pos = "sp",
		size = 0.4,
		id = "meson",
	})
end

local map = vim.keymap.set

map("n", "<leader>mc", function()
	local build_dir = get_meson_build_dir()
	if not build_dir then
		return
	end
	meson_compile(build_dir)
end, { silent = true, desc = "Meson: compile project" })

map("n", "<leader>mr", function()
	local build_dir = get_meson_build_dir()
	if not build_dir then
		return
	end
	local exectuable = find_executable(build_dir)
	if not exectuable then
		return
	end
	meson_compile(build_dir)
	run_executable(exectuable)
end, { silent = true, desc = "Meson: run project" })
