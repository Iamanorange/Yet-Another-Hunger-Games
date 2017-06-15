name = "Yet Another Hunger Games"
description = "Yet Another Hunger Games"

author = "__orange"
version = "0"
forumthread = ""
api_version = 10

all_clients_require_mod = false
client_only_mod = false
dst_compatible = true
server_filter_tags = {}

configuration_options =
{
    {
        name = "maxdays",
        label = "Maximum Days",
        options = {
            {description = "4 Days", data = 4},
            {description = "6 Days", data = 6},
            {description = "8 Days", data = 8},
            {description = "12 Days", data = 12},
            {description = "16 Days", data = 16},
        },
        default = 4,
    },
    {
        name = "penaltymultiplier",
        label = "Penalty Multiplier",
        options = {
            {description = "0.5", data = 0.5},
            {description = "0.7", data = 0.7},
            {description = "1", data = 1},
            {description = "1.4", data = 1.4},
            {description = "2", data = 2},
            {description = "2.8", data = 2.8},
            {description = "4", data = 4},
        },
        default = 1,
    },
    {
        name = "rebalance",
        label = "Rebalance Characters",
        options = {
            {description = "Off", data = false},
            {description = "On", data = true},
        },
        default = false,
    },
}
