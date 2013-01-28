class sun_java::config ($path, $priority) {

  #/usr/sbin/alternatives --install /usr/bin/java java \
  #  /usr/java/jdk1.6.0_30/bin/java 1630
  #/usr/sbin/alternatives --set java /usr/java/jdk1.6.0_30/bin/java 

  define alternatives_install ($bin = $title, $path, $priority) {
    exec { "alternatives --install /usr/bin/$bin $bin $path/$bin $priority":
      path    => "/bin:/sbin:/usr/bin:/usr/sbin",
      unless  => "test /etc/alternatives/$bin -ef $path/$bin"
    } -> exec { "alternatives --set $bin $path/$bin":
      path    => "/bin:/sbin:/usr/bin:/usr/sbin",
      unless  => "test /etc/alternatives/$bin -ef $path/$bin"
    }
  }

  #  $path = "/usr/java/jdk1.6.0_30/bin"
  #  $priority = 1630

  # TODO: slave all the related utils to the java binary
  alternatives_install { ["java", "javac", "javadoc", "javah"]:
    path      => $path,
    priority  => $priority,
    require   => Class["sun_java::install"],

  }
}
