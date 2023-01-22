# Odoo template 

This repository want easily start the project.
***

## Start the project

### Step 1 - Clone the repository and rename folder, replase **PROJECT_NAME** with your project name, if necessary use _ for separate the words.
```sh
git clone git@github.com:JSilva723/odoo_template.git PROJECT_NAME
```

E.g: **my_module**
```sh
git clone git@github.com:JSilva723/odoo_template.git my_module
```

### Step 2 - Move it to the folder.
```sh
cd PROJECT_NAME
```

### Step 3 - Start the proyect
```sh
make init
```

### Step 4 - Up server and data base
```sh
make up
```

### Step 5 - See logs
```sh
make tail
```
Await see **cron0 started!** and **cron1 started!**, for close logs 
```sh
CTRL + C
```

### Step 6 - Visit http://localhost:8069
***

## Create new module

For create custom module execute make scaffold with name of module.
```sh
make scaffold name="name_of_module"
```
***
## Others commnds

Stop server and database
```sh
make down
```

For use Odoo SHELL
```sh
make shell
```

Upgrade module with command
```sh
make upgrade
```
***

## Requeriments

This repository it was thinks, for Linux user.

Need install [**Docker and Docker-compose**](https://docs.docker.com/compose/install/)