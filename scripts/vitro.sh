#!/bin/bash

# Vitro
VITRO_VERSION=1.9.1
VITRO_TGZ=/apps/dist/vitro-${VITRO_VERSION}.tar.gz
# look for a cached tarball
if [ ! -e "$VITRO_TGZ" ]; then
    VITRO_PKG_URL=https://github.com/vivo-project/Vitro/releases/download/rel-${VITRO_VERSION}/vitro-${VITRO_VERSION}.tar.gz
    curl -Lso "$VITRO_TGZ" "$VITRO_PKG_URL"
fi

mkdir -p /apps/vitro-${VITRO_VERSION}
tar xvzf "$VITRO_TGZ" --directory /apps/vitro-${VITRO_VERSION}

# Build
cp /vagrant/files/example-settings.xml /apps/vitro-${VITRO_VERSION}
mkdir -p /apps/vitro/data
cd /apps/vitro-${VITRO_VERSION}
mvn install -s example-settings.xml

chown -R vagrant:vagrant /apps/vitro/tomcat /apps/vitro/data
