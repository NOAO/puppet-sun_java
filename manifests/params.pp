class sun_java::params {
  case $::osfamily {
    'redhat': { }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
