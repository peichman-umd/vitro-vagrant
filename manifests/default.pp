Package {
  allow_virtual => false,
}

package { "maven":
  ensure => present,
}
package { "lsof":
  ensure => present,
}
package { "tree":
  ensure => present,
}
package { "vim":
  ensure => present,
}
