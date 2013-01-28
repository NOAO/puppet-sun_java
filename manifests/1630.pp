class sun_java::1630 {
  include sun_java::params

  $package_list = [
    'jdk-1.6.0_30',
    'sun-javadb-common-10.6.2',
    'sun-javadb-demo-10.6.2',
    'sun-javadb-javadoc-10.6.2',
    'sun-javadb-client-10.6.2',
    'sun-javadb-core-10.6.2',
    'sun-javadb-docs-10.6.2',
  ]

  $path = "/usr/java/jdk1.6.0_30/bin"
  $priority = 1630

  class{"sun_java::install":
   package_list => $package_list, 
  }

  class{"sun_java::config":
    path      => $path,
    priority  => $priority,
  }
}
