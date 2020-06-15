#!/bin/bash 

tmp=".war"

mkdir -p $tmp/WEB-INF
cp uws.jsp $tmp

cat > $tmp/WEB-INF/web.xml <<EOF
<?xml version="1.0" ?>
<web-app xmlns="http://java.sun.com/xml/ns/j2ee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee
http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd"
         version="2.4">
    <servlet>
        <servlet-name>uws</servlet-name>
        <jsp-file>uws.jsp</jsp-file>
    </servlet>
</web-app>
EOF

cd $tmp && jar cvf ../uws.war WEB-INF uws.jsp && rm -rf ../$tmp

