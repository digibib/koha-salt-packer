##########
# MYSQL
##########

install-mysql-server:
  pkg.installed:
    - name: mysql-server
    - skip_verify: True

mysqlrepl1:
  file.replace:
    - name: /etc/mysql/my.cnf
    - pattern: max_allowed_packet.+$
    - repl: max_allowed_packet = 64M
    - require:
      - pkg: mysql-server

mysqlrepl2:
  file.replace:
    - name: /etc/mysql/my.cnf
    - pattern: wait_timeout.+$
    - repl: wait_timeout = 6000
    - require:
      - pkg: mysql-server

start-mysql-service:
  service:
    - name: mysql
    - running
    - require:
      - pkg: mysql-server
    - watch:
      - file: /etc/mysql/my.cnf