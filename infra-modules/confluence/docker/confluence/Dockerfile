FROM atlassian/confluence-server:6.1

MAINTAINER Joe Rice

ENV CONFLUENCE_JDBC_USERNAME=confluence
ENV CONFLUENCE_JDBC_PASSWORD=password123
ENV CONFLUENCE_DATABASE_NAME=confluence
ENV CONFLUENCE_DATABASE_HOST=db
ENV CONFLUENCE_DATABASE_PORT=3306

COPY mysql-connector-java-5.1.44-bin.jar /opt/atlassian/confluence/lib/
COPY server.xml /opt/atlassian/confluence/conf/
COPY web.xml /opt/atlassian/confluence/confluence/WEB-INF/
