# Web Tech 3 Projekt Box

## Projekt

### Vagrant installieren
[Vagrant](https://www.vagrantup.com/downloads.html) herunterladen und installieren.

Nach der Installation überprüfen ob Vagrant richtig installiert wurde.  
    
    vagrant -v
    
Vagrant Hostmanager installieren.    

    vagrant plugin install vagrant-hostmanager
  
#### Ausführen

	cd dev
	vagrant up

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
Kommt noch...

#### Archivieren
Kommt noch...

#### Spiegeln
Kommt noch...

## Entwicklung / Funktion
Alles was im Ordner source/www liegt ist für den Webserver unter [http://wt-projekt.test](http://wt-projekt.test) erreichbar.  
Hier muss der source code eurer Applikation hinterlegt werden.

### PHPMyAdmin
[http://wt-projek.test/phpmyadmin](http://wt-projekt.test/phpmyadmin)

    Benutzer: root
    Password: root

### Url ändern
Kommt noch...