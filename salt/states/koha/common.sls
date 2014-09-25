##########
# KOHA-COMMON
##########
koharepo:
  pkgrepo.managed:
    - name: deb http://debian.koha-community.org/koha squeeze main
    - key_url: http://debian.koha-community.org/koha/gpg.asc

koha-common:
  pkg.installed:
    - skip_verify: True
    - version: "3.16.03"
    - require:
      - pkgrepo: koharepo
      - pkg: installdeps
      - pkg: install_apache2
