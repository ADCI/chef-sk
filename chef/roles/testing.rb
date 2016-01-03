name "testing"
description "Additional testing utils"

default_attributes(
    "nodejs" => {
        "install_method" => "binary",
        "binary" => {
          "checksum" => "e766e387934e17daaad92d0460ed76f756655da62b627a5c9cc07faea4a0b824",
        },
        "version" => "4.2.1",
    },

    "nodejs-wrapper" => {
        "packages" => [
            {
                "name" => "webdriverio",
                "bin_name" => "wdio",
            },
            {
                "name" => "mocha",
                "bin_name" => "mocha",
            }
        ]
    },

    "phantomjs" => {
        "version" => "1.9.8"
    }
)

run_list(
    "recipe[apt]",
    "recipe[jenkins::java]",
    "recipe[phantomjs]",
    "recipe[selenium-wrapper]",
    "recipe[jenkins::master]",
)

