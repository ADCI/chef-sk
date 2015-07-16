name "integration"
description "Continuous integration role"

run_list(
    "recipe[jenkins::master]",
    "recipe[phpcs]",
    "recipe[phpmd]",
    "recipe[phploc]",
    "recipe[phpcpd]",
)