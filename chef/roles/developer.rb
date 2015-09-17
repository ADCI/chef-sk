name "developer"
description "Developer utilites"

run_list(
    "recipe[apt]",
    "recipe[composer]",
    "recipe[drush-wrapper]",
    "recipe[phing-wrapper]",
    "recipe[xdebug]",
)