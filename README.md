# hazelcast-session-classloading-issue

This project is based on [hazelcast-docker-samples](https://github.com/hazelcast/hazelcast-docker-samples/tree/master/manager-based-session-replication) and demonstrates a class-loading issue with [hazelcast-tomcat-sessionmanager](https://github.com/hazelcast/hazelcast-tomcat-sessionmanager) in P2P Setup without sticky session.

The issue is present on Tomcat 7 and Tomcat 8.5.

We create a simple WAR as done in [hazelcast-docker-samples](https://github.com/hazelcast/hazelcast-docker-samples/tree/master/manager-based-session-replication) but instead of putting a `String` in the session we use a `StringHolder implements Serializable`. Now we deploy this WAR under two targets (`/example` and `/example2`). Classloader for the `StringHolder` will be the first deployed application! The other one will throw an exception.

## Requirements
You should have installed Docker and Apache Maven on your system.

## Build

1. Clone repo - `git clone https://github.com/helge79/hazelcast-session-classloading-issue.git`
2. Create example war file - run `mvn package`
3. Navigate to directory `tomcat7` (or `tomcat85`) and run `run.sh` shell file from terminal.
4. Look for the last deployed application (in my case it is mostly `example.war` - if not replace `example` by `example2` below)
5. Open a browser and enter `http://localhost:8080/example/hazelcast?key=foo&value=bar&action=Set+Attribute` to set a attribute
6. Now get it via `http://localhost:8080/example/hazelcast?key=foo&action=Get+Attribute` => `ClassCastException` will be thrown: 

   ```java.lang.ClassCastException: com.hazelcast.HazelcastSessionReplication.StringHolder cannot be cast to com.hazelcast.HazelcastSessionReplication.StringHolder```
