local M = {}

local dir_markers = {
    git = {
        ".git",
    },
    direnv = {
        ".direnv",
    },
    zig = {
        "zig-out",
        ".zig-cache",
    },
    java = {
        ".gradle",
        ".mvn"
    }
}

local file_markers= {
    direnv = {
        ".envrc",
    },
    nix = {
        "flake.nix",
        "shell.nix",
    },
    rust = {
        "Cargo.toml",
        "Cargo.lock"
    },
    c = {
        "Makefile",
    },
    zig = {
        "build.zig",
        "build.zig.zon",
    },

    java = {
        "build.gradle",
        "build.gradle.kts",
        "mvwn",
        "pom.xml",
    }
}



---[[ Get root only markers given a path. These markers are used to know which
--- type of project the path is. For example, if the project has git, or is a 
--- rust project or a zig project. The path is normalized. No need to normalize
--- beforehand.
---]]
---@param path string Project's path to search markers in.
---@return markers string[] List of markers. 
M.get_markers = function(path)
    local norm_path = vim.fs.normalize(path)
    if not vim.uv.fs_stat(norm_path) then
        print("Path " .. path .. " not found.")
        return 
    end

    local markers  = {}
    local iter = vim.fs.dir(norm_path, { depth = 1, follow = false})

    for name,ftype in iter do
        if ftype == "directory" then
            for marker, values in pairs(dir_markers) do
                if vim.list_contains(values, name) then
                    --- Only add the marker if it not added
                    if not vim.list_contains(markers, marker) then
                        table.insert(markers, marker)
                    end
                    break
                end
            end
        elseif ftype == "file" then
            for marker, values in pairs(file_markers) do
                if vim.list_contains(values, name) then
                    if not vim.list_contains(markers, marker) then
                        table.insert(markers, marker)
                    end
                    break
                end
            end
        end
    end

    return markers
end

return M
