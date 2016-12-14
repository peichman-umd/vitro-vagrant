# vitro-vagrant

Vagrant running Vitro 1.9.1

## Prerequisites

A PostgreSQL server with a `vitro` database set up on it. Currently the easiest way to get this is to use the [fcrepo-vagrant]'s PostgreSQL server (be sure you have the feature/LIBFCREPO-209 branch checked out):

```
git clone git@github.com:peichman-umd/fcrepo-vagrant.git \
    -b feature/LIBFCREPO-209
cd fcrepo-vagrant
# just start the PostgreSQL server,
# unless you need the whole fcrepo application stack
vagrant up postgres
```

You must also download an Oracle Java 1.8 JDK and place it in the [dist](dist) directory.

## Quick Start

```
git clone git@github.com:peichman-umd/vitro-vagrant.git
cd vitro-vagrant
vagrant up
vagrant ssh
cd /apps/vitro/tomcat
./control start
```

The application should be running at <http://192.168.40.15:8080/vitro>. You can log in using the credentials "lib-ssd@umd.edu" and "rootPassword". The application will prompt you to change your password after the first login.

**Note:** When you first start up the application, going the the <http://192.168.40.15:8080/vitro> page may display some smoke test warnings about the default namespace name and the database's storage of Unicode data. These can be safely ignored for now, and just click on the "Continue" link on the that page to go to the Vitro home page.

[fcrepo-vagrant]: https://github.com/peichman-umd/fcrepo-vagrant
