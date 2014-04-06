Veewee::Session.declare({
  :cpu_count => '1',
  :memory_size=> '2048',
  :disk_size => '10140',
  :disk_format => 'VDI',
  :hostiocache => 'off',
  :os_type_id => 'Fedora_64',
  :iso_file => "Fedora-20-x86_64-DVD.iso",
  :iso_src => "http://mirrors.yun-idc.com/fedora/releases/20/Fedora/x86_64/iso/Fedora-20-x86_64-DVD.iso",
  :iso_md5 => '9a190c8b2bd382c2d046dbc855cd2f2b',
  :iso_download_timeout => "1000",
  :boot_wait => "4",
  :boot_cmd_sequence => [
    '<Esc>',
    'vmlinuz ',
    'initrd=initrd.img ks=http://%IP%:%PORT%/kickstart.cfg <Enter>',
  ],
  :kickstart_port => "7122",
  :kickstart_timeout => "10000",
  :kickstart_file => "kickstart.cfg",
  :ssh_login_timeout => "10000",
  :ssh_user => "vagrant",
  :ssh_password => "vagrant",
  :ssh_key => "",
  :ssh_host_port => "7222",
  :ssh_guest_port => "22",
  :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => "shutdown -P now",
  :postinstall_files => [ "postinstall.sh"],
  :postinstall_timeout => "10000"
})
