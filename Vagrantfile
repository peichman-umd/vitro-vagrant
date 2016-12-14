# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "puppetlabs/centos-7.0-64-puppet"
  config.vm.box_version = '1.0.1'

  config.vm.network "private_network", ip: "192.168.40.15"

  config.vm.synced_folder 'dist', '/apps/dist'

  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end

  # system packages
  config.vm.provision 'puppet'

  # configure firewall
  config.vm.provision 'shell', path: 'scripts/openports.sh', args: [8080]
  # install JDK
  config.vm.provision 'shell', path: 'scripts/jdk.sh'
  # install Tomcat
  config.vm.provision 'shell', path: 'scripts/tomcat.sh'
  # install Vitro
  config.vm.provision 'shell', path: 'scripts/vitro.sh'

  # runtime config for Vitro
  config.vm.provision 'file', source: 'files/log4j.properties',
    destination: '/apps/vitro/tomcat/webapps/vitro/WEB-INF/classes/log4j.properties'
  config.vm.provision 'file', source: 'files/vitrosolr/log4j.properties',
    destination: '/apps/vitro/tomcat/webapps/vitrosolr/WEB-INF/classes/log4j.properties'
  config.vm.provision 'file', source: 'files/applicationSetup.n3',
    destination: '/apps/vitro/data/config/applicationSetup.n3'
  config.vm.provision 'file', source: 'files/runtime.properties',
    destination: '/apps/vitro/data/runtime.properties'
  config.vm.provision 'file', source: 'files/control',
    destination: '/apps/vitro/tomcat/control'

  # Unicode check issues with Postgres
  # checking unicode handling by db happens here:
  # https://github.com/vivo-project/Vitro/blob/d1a93743fc62639157bff01c2db2d54b334806fa/api/src/main/java/edu/cornell/mannlib/vitro/webapp/triplesource/impl/sdb/SDBConnectionSmokeTests.java#L109
  # it is throwing spurious errors with postgres, because postgres is returning
  # a string with escapes and the byte values of the UTF-8 encoded text, and not
  # actual UTF-8 bytes
  # input: U+0041 U+0042 U+0043 U+00CE U+0123 => 41 42 43 c3 8e c4 a3
  # output: U+005C U+0078 U+0034 U+0031 U+0034 U+0032 U+0034 U+0033 U+0063 U+0033 U+0038 U+0065 U+0063 U+0034 U+0061 U+0033
  # which equals the literal string \x414243c38ec4a3
  # this warning is spurious, as unicode entered via the forms is saved
  # correctly
end
