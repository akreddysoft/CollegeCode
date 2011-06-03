class ByteMath {
public static void main(String[] args) {
final byte x = 10, y = 10;

// x * y = 100 which should be in byte's range of {-128,127}
byte big = x * y;

System.out.println(big);
}
}


