class sun_java::install ($package_list) {
  package{ $package_list:
    ensure  => present,
    require => Yumrepo["sun-java-1.6"],
  }
}
