# Web Tech 3 Projekt Box

## Projekt

### Vagrant installieren
[Vagrant](https://www.vagrantup.com/downloads.html) herunterladen und installieren.

Nach der Installation überprüfen ob Vagrant richtig installiert wurde.  
    
    vagrant -v
    
Vagrant Hostmanager installieren.    

    vagrant plugin install vagrant-hostmanager
  
#### Ausführen
Projekt per PHPStorm auschecken.  

In PHPStorm Terminal öffnen und vagrant starten.  

	cd dev
	vagrant up

Setupscript starten (installiert Abhängigkeiten).  

    vagrant ssh
    cd /project/dev
	chmod 777 setup.sh
	./setup.sh

PHPStorm neustarten und dann "Update Project" um die eigenen Pakete auf "master" zu aktualisieren.  


#### Mit Box verbinden

    cd dev
	vagrant ssh
 

## Datenbank

#### Verbinden

    MySQL-Host: 0.0.0.0
    Benutzer: root
    Passwort: root
    SSH-Host: 127.0.0.1
    SSH-Benutzer: ubuntu
    SSH-Port: 2222
    SSH-Schlüsselpfad: dev/.vagrant/machines/wt-projekt.test/virtualbox/private_key

###### Mac
https://www.sequelpro.com/  

###### Windows

#### Archivieren

#### Spiegeln