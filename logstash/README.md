## Logstash Configuration Files
Included is a simple Logstash configuration file for ELB logs, MongoDB logs and Nginx Webserver logs that includes the input, filter and output definitions.

#### Changes required for ELB Logs.
- Open file `alb-logs.conf` in an editor.
- Modify the `output` section and set the host address to your ElasticSearch server.
- Modify the `input` section and change `path` directive to logs downloaded path .
- Modify the `filters` section if you need any custom parsing.

#### Changes required for MongoDB Logs.
- Open file `mongo-logs.conf` in an editor.
- Modify the `output` section and set the host address to your ElasticSearch server.
- Modify the `input` section and change `path` directive to logs downloaded path.

#### Changes required for Nginx Webserver Logs.
- Open file `nginx-logs.conf` in an editor.
- Modify the `output` section and set the host address to your ElasticSearch server.
- Modify the `input` section and change `path` directive to logs downloaded path.
