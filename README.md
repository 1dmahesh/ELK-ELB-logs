# ELB/MongoDB/Nginx to ELK
- Consumes AWS ELB (Elastic Load Balancer), NLB (Network Load Balancer), ALB (Application Load Balancer) logs from S3 and downloads it to a folder and sends them to      logstash for ingestion.
- Consumes logs from mongo-DB, and ingested to kibana, same can be done for nginx web server logs.

# REQUERMENTS
 awscliv2 & elk version 7.xx
 
# CONFIGURATION
 1. Create a folder for downloading logs from s3 and ingesting it into kibana.
 2. Ensure your AWS credentials are configured (e.g:  ~/.aws/credentials)
 3. Give scripts executable permission i.e (chmod a+x scripts/*)
 4. Configure the scipts according to your needs. 


# CONFIGURE THE elk
1. Use 7.xx version for all the elk components 
2. Use below command to download the elk stack 
   * (**https://www.elastic.co/downloads/**)
3. Once downlaoded add logstash files inside the /etc/logstash/conf.d
4. Check if kibana is running or not in browser
    * (**http://localhost:5601/**)
5. Now start the logstash ingestion by below command 
    * **systemctl restart logstash**
6. If not using systemd process, please use below command
    * **sudo /usr/share/logstash/bin/logstash --path.settings /etc/logstash  -f /etc/logstash/conf.d/{logstash_file}**
7. To update logstash Configuration files, Please go to `logstash` folder.
   

# INGESTING S3 LOGS
- Run the script as a root & give the path of folder in which logs will get downloaded.
   * **sudo bash alb-elk-logs.sh  (logs-download-directory-path)**
   
# INGESTING MongoDB LOGS
 - First Start the mongo-logstash process from below command--
    * **sudo /usr/share/logstash/bin/logstash --path.settings /etc/logstash  -f /etc/logstash/conf.d/mongo-logs.conf**
 - Now Download the logs from either atlas console or remote server .
 - Place it into a folder.

# INGESTING Nginx Webserver LOGS
 -  As mentioned in above steps first Start the nginx-logstash process from below command--
    * **sudo /usr/share/logstash/bin/logstash --path.settings /etc/logstash  -f /etc/logstash/conf.d/nginx-logs.conf**
 - Now export the logs to a directrory from remote server.
 
**Check the kibana in browser for visualization** 

 
