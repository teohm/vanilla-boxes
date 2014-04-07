# postinstall.sh created from Mitchell's official lucid32/64 baseboxes
date > /etc/vagrant_box_build_time

# Apt-install various things necessary for Ruby, guest additions,
# etc., and remove optional things to trim down the machine.
yum makecache
# yum update -y
#apt-get -y install linux-headers-$(uname -r) build-essential
#apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev
yum install -y vim

# Installing the virtualbox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
mount -o loop VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt

rm VBoxGuestAdditions_$VBOX_VERSION.iso

cd /tmp

# Setup sudo to allow no-password sudo for "admin"
groupadd -r admin
usermod -a -G admin vagrant
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers

# Add puppet user and group
#adduser --system --group --home /var/lib/puppet puppet

# Install NFS client
yum install -y nfs-utils

# Install Ruby from source in /opt so that users of Vagrant
# can install their own Rubies using packages or however.
#wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p286.tar.gz
#tar xvzf ruby-1.9.3-p286.tar.gz
#cd ruby-1.9.3-p286
#./configure --prefix=/opt/ruby
#make
#make install
#cd ..
#rm -rf ruby-1.9.3-p286
#rm ruby-1.9.3-p286.tar.gz

# Install RubyGems 1.8.24
#wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.24.tgz
#tar xzf rubygems-1.8.24.tgz
#cd rubygems-1.8.24
#/opt/ruby/bin/ruby setup.rb
#cd ..
#rm -rf rubygems-1.8.24
#rm rubygems-1.8.24.tgz

# Installing chef & Puppet
#/opt/ruby/bin/gem install chef --no-ri --no-rdoc
#/opt/ruby/bin/gem install puppet --no-ri --no-rdoc

# Add /opt/ruby/bin to the global path as the last resort so
# Ruby, RubyGems, and Chef/Puppet are visible
#echo 'PATH=$PATH:/opt/ruby/bin/'> /etc/profile.d/vagrantruby.sh

# Installing vagrant keys
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# TODO: remove useless packages like linux-headers, buildessensials, etc.

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Make sure Udev doesn't block our network
# http://6.ptmc.org/?p=164
echo "cleaning up udev rules"
rm -rf /etc/udev/rules.d/70-persistent-net.rules

exit
