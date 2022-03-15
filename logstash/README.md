## Logstash Configuration Files
Included is a simple Logstash configuration file that includes the input, filter and output definitions.

#### Changes required
- Open file `alb-logs.conf` in an editor.
- Modify the `output` section and set the host address to your ElasticSearch server.
- Modify the `input` section and change `path` directive to logs downloaded path .
- Modify the `filters` section if you need any custom parsing.