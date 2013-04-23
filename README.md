vanilla-boxes
===

A collection of [veewee](https://github.com/jedi4ever/veewee) definitions of [Vagrant](http://www.vagrantup.com) **vanilla*** base boxes.

*\*vanilla - no ruby, gem, chef, puppet.*

## Before started

 1. Install [VirtualBox](https://www.virtualbox.org/)
 2. Install [Vagrant](http://www.vagrantup.com/)
 
## Building a vanilla box

```
git clone git://github.com/teohm/vanilla-boxes.git
cd vanilla-boxes

# Install veewee
bundle install --path gems/

# Build a VirtualBox VM
bundle exec veewee build 'quantal64-vanilla'

# Validate VM
bundle exec veewee validate 'quantal64-vanilla'

# Package VM as .box file
vagrant package --base 'quantal64-vanilla' --output 'boxes/quantal64-vanilla.box'
 
```


## License and authors

 * Author:: Huiming Teo ([@teohm](https://twitter.com/teohm))

Copyright 2013, Huiming Teo

Licensed under The MIT License.
