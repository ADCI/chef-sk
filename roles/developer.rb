name "developer"
description "Default settings for developer variant."

default_attributes(

    "vsftpd" => {
        "allowed" => ["vagrant"],
        "chroot" => ["vagrant"],
        "config" => {
            "listen_address" => "172.16.0.2",
        }
    },

    "nginx" => {
        "default_site_enabled" => FALSE,

        # This will limit post_max_size and upload_max_filesize.
        # Default value is 1M. Infinite value is 0.
        "client_max_body_size" => "16M"
    },

    "mariadb" => {
        "server_root_password" => "root",
        "remove_anonymous_users" => TRUE,
        "remove_test_database" => TRUE,
        "tunable" => {
            "myisam_sort_buffer_size" => "64M",
            "join_buffer_size" => "2M",
            "read_buffer_size" => "2M",
            "sort_buffer_size" => "3M",
            "table_cache" => "1024",
            "thread_cache_size" => "286",
            "wait_timeout" => "1800",
            "max_connect_errors" => "1000",
            "innodb_log_file_size" => "64M"
        }
    },

    # Uncomment this lines if you want to test sending emails from a local server, prepared from the "postfix" recipe.
    "php" => {
        "directives" => {
            "post_max_size" => "16M",
            "upload_max_filesize" => "16M",
            "memory_limit" => "256M",
            "max_execution_time" => "120",
            "display_errors" => "On",
            "html_errors" => "On",
            "display_startup_errors" => "On",
            "SMTP" => "localhost.localdomain",
            "sendmail_from" => "vagrant@localhost.localdomain"
        }
    }
)

run_list(
    "recipe[apt]",
    "recipe[git]",
    "recipe[vsftpd]",
    "recipe[php]",
    "recipe[php::module_gd]",
    "recipe[php::module_mysql]",
    "recipe[php-fpm]",
    "recipe[nginx]",
    "recipe[mariadb]",
    "recipe[phpapp]",
    "recipe[drush]",
    "recipe[phing]",
)