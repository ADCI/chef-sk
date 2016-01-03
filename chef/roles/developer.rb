name "developer"
description "Developer utilites"

default_attributes(
    "nodejs" => {
        "install_method" => "binary",
        "binary" => {
            "checksum" => "dcae0c0faf9841ef38953075e67ca477ef9d2ea7c14ac2221de2429813f83a62",
        },
        "version" => "4.2.4",
    },

    "nodejs-wrapper" => {
        "packages" => [
            {
                "name" => "gulp",
                "bin_name" => "gulp",
            },
        ]
    },
)

run_list(
    "recipe[apt]",
    "recipe[composer]",
    "recipe[drush-wrapper]",
    "recipe[phing-wrapper]",
    "recipe[xdebug]",
    "recipe[nodejs-wrapper]",
)