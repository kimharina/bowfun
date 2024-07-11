#!/bin/bash

sudo rm -rf /opt/tomcat/tomcat-10/webapps/bowfun.war
sudo rm -rf /opt/tomcat/tomcat-10/webapps/bowfun
sudo mv /home/ubuntu/bowfun-0.0.1-SNAPSHOT.war /opt/tomcat/tomcat-10/webapps/bowfun.war
sudo systemctl daemon-reload
sudo systemctl restart tomcat.service