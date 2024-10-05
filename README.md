# Environnement pour les TD et TP des modules "bases de données 2" et "bases de données 2 avancées"

Etudiants : L3 Miage CFA

## Logiciels à installer

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [VScode](https://code.visualstudio.com/download) et ces extensions :
  - [Extension Pack for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack)
  - [SQLTools](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools)
    - [SQLTools Oracle Driver
](https://marketplace.visualstudio.com/items?itemName=hurly.sqltools-oracle-driver)
    - Vous devez installer `node`, puis :
      - `cd /home/<user>/.local/share/vscode-sqltools` 
      - `npm install oracledb`
  - [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
  - [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
  - [PHP Intelephense](https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client)

## Construire les containers

Une fois les logiciels installés, lancez la commande :

```
docker compose build
```

Cette commande peut prendre du temps à s'exécuter car les images doivent être téléchargées.
Lancez ensuite :

```
docker compose up
```

Cette commande sera à lancer **à chaque début de TP**. La première fois prend plus de temps car la base de données doit être créée.

## Vérifier l'installation

### Base de données Oracle

Dans l'extension `SQLTools`, ajouter une nouvelle connexion avec les paramètres suivant :

- **Connection name**: `BD2_lab`
- **Connection using**: `Server and Port`
- **Server Address**: `localhost`
- **Port**: `1521`
- **Database**: `MYPDB`
- **Username**: `PH`
- **Use password**: `Save password`
- **Password**: `MySuperPassword2024`
- **privilege**: `Normal`

Cliquez sur `Test Connection` pour vérifier que tout marche correctement (`Test connection succeeded.`).

### PHP

1. **Installation de PHP** : Attendez que les containers soient prêts, puis vérifier que PHP est bien installé en suivant ce lien : [http://localhost:8080/index.php](http://localhost:8080/index.php).
La page ouverte doit afficher des informations sur votre installation PHP.
2. **Connexion à la base de donnée** : Ensuite, suivez ce lien : [http://localhost:8080/test.php](http://localhost:8080/test.php).
La page doit afficher "*Connexion réussie à Oracle!*".

Tous les fichiers PHP que vous aurez à créer devront aller dans le répertoire `php` et seront accessibles depuis votre navigateur à l'adresse `http://localhost:8080/<nom_fichier>.php`.

### Java

1. **Debugger dans le container Java** : En bas à gauche de votre fenêtre Visual Studio Code (VScode par la suite), cliquez sur l'icone bleue.
Choisissez `Attach to Running Container...` et choisissez `/java-app`.
Dans la nouvelle fenêtre VScode, cliquez sur `Open Folder...` et ouvrez `/app/`. 
Ne fermez pas la fenêtre VScode originelle.
2. **Installation de l'extension Java** : Dans le répertoire `src`, ouvrez le fichier `HelloWorld.java`. VScode vous demandera si vous souhaitez installer [Extension Pack for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack) : installez le.
3. **Installation de Java** : Une fois l'extension installée, pressez la touche `F5` pour lancez le debug de notre fichier.
Votre terminal doit afficher `Hello World!`.
4. **Connexion à la base de donnée** : Pour finir, nous allons vérifier que Java peut se connecter à la base de données.
Ouvrez le fichier `OracleJDBCTest.java` et appuyez sur `F5`. Votre terminal doit afficher `Connexion réussie à Oracle!`.

⚠️ L'étape 1 doit être répétée pour chaque TP basé sur Java !

Tous les fichiers Java que vous aurez à créer devront aller dans le répertoire `java`. 

## Commencer une séance de TP

Exécuter la commande suivante pour lancer les containers :

```
docker compose up
```

⚠️ Si le TP porte sur Java, exécutez la $1^{ère}$ étape de la section [Java](#java).

## Terminer une séance de TP

1. Si vous avez travaillé avec Java, fermez simplement la fenêtre VScode dans laquelle vous réalisé le TP.
2. Dans tous les cas, sur la fenêtre VScode originelle, cliquez sur le terminal où vous aviez lancé les containers puis appuiez sur `Ctrl+C`.
3. Une fois les containers fermés, vous pouvez aussi fermer la fenêtre VScode.

