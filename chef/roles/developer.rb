name "developer"
description "Default settings for developer variant."

default_attributes(

    "java" => {
        "install_flavor" => "oracle",
        "jdk_version" => "7",
        "oracle" => {
            "accept_oracle_download_terms" => true
        }
    },

    "vsftpd" => {
        "allowed" => ["vagrant"],
        "chroot" => ["vagrant"],
        "config" => {
            "listen_address" => "0.0.0.0",
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
        "mysqld" => {
            "join_buffer_size" => "2M",
            "read_buffer_size" => "2M",
            "read_rnd_buffer_size" => "1M",
            "sort_buffer_size" => "3M",
            "table_cache" => "1024",
            "thread_cache_size" => "286",
            "wait_timeout" => "1800",
            "max_allowed_packet" => "48M",
            "max_connect_errors" => "1000",
            "query_cache_size" => "0",
            "query_cache_type" => "0"
        },
        "innodb" => {
            "buffer_pool_size" => "128M",
            "file_per_table" => TRUE,
            "file_format" => "Barracuda",
            "log_buffer_size" => "4M",
            "log_file_size" => "128M"
        }
    },

    # Uncomment this lines if you want to test sending emails from a local server, prepared from the "postfix" recipe.
    "php" => {
        "directives" => {
            "error_reporting" => "E_ALL",
            "memory_limit" => "320M",
            "max_execution_time" => "120",
            "max_input_vars" => "3000",
            "post_max_size" => "100M",
            "upload_max_filesize" => "100M",
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
    "recipe[java]",
    "recipe[php]",
    "recipe[php::module_gd]",
    "recipe[php::module_mysql]",
    "recipe[mariadb]",
    "recipe[composer]",
    "recipe[php-wrapper]",
    "recipe[php-fpm-wrapper]",
    "recipe[drush-wrapper]",
    "recipe[phing-wrapper]",
    "recipe[nginx-wrapper]",
)