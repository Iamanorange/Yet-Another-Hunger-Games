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
            {description = "5 Days", data = 5},
            {description = "8 Days", data = 8},
            {description = "16 Days", data = 16},
            {description = "32 Days", data = 32},
        },
        default = 5,
    },
    {
        name = "penaltymultiplier",
        label = "Penalty Multiplier",
        options = {
            {description = "4", data = 4},
            {description = "8", data = 8},
            {description = "16", data = 16},
            {description = "32", data = 32},
        },
        default = 8,
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
