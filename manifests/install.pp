class sun_java::install ($package_list) {
  package{ $package_list:
    ensure  => present,
  }
}
