# install Cassandra 1.2.x

datastax_key:
  cmd.run:
    - name: curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
    - user: root
    - require:
      - pkg: curl

curl:
  pkg.installed

cassandra_12x_ppa:
  pkgrepo.managed:
    - humanname: Cassandra 12x
    - name: deb http://debian.datastax.com/community stable main
    - require_in:
      - pkg: cassandra_12x
      
cassandra_12x:
  pkg.installed:
    - name: cassandra
    - version: 1.2.9
    - requires:
      - cmd: datastax_key
      - pkg: curl

configure_cassandra:
  file.managed:
    - name: /etc/cassandra/cassandra.yaml
    - source: salt://cassandra/cassandra.yaml
    - user: root
    - group: root
    - template: jinja
      
configure_cassandra_env:
  file.managed:
    - name: /etc/cassandra/cassandra-env.sh
    - source: salt://cassandra/cassandra-env.sh
    - user: root
    - group: root
    - template: jinja
      
cassandra_restart:
  service.running:
    - name: cassandra
    - watch:
      - file: /etc/cassandra/*
