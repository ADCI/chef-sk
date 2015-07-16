name "integration"
description "Continuous integration role"

run_list(
    "recipe[jenkins::master]",
)