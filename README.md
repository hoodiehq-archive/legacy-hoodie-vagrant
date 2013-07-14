
hoodiejs vagrant setup
======================

Goal of this project is to enable hoodiejs based development in a vagrant vm.

Prerequirements
===============

* [vagrant](http://www.vagrantup.com/)

Setup
=====

* checkout this repository [hoogie-vagrant](https://github.com/cainvommars/hoodie-vagrant)
* cd hoodie vagrant
* vagrant up

Now your vm with a fresh couchdb, nodejs and hoodie-cli will be setup.

You can either:
* vagrant ssh
* hoodie new myappname
* cd myappname
* hoodie start no-open-browser

Or start from your own machine:
* hoodie new myappname
* cd myappname
* hoodie start

Note
====

To use the vm as a couchdb sandbox you need to tell hoodie some more things:

export COUCH_URL=http://localhost:5985
export HOODIE_ADMIN_USER=admin
export HOODIE_ADMIN_PASS=mysecretpassword
