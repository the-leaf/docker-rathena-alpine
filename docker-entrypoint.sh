#!/bin/sh
#set -e

if [ -z "$MYSQL_IP" ]; then
	echo >&2 'error: missing MYSQL_IP environment variable'
	echo >&2 ' Did you forget to --link rathena-mysql:mysql ?'
	exit 1
fi

sed -i "s|login_server_ip: 127.0.0.1|login_server_ip: ${MYSQL_IP}|g" ./conf/inter_athena.conf
sed -i "s|login_server_port: 3306|login_server_port: ${MYSQL_PORT}|g" ./conf/inter_athena.conf
sed -i "s|login_server_id: ragnarok|login_server_id: ${MYSQL_ENV_MYSQL_USER}|g" ./conf/inter_athena.conf
sed -i "s|login_server_pw: ragnarok|login_server_pw: ${MYSQL_ENV_MYSQL_PASSWORD}|g" ./conf/inter_athena.conf
sed -i "s|login_server_db: ragnarok|login_server_db: ${MYSQL_ENV_MYSQL_DATABASE}|g" ./conf/inter_athena.conf

sed -i "s|map_server_ip: 127.0.0.1|map_server_ip: ${MYSQL_IP}|g" ./conf/inter_athena.conf
sed -i "s|map_server_port: 3306|map_server_port: ${MYSQL_PORT}|g" ./conf/inter_athena.conf
sed -i "s|map_server_id: ragnarok|map_server_id: ${MYSQL_ENV_MYSQL_USER}|g" ./conf/inter_athena.conf
sed -i "s|map_server_pw: ragnarok|map_server_pw: ${MYSQL_ENV_MYSQL_PASSWORD}|g" ./conf/inter_athena.conf
sed -i "s|map_server_db: ragnarok|map_server_db: ${MYSQL_ENV_MYSQL_DATABASE}|g" ./conf/inter_athena.conf

sed -i "s|char_server_ip: 127.0.0.1|char_server_ip: ${MYSQL_IP}|g" ./conf/inter_athena.conf
sed -i "s|char_server_port: 3306|char_server_port: ${MYSQL_PORT}|g" ./conf/inter_athena.conf
sed -i "s|char_server_id: ragnarok|char_server_id: ${MYSQL_ENV_MYSQL_USER}|g" ./conf/inter_athena.conf
sed -i "s|char_server_pw: ragnarok|char_server_pw: ${MYSQL_ENV_MYSQL_PASSWORD}|g" ./conf/inter_athena.conf
sed -i "s|char_server_db: ragnarok|char_server_db: ${MYSQL_ENV_MYSQL_DATABASE}|g" ./conf/inter_athena.conf

sed -i "s|ipban_db_ip: 127.0.0.1|ipban_db_ip: ${MYSQL_IP}|g" ./conf/inter_athena.conf
sed -i "s|ipban_db_port: 3306|ipban_db_port: ${MYSQL_PORT}|g" ./conf/inter_athena.conf
sed -i "s|ipban_db_id: ragnarok|ipban_db_id: ${MYSQL_ENV_MYSQL_USER}|g" ./conf/inter_athena.conf
sed -i "s|ipban_db_pw: ragnarok|ipban_db_pw: ${MYSQL_ENV_MYSQL_PASSWORD}|g" ./conf/inter_athena.conf
sed -i "s|ipban_db_db: ragnarok|ipban_db_db: ${MYSQL_ENV_MYSQL_DATABASE}|g" ./conf/inter_athena.conf

sed -i "s|log_db_ip: 127.0.0.1|log_db_ip: ${MYSQL_IP}|g" ./conf/inter_athena.conf
sed -i "s|log_db_port: 3306|log_db_port: ${MYSQL_PORT}|g" ./conf/inter_athena.conf
sed -i "s|log_db_id: ragnarok|log_db_id: ${MYSQL_ENV_MYSQL_USER}|g" ./conf/inter_athena.conf
sed -i "s|log_db_pw: ragnarok|log_db_pw: ${MYSQL_ENV_MYSQL_PASSWORD}|g" ./conf/inter_athena.conf
sed -i "s|log_db_db: ragnarok|log_db_db: ${MYSQL_ENV_MYSQL_DATABASE}|g" ./conf/inter_athena.conf

if [ -z "$PUBLIC_IP" ]; then
	PUBLIC_IP=$(hostname -i)
fi

sed -i "s/\/\/login_port: 6900/login_port: ${PUBLIC_LOGIN_PORT}/g" ./conf/login_athena.conf

sed -i "s/\/\/char_ip: 127.0.0.1/char_ip: ${PUBLIC_IP}/g" ./conf/char_athena.conf
sed -i "s/\/\/login_port: 6900/login_port: ${PUBLIC_LOGIN_PORT}/g" ./conf/char_athena.conf
sed -i "s/\/\/char_port: 6121/char_port: ${PUBLIC_CHAR_PORT}/g" ./conf/char_athena.conf
sed -i "s/\/\/userid: s1/userid: ${LOGIN_USER_DB}/g" ./conf/char_athena.conf
sed -i "s/\/\/passwd: p1/passwd: ${LOGIN_PASS_DB}/g" ./conf/char_athena.conf

sed -i "s/\/\/map_ip: 127.0.0.1/map_ip: ${PUBLIC_IP}/g" ./conf/map_athena.conf
sed -i "s/\/\/char_port: 6121/char_port: ${PUBLIC_CHAR_PORT}/g" ./conf/map_athena.conf
sed -i "s/\/\/map_port: 5121/map_port: ${PUBLIC_MAP_PORT}/g" ./conf/map_athena.conf
sed -i "s/\/\/userid: s1/userid: ${LOGIN_USER_DB}/g" ./conf/map_athena.conf
sed -i "s/\/\/passwd: p1/passwd: ${LOGIN_PASS_DB}/g" ./conf/map_athena.conf

exec "$@"
