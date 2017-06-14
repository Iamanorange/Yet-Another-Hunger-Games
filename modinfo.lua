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
            {description = "10 Days", data = 10},
            {description = "20 Days", data = 20},
            {description = "40 Days", data = 40},
        },
        default = 5,
    },
    {
        name = "penaltymultiplier",
        label = "Penalty Multiplier",
        options = {
            {description = "0.5", data = 0.5},
            {description = "1", data = 1},
            {description = "2", data = 2},
            {description = "4", data = 4},
            {description = "8", data = 8},
        },
        default = 1,
    },
    {
        name = "rebalance",
        label = "Rebalance Characters",
        options = {
            {description = "No", data = false},
            {description = "Yes", data = true},
        },
        default = false,
    },
}
