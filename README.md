vanilla-boxes
===

A collection of [veewee](https://github.com/jedi4ever/veewee) definitions of [Vagrant](http://www.vagrantup.com) **vanilla*** base boxes.

*\*vanilla - no ruby, gem, chef, puppet.*

## Downloads

 * [Ubuntu Precise 32 Vanilla (12.04.2)](https://dl.dropboxusercontent.com/u/165709740/boxes/precise32-vanilla.box)
 * [Ubuntu Precise 64 Vanilla (12.04.2)](https://dl.dropboxusercontent.com/u/165709740/boxes/precise64-vanilla.box)
 * [Ubuntu Quantal 32 Vanilla (12.10)](https://dl.dropboxusercontent.com/u/165709740/boxes/quantal32-vanilla.box)
 * [Ubuntu Quantal 64 Vanilla (12.10)](https://dl.dropboxusercontent.com/u/165709740/boxes/quantal64-vanilla.box)
 * [Ubuntu Raring 32 Vanilla (13.04)](http://goo.gl/y79mW)
 * [Ubuntu Raring 64 Vanilla (13.04)](http://goo.gl/ceHWg)

Now also available at Baidu Drive, in case my Dropbox account exceeds its download bandwidth limits
 * [http://pan.baidu.com/share/link?shareid=455850040&uk=2151416522#dir/path=%2Fboxes](http://pan.baidu.com/share/link?shareid=455850040&uk=2151416522#dir/path=%2Fboxes)

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
bundle exec veewee vbox build 'quantal64-vanilla'

# Validate VM - you should see failing tests for Ruby, Rubygems, Chef and Puppet
bundle exec veewee vbox validate 'quantal64-vanilla'

# Package VM as .box file
vagrant package --base 'quantal64-vanilla' --output 'boxes/quantal64-vanilla.box'
```

If packaging VM fails with error 
`undefined method 'ui' for true:TrueClass`, try to apply 
[this patch](https://github.com/mitchellh/vagrant/commit/45267c85fe71d64470e8d12a216a63dcef67e2e4) on
Vagrant.

## License and authors

 * Author:: Huiming Teo ([@teohm](https://twitter.com/teohm))

Copyright 2013, Huiming Teo

Licensed under The MIT License.
