

Start the cassandra1 node first, and then wait a minute between any other node start:

    vagrant up cassandra1 && sleep 120 && vagrant up cassandra2 && sleep 120 && vagrant up cassandra3 && alert
    
Must have installed plugin: 

    vagrant plugin install deep_merge
