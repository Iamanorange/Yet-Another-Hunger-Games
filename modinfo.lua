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
}
