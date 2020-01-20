#!/bin/bash
curl -L https://oss.sonatype.org/content/repositories/releases/com/hazelcast/hazelcast-all/3.11.2/hazelcast-all-3.11.2.jar -o hazelcast-all-3.11.2.jar
curl -L https://oss.sonatype.org/content/repositories/releases/com/hazelcast/hazelcast-tomcat85-sessionmanager/1.1.5/hazelcast-tomcat85-sessionmanager-1.1.5.jar -o hazelcast-tomcat85-sessionmanager-1.1.5.jar
docker-compose up 
