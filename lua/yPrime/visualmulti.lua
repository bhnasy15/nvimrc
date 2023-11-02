vim.g.VM_default_mappings = 1
local leader = {default = '\\', visual = '\\', buffer = '\\'}
vim.g.VM_leader = leader
local map = {}

map["I BS"] = ""

map["Find Under"]              = leader['default'] .. 'n'
map["Add Cursor Down"]         = leader['default'] .. 'j'
map["Add Cursor Up"]           = leader['default'] .. 'k'

map["Add Cursor At Pos"]       = leader['buffer'] .. '\\'
vim.g.VM_maps = map
