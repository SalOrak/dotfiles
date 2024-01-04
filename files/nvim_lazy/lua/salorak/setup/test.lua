P = function(d)
    local p = vim.inspect(d)
    print(p)
    return p
end

local log = require"plenary.log"
local _path = require"plenary.path"
local _scan = require"plenary.scandir"

local M = {}

--P(pscan.scan_dir("~",{hidden = false, depth = 1} ))

-- P(ppath.expand("~"))
local r = _path.new(_path.expand(_path.new("~/test/")))
local a = _path.new("/home/user")
--P(pscan.scan_dir(ppath.expand(a),{hidden = false, depth = 1, only_dirs = true}))

M.get_subdir = function(dir)
    dir = M.parse_directory(dir)
    local d = _path.new(_path.expand(_path.new(dir)))

    if not _path.exists(d) then
        log.warn("Directory " .. dir .. " is not a valid directory")
        return {}
    end

    local tbl_sub = _scan.scan_dir(_path.expand(d), {
        hidden = false,
        depth = 1,
        only_dirs = true
    })
    local tbl_dir = {}
    for _,v in pairs(tbl_sub) do
        tbl_dir[#tbl_dir + 1] = v
    end
    return  tbl_dir
end

M.parse_directory = function(dir)
    dir = dir or ""
    local tmp = ""
    for i = 1, vim.fn.strlen(dir) do
        local c1 = dir:sub(i, i)
        local c2 = dir:sub(i + 1, i + 1)
        if not ((c1 == c2 or i == vim.fn.strlen(dir)) and c1 == "/") then
            tmp = tmp .. c1
        end
    end
    return tmp
end

local d = M.parse_directory("~/personal/")
P(M.get_subdir(d))

--    __concat = <function 1>,
--    __div = <function 2>,
--    __index = <function 3>,
--    __tostring = <function 4>,
--    _fs_filename = <function 5>,
--    _read = <function 6>,
--    _read_async = <function 7>,
--    _split = <function 8>,
--    _st_mode = <function 9>,
--    _stat = <function 10>,
--    absolute = <function 11>,
--    close = <function 12>,
--    copy = <function 13>,
--    exists = <function 14>,
--    expand = <function 15>,
--    find_upwards = <function 16>,
--    head = <function 17>,
--    is_absolute = <function 18>,
--    is_dir = <function 19>,
--    is_file = <function 20>,
--    is_path = <function 21>,
--    iter = <function 22>,
--    joinpath = <function 23>,
--    make_relative = <function 24>,
--    mkdir = <function 25>,
--    new = <function 26>,
--    normalize = <function 27>,
--    open = <function 28>,
--    parent = <function 29>,
--    parents = <function 30>,
--    path = {
--      S_IF = {
--        DIR = 16384,
--        REG = 32768
--      },
--      home = "/home/user",
--      root = <function 31>,
--      sep = "/"
--    },
--
