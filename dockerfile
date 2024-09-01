FROM mysql:8.0

ENV MYSQL_ROOT_PASSWORD=password
ENV MYSQL_DATABASE=tlcn
ENV MYSQL_USER=tlcn
ENV MYSQL_PASSWORD=tlcn

COPY ./tlcn.sql /docker-entrypoint-initdb.d/setup.sql