koha-salt-packer
======

Deichman Library System - Koha, created by http://www.packer.io/

* builder: www.virtualbox.org
* provisioner: http://docs.saltstack.com/

## Prerequisites
### Software
packer: for installation of packer, see http://www.packer.io/downloads.html

virtualbox: depending on your os. In a *.deb-context:

```sudo apt-get install virtualbox```

salt-minion: packer supports masterless minions. Depending on your os. In a *.deb-context:

```sudo apt-get install salt-minion```

### Datastore
A mysql with koha must be up and running and available for the image on port 3306.

## Usage
To build the virtualbox image containing koha:

```packer build koha.json```

To run the image containing koha, you first have to import it into Virtualbox:

```vboxmanage import output-ubuntu-14.04.amd64.virtualbox/koha-ubuntu-14.04.amd64.virtualbox.ovf```

Then start the virtual machine by:

```vboxmanage startvm koha-ubuntu-14.04.amd64.virtualbox --type headless```

Point your favourite browser to

http://192.168.50.10:8080    for the OPAC-gui

http://192.168.50.10:8081    for the admin-gui

To stop the virtual machine:

```vboxmanage controlvm koha-ubuntu-14.04.amd64.virtualbox poweroff```
