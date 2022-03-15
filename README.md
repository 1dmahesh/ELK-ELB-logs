# ELK-ELB-logs
Consumes AWS ELB (Elastic Load Balancer), NLB (Network Load Balancer), ALB (Application Load Balancer) logs from S3 and downloads it to a folder and sends them to logstash for ingestion.

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
    * **sudo /usr/share/logstash/bin/logstash --path.settings /etc/logstash  -f /etc/logstash/conf.d/alb-logs.conf**
   

# INGESTING S3 LOGS
1. Run the script as a root 
   * **sudo bash alb-elk-logs.sh**

**Check the kibana in browser for visualization** 
 
