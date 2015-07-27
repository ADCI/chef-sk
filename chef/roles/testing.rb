name "testing"
description "Additional testing utils"

default_attributes(

    "java" => {
        "install_flavor" => "oracle",
        "jdk_version" => "7",
        "oracle" => {
            "accept_oracle_download_terms" => true
        }
    },

    "nodejs" => {
        "install_method" => "binary",
        "binary" => {
          "checksum" => "0a861a6ded50c8cda32ac39c3a54699c767742e6",
        },
        "version" => "0.12.7",
        "npm_packages" => [
            {
                "name" => "webdriverio"
            },
            {
                "name" => "mocha"
            }
        ]
    },

    "phantomjs" => {
        "version" => "1.9.8"
    }
)

run_list(
    "recipe[java]",
    "recipe[phantomjs]",
    "recipe[nodejs]",
    "recipe[selenium-wrapper]",
)