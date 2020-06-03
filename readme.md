# Development Environment via Docker

I'm too lazy to install most of these tools onto my environment, so I cheat by using docker images and run the containers for these tools.

the benefit is you can tear down and rebuild the container that is misbehaving.

## Resources

1. [Dockstation is my go to tool to manage my containers visually](https://dockstation.io/)
1. [Visual Studio Code with Docker extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)

## Example Environment Variables

1. SQL Server

```conf
SA_PASSWORD=<Password>
ACCEPT_EULA=Y
MSSQL_PID=Developer
DIR_DATA=e:\dkr\mssql\data
DIR_BAK=e:\dkr\mssql\backup
PORT=1434
```

1. RabbitMQ

```conf
RABBITMQ_ERLANG_COOKIE=<erlang_cookie_name>
RABBITMQ_DEFAULT_USER=guest
RABBITMQ_DEFAULT_PASS=guest
RABBITMQ_DEFAULT_VHOST=/
HTTP=15672
AMQP=5672
CLUSTERING=25672
```

1. RavenDB

```conf
BIND_PORT=8080
BIND_TCP_PORT=38888
SECURITY_UNSECURED_ACCESS_ALLOW="PublicNetwork"
ARGS="--Setup.Mode=Unsecured"
```

1. Neo4J

```conf
NEO4J_ACCEPT_LICENSE_AGREEMENT=yes
NEO4J_AUTH=<username/password>
NEO4J_apoc_export_file_enabled=true
NEO4J_apoc_import_file_enabled=true
NEO4J_apoc_import_file_use__neo4j__config=true
NEO4J_HTTP=7475
NEO4J_BOLT=7687
NEO4J_HTTPS=7472

NEO4J_fabric_database_name=fabric

NEO4J_fabric_graph_0_database=mens
NEO4J_fabric_graph_0_name=mens
NEO4J_fabric_graph_0_uri=neo4j://localhost:7687

NEO4J_fabric_graph_1_database=womens
NEO4J_fabric_graph_1_name=womens
NEO4J_fabric_graph_1_uri=neo4j://localhost:7687
```

1. ELK

```conf
KIBANA=5601
ELASTIC_JSON=9200
ELASTIC_TRANS=9300
BEATS=5044
ELASTIC_USER=elastic
ELASTIC_PASS=elastic
LOGSTASH_USER=logstash
LOGSTASH_PASS=logstash
KIBANA_USER=kibana
KIBANA_PASS=kibana
```

1. goCD

```conf
GOCD_SERVER_OPEN_PORT=8153
GOCD_SERVER_SECURE_PORT=8154
GO_SERVER_URL="https://172.19.0.2:8154/go"
```

1. Jenkins

```conf
JENKINS_SLAVE_AGENT_PORT=50001
UI_PORT=8080
API_PORT=50000
```

1. Postgres

```conf
POSTGRES_PASSWORD=password1
PORT=5432
HOME_VOL="e:\dkr\pg\"
```
