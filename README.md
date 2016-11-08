# Administrador de Restaurantes (Rails)

## Descripción

Este es un sistema desarrollado en Ruby on Rails. Este permite la administración de ingredientes, platillos y órdenes. La aplicación se encuentra dividida en diferentes secciones:

* Órdenes
* Órdenes Cerradas
* Platillos
* Ingredientes

El usuario podrá ver, crear, eliminar y actualizar (CRUD) ingredientes, platillos y órdenes. Los ingredientes son los datos más simples del sistema ya que sólo cuenta con los datos atómicos de lo que es u ingrediente. El platillo es una abstracción más compleja, ya que cada platillo se prepara con diferentes ingredientes. El usuario será capaz de realizar las mismas funciones mencionadas anteriormente, pero dentro de cada platillo.

La abstracción de las órdenes puede contar con diferentes platillos, dependiendo de lo que se ordene al personal. Estas, además de los platillos, cuentan con fecha de la orden y el total de la orden dependiendo del número de platillos que contenga. Por otro lado, las órdenes cuentan con un estado: _abierta_ y _cerrada_. Esto con la finalidad de no poder modificar las órdenes que se encuentren cerradas. Cabe mencionar que las órdenes abiertas pueden ser cerradas, por lo que desaparecerán de la lista principal para pasar a la lista de órdenes cerradas.

## Datos técnicos

La aplicación se desarrolló en el siguiente ambiente:

* Versión de Ruby: 2.2.4
* Versión de Rails: 4.2

## Levantar Servicio en Ubuntu

1. Descarga [Rbenv](http://rbenv.org/) (Administrador de versiones de Ruby)
    - Descarga las siguientes dependencias con el comando siguiente:
    ```shell
    $ sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
    ```
    - Descarga Rbenv con los siguientes comandos
    ```shell
    $ cd ~/
    $ git clone git://github.com/sstephenson/rbenv.git .rbenv
    $ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    $ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

    $ git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    $ echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
    $ source ~/.bash_profile
    ```
    - Toma en cuenta que .bash_profile puede ser .zshrc (si usas zsh) o .bashrc
2. Instala ruby con el siguiente comando
    ```shell
    $ rbenv install 2.2.4
    $ rbenv global 2.2.4
    ```

3. Instala la gema 'bundler'
    ```shell
    $ gem install bundler
    ```

4. Dirígete al directorio del proyecto que clonaste anteriormente de git. (`$ cd /path/to/project`)

5. Corre el siguiente comando:
    ```shell
    $ bundle install
    ```
6. Ahora se necesita crear la base de datos en [MySQL](https://www.mysql.com/), previamente descargado. Además, se necesita crear un usuario (en MySQL) con el nombre **restaurant** y la contraseña **rest123**. Estos valores pueden ser modificados en el archivo [config/database.yml](./config/database.yml)

7. A continuación se necesita crear la base de datos con el comando `rake db:create && rake db:migrate`

8. Si no existe error, al finalizar corre el comando `rails server` y desde un explorador, dirígete a [localhost con puerto 3000](http://localhost:3000).


* Nota: El proyecto viene con algunos datos de prueba en el archivo [seeds.rb](./db/seeds.rb) que podrás subir a la base de datos con el siguiente comando:

```shell
$ rake db:migrate:reset && rake db:seed
```

## Levantar Servicio en Windows

1. Descarga [RailsInstaller](http://railsinstaller.org/en)
