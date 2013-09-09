Vagrant Setup for Cassandra 1.2.9 (using Salt provisionner)
======================

This is a simple Vagrant setup for installing Cassandra 1.2.9 from DataStax Community repositories on Ubuntu Precise 64.

## How to Start

1. Install [VirtualBox](https://www.virtualbox.org/)
1. Install [Vagrant](http://downloads.vagrantup.com/) (you need at least 1.3.0 or better)
1. Install Deep Merge plugin: `vagrant plugin install deep_merge`
1. Startup Vagrant by executing `vagrant up`
1. Connect to the server by executing `vagrant ssh cassandra1`
1. Connect to your Cassandra cluster `cqlsh 192.168.56.110`

## Notes

By default cluster of three machines is brought up. You can change the IP addresses of the machines, and the number of machines by modifying following map:

    servers = {
      :cassandra1 => '192.168.56.110',
      :cassandra2 => '192.168.56.112',
      :cassandra3 => '192.168.56.114'
    }

Each machine has `2048` MB of RAM, you can change this by modifying following line:

    vb.customize ["modifyvm", :id, "--memory", "2048"]
