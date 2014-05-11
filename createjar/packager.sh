rm -Rf release
rm -Rf classes
mkdir release
mkdir release/update
mkdir classes
cp ../bin/*.class classes/
mkdir classes/resources
cp -R ../resources/templates classes/resources/
cp -R ../resources release/
rm -Rf release/resources/templates
rm -Rf release/resources/templates_chancecoin.com
rm release/resources/db/*
javac -cp "release/resources/jars/slf4j-api-1.6.4.jar:release/resources/jars/slf4j-simple-1.6.4.jar:release/resources/jars/bitcoinj-0.11-bundled.jar:release/resources/jars/jackson-annotations-2.0.0.jar:release/resources/jars/jackson-core-2.0.0.jar:release/resources/jars/jackson-databind-2.0.0.jar:release/resources/jars/sqlite-jdbc-3.7.15-M1.jar:release/resources/jars/jetty9/lib/jetty-server-9.1.4.v20140401.jar:release/resources/jars/jetty9/lib/jetty-util-9.1.4.v20140401.jar:release/resources/jars/jetty9/lib/jetty-http-9.1.4.v20140401.jar:release/resources/jars/jetty9/lib/jetty-servlet-9.1.4.v20140401.jar:release/resources/jars/jetty9/lib/jetty-io-9.1.4.v20140401.jar:release/resources/jars/jetty9/lib/jetty-continuation-9.1.4.v20140401.jar:release/resources/jars/jetty9/lib/jetty-security-9.1.4.v20140401.jar:release/resources/jars/javax.servlet-api-3.1.0.jar:release/resources/jars/javax.servlet-5.1.12.jar:release/resources/jars/spark-core-1.1.1.jar:release/resources/jars/spark-template-freemarker-1.0.jar:release/resources/jars/spark-template-velocity-1.0.jar:release/resources/jars/freemarker.jar:release/resources/jars/jsonrpc4j-1.0.jar:release/resources/jars/portlet-api-2.0-r12.jar:release/resources/jars/java-json.jar" -sourcepath "../src" -d "classes" ../src/*.java
javafxpackager -createjar -v -manifestAttrs Permissions=all-permissions -srcdir classes -outfile Chancecoin -outdir release -appclass GUI -classpath "resources/jars/slf4j-api-1.6.4.jar;resources/jars/slf4j-simple-1.6.4.jar;resources/jars/bitcoinj-0.11-bundled.jar;resources/jars/jackson-annotations-2.0.0.jar;resources/jars/jackson-core-2.0.0.jar;resources/jars/jackson-databind-2.0.0.jar;resources/jars/sqlite-jdbc-3.7.15-M1.jar;resources/jars/jetty9/lib/jetty-server-9.1.4.v20140401.jar;resources/jars/jetty9/lib/jetty-util-9.1.4.v20140401.jar;resources/jars/jetty9/lib/jetty-http-9.1.4.v20140401.jar;resources/jars/jetty9/lib/jetty-servlet-9.1.4.v20140401.jar;resources/jars/jetty9/lib/jetty-io-9.1.4.v20140401.jar;resources/jars/jetty9/lib/jetty-continuation-9.1.4.v20140401.jar;resources/jars/jetty9/lib/jetty-security-9.1.4.v20140401.jar;resources/jars/javax.servlet-api-3.1.0.jar;resources/jars/javax.servlet-5.1.12.jar;resources/jars/spark-core-1.1.1.jar;resources/jars/spark-template-freemarker-1.0.jar;resources/jars/spark-template-velocity-1.0.jar;resources/jars/freemarker.jar;resources/jars/jsonrpc4j-1.0.jar;resources/jars/portlet-api-2.0-r12.jar;resources/jars/java-json.jar"
javafxpackager -createjar -v -manifestAttrs Permissions=all-permissions -srcdir classes -outfile update -outdir release/update -appclass Update
cd ..
sh keysign.sh
