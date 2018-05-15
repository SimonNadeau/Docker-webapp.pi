#!/bin/bash

java -Djava.util.logging.config.file=/var/lib/${TOMCAT}/conf/logging.properties \
     -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager \
     -Djava.awt.headless=true \
     -XX:+UseConcMarkSweepGC \
     -Xms128m \
     -Xmx512m \
     -XX:MaxPermSize=300m \
     -ea \
     -Djava.endorsed.dirs=/usr/share/${TOMCAT}/endorsed \
     -classpath /usr/share/${TOMCAT}/bin/bootstrap.jar:/usr/share/${TOMCAT}/bin/tomcat-juli.jar \
     -Dcatalina.base=/var/lib/${TOMCAT} \
     -Dcatalina.home=/usr/share/${TOMCAT} \
     -Djava.io.tmpdir=/tmp/${TOMCAT}-${TOMCAT}-tmp \
      org.apache.catalina.startup.Bootstrap start >> /var/lib/${TOMCAT}/logs/catalina.out