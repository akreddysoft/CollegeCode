
 #!/usr/bin/perl

 sub print_coor
 {

     my ($x,$y,$z) = @_;

     print "$x $y $z \n";

     return $x;
  };

  $k = 1;

  $j = 2;

  $m = 3;

  $this  = print_coor($k,$j,$m);

 $that  = print_coor(4,5,6);

print("$this $that");
