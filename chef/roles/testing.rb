name "testing"
description "Additional testing utils"

default_attributes(
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

