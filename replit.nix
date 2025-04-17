{ pkgs }: {
  deps = [
    pkgs.php82
    pkgs.php82Extensions.mbstring
    pkgs.php82Extensions.pdo
    pkgs.php82Extensions.pdo_mysql
    pkgs.php82Extensions.zip
    pkgs.php82Extensions.xml
    pkgs.php82Extensions.bcmath
    pkgs.mysql
  ];
}
