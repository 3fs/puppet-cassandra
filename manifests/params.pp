class cassandra::params {
    $include_repo = $::cassandra_include_repo ? {
        undef   => true,
        default => $::cassandra_include_repo
    }

    $repo_name = $::cassandra_repo_name ? {
        undef   => 'datastax',
        default => $::cassandra_repo_name
    }

    $repo_baseurl = $::cassandra_repo_baseurl ? {
        undef   => $::osfamily ? {
            'Debian' => 'http://debian.datastax.com/community',
            'RedHat' => 'http://rpm.datastax.com/community/',
            default  => undef,
        },
        default => $::cassandra_repo_baseurl
    }

    $repo_gpgkey = $::cassandra_repo_gpgkey ? {
        undef   => $::osfamily ? {
            'Debian' => 'http://debian.datastax.com/debian/repo_key',
            'RedHat' => 'http://rpm.datastax.com/rpm/repo_key',
            default  => undef,
        },
        default => $::cassandra_repo_gpgkey
    }

    $repo_repos = $::cassandra_repo_repos ? {
        undef   => 'main',
        default => $::cassandra_repo_release
    }

    $repo_key_id = $::cassandra_repo_key_id ? {
        undef   => $::osfamily ? {
            'Debian' => 'B999A372',
            default  => undef,
        },
        default => $::cassandra_repo_key_id
    }

    $repo_release = $::cassandra_repo_release ? {
        undef   => 'stable',
        default => $::cassandra_repo_release
    }

    $repo_pin = $::cassandra_repo_pin ? {
        undef   => 200,
        default => $::cassandra_repo_release
    }

    $repo_gpgcheck = $::cassandra_repo_gpgcheck ? {
        undef   => 0,
        default => $::cassandra_repo_gpgcheck
    }

    $repo_enabled = $::cassandra_repo_enabled ? {
        undef   => 1,
        default => $::cassandra_repo_enabled
    }

    case $::osfamily {
        'Debian': {
            $package_name = $::cassandra_package_name ? {
                undef   => 'dsc21',
                default => $::cassandra_package_name,
            }

            $service_name = $::cassandra_service_name ? {
                undef   => 'cassandra',
                default => $::cassandra_service_name,
            }

            $config_path = $::cassandra_config_path ? {
                undef   => '/etc/cassandra',
                default => $::cassandra_config_path,
            }
        }
        'RedHat': {
            $package_name = $::cassandra_package_name ? {
                undef   => 'dsc21',
                default => $::cassandra_package_name,
            }

            $service_name = $::cassandra_service_name ? {
                undef   => 'cassandra',
                default => $::cassandra_service_name,
            }

            $config_path = $::cassandra_config_path ? {
                undef   => '/etc/cassandra/conf',
                default => $::cassandra_config_path,
            }
        }
        default: {
            fail("Unsupported osfamily: ${::osfamily}, operatingsystem: ${::operatingsystem}, module ${module_name} only supports osfamily Debian")
        }
    }

    $manage_user = $::cassandra_manage_user ? {
        undef   => true,
        default => $::cassandra_manage_user,
    }

    $version = $::cassandra_version ? {
        undef   => '2.1.2',
        default => $::cassandra_version,
    }

    $max_heap_size = $::cassandra_max_heap_size ? {
        undef   => '',
        default => $::cassandra_max_heap_size,
    }

    $heap_newsize = $::cassandra_heap_newsize ? {
        undef   => '',
        default => $::cassandra_heap_newsize,
    }

    $jmx_port = $::cassandra_jmx_port ? {
        undef   => 7199,
        default => $::cassandra_jmx_port,
    }

    $additional_jvm_opts = $::cassandra_additional_jvm_opts ? {
        undef   => [],
        default => $::cassandra_additional_jvm_opts,
    }

    $cluster_name = $::cassandra_cluster_name ? {
        undef   => 'Cassandra',
        default => $::cassandra_cluster_name,
    }

    $listen_address = $::cassandra_listen_address ? {
        undef   => $::ipaddress,
        default => $::cassandra_listen_address,
    }

    $broadcast_address = $::cassandra_broadcast_address ? {
        undef   => '',
        default => $::cassandra_broadcast_address,
    }

    $authenticator = $::cassandra_authenticator ? {
        undef   => 'AllowAllAuthenticator',
        default => $::cassandra_authenticator,
    }

    $authorizer = $::cassandra_authorizer ? {
        undef   => 'AllowAllAuthorizer',
        default => $::cassandra_authorizer,
    }

    $rpc_address = $::cassandra_rpc_address ? {
        undef   => '0.0.0.0',
        default => $::cassandra_rpc_address,
    }

    $rpc_port = $::cassandra_rpc_port ? {
        undef   => 9160,
        default => $::cassandra_rpc_port,
    }

    $rpc_server_type = $::cassandra_rpc_server_type ? {
        undef   => 'hsha',
        default => $::cassandra_rpc_server_type,
    }

    $rpc_min_threads = $::cassandra_rpc_min_threads ? {
        undef   => 0,
        default => $::cassandra_rpc_min_threads,
    }

    $rpc_max_threads = $::cassandra_rpc_max_threads ? {
        undef   => 2048,
        default => $::cassandra_rpc_max_threads,
    }

    $storage_port = $::cassandra_storage_port ? {
        undef   => 7000,
        default => $::cassandra_storage_port,
    }

    $partitioner = $::cassandra_partitioner ? {
        undef   => 'org.apache.cassandra.dht.Murmur3Partitioner',
        default => $::cassandra_partitioner,
    }

    $data_file_directories = $::cassandra_data_file_directories ? {
        undef   => ['/var/lib/cassandra/data'],
        default => $::cassandra_data_file_directories,
    }

    $commitlog_directory = $::cassandra_commitlog_directory ? {
        undef   => '/var/lib/cassandra/commitlog',
        default => $::cassandra_commitlog_directory,
    }

    $saved_caches_directory = $::cassandra_saved_caches_directory ? {
        undef   => '/var/lib/cassandra/saved_caches',
        default => $::cassandra_saved_caches_directory,
    }

    $initial_token = $::cassandra_initial_token ? {
        undef   => '',
        default => $::cassandra_initial_token,
    }

    $seeds = $::cassandra_seeds ? {
        undef   => [],
        default => $::cassandra_seeds,
    }

    $default_concurrent_reads = $::processorcount * 8
    $concurrent_reads = $::cassandra_concurrent_reads ? {
        undef   => $default_concurrent_reads,
        default => $::cassandra_concurrent_reads,
    }

    $default_concurrent_writes = $::processorcount * 8
    $concurrent_writes = $::cassandra_concurrent_writes ? {
        undef   => $default_concurrent_writes,
        default => $::cassandra_concurrent_writes,
    }

    $incremental_backups = $::cassandra_incremental_backups ? {
        undef   => 'false',
        default => $::cassandra_incremental_backups,
    }

    $snapshot_before_compaction = $::cassandra_snapshot_before_compaction ? {
        undef   => 'false',
        default => $::cassandra_snapshot_before_compaction,
    }

    $auto_snapshot = $::cassandra_auto_snapshot ? {
        undef   => 'true',
        default => $::cassandra_auto_snapshot,
    }

    $multithreaded_compaction = $::cassandra_multithreaded_compaction ? {
        undef   => 'false',
        default => $::cassandra_multithreaded_compaction,
    }

    $endpoint_snitch = $::cassandra_endpoint_snitch ? {
        undef   => 'SimpleSnitch',
        default => $::cassandra_endpoint_snitch,
    }

    $internode_compression = $::cassandra_internode_compression ? {
        undef   => 'all',
        default => $::cassandra_internode_compression,
    }

    $disk_failure_policy = $::cassandra_disk_failure_policy ? {
        undef   => 'stop',
        default => $::cassandra_disk_failure_policy,
    }

    $start_native_transport = $::cassandra_start_native_transport ? {
        undef   => 'true',
        default => $::cassandra_start_native_transport,
    }

    $native_transport_port = $::cassandra_native_transport_port ? {
        undef   => 9042,
        default => $::cassandra_native_transport_port,
    }

    $start_rpc = $::cassandra_start_rpc ? {
        undef   => 'true',
        default => $::cassandra_start_rpc,
    }

    $num_tokens = $::cassandra_num_tokens ? {
        undef   => 256,
        default => $::cassandra_num_tokens,
    }

    $thread_stack_size = $::cassandra_thread_stack_size ? {
        undef   => 256,
        default => $::cassandra_thread_stack_size,
    }

    $service_enable = $::cassandra_service_enable ? {
        undef   => 'true',
        default => $::cassandra_service_enable,
    }

    $service_ensure = $::cassandra_service_ensure ? {
        undef   => 'running',
        default => $::cassandra_service_ensure,
    }
    $server_encryption_internode= $::cassandra_server_encryption_internode ? {
        undef   => 'none',
        default => $::cassandra_server_encryption_internode,
    }
    $server_encryption_require_auth = $::cassandra_server_encryption_require_auth ? {
        undef   => false,
        default => $::cassandra_server_encryption_require_auth,
    }
    $server_encryption_keystore = $::cassandra_server_encryption_keystore ? {
        undef   => '',
        default => $::cassandra_server_encryption_keystore,
    }
    $server_encryption_keystore_password = $::cassandra_server_encryption_keystore_password ? {
        undef   => '',
        default => $::cassandra_server_encryption_keystore_password,
    }
    $server_encryption_truststore = $::cassandra_server_encryption_truststore ? {
        undef   => '',
        default => $::cassandra_server_encryption_truststore,
    }
    $server_encryption_truststore_password = $::cassandra_server_encryption_truststore_password ? {
        undef   => '',
        default => $::cassandra_server_encryption_truststore_password,
    }
    $server_encryption_cipher_suites = $::cassandra_server_encryption_cipher_suites ? {
        undef   => [],
        default => $::cassandra_server_encryption_cipher_suites,
    }
    $client_encryption_enabled = $::cassandra_client_encryption_enabled ? {
        undef   => false,
        default => $::cassandra_client_encryption_enabled,
    }
    $client_encryption_require_auth = $::cassandra_client_encryption_require_auth ? {
        undef   => false,
        default => $::cassandra_client_encryption_require_auth,
    }
    $client_encryption_keystore = $::cassandra_client_encryption_keystore ? {
        undef   => '',
        default => $::cassandra_client_encryption_keystore,
    }
    $client_encryption_keystore_password = $::cassandra_client_encryption_keystore_password ? {
        undef   => '',
        default => $::cassandra_client_encryption_keystore_password,
    }
    $client_encryption_truststore = $::cassandra_client_encryption_truststore ? {
        undef   => '',
        default => $::cassandra_client_encryption_truststore,
    }
    $client_encryption_truststore_password = $::cassandra_client_encryption_truststore_password ? {
        undef   => '',
        default => $::cassandra_client_encryption_truststore_password,
    }
    $client_encryption_cipher_suites = $::cassandra_client_encryption_cipher_suites ? {
        undef   => [],
        default => $::cassandra_client_encryption_cipher_suites,
    }

}
