
1:  #!/usr/local/bin/perl

2:  

3:  # define the strings used in printing

4:  @digitword = ("", "one", "two", "three", "four", "five",

5:       "six", "seven", "eight", "nine");

6:  @digit10word = ("", "ten", "twenty", "thirty", "forty",

7:       "fifty", "sixty", "seventy", "eighty", "ninety");

8:  @teenword = ("ten", "eleven", "twelve", "thirteen", "fourteen",

9:      "fifteen", "sixteen", "seventeen", "eighteen", "nineteen");

10: @groupword = ("", "thousand", "million", "billion", "trillion",

11:     "quadrillion", "quintillion", "sextillion", "septillion",

12:     "octillion", "novillion", "decillion");

13: 

14: # read a line of input and remove all blanks, commas and tabs;

15: # complain about anything else

16: $inputline = <STDIN>;

17: chop ($inputline);

18: $inputline =~ s/[, \t]+//g;

19: if ($inputline =~ /[^\d]/) {

20:          die ("Input must be a number.\n");

21: }

22: 

23: # remove leading zeroes

24: $inputline =~ s/^0+//;

25: $inputline =~ s/^$/0/;  # put one back if they're all zero

26: 

27: # split into digits: $grouping contains the number of groups

28: # of digits, and $oddlot contains the number of digits in the

29: # first group, which may be only 1 or 2 (e.g., the 1 in 1,000)

30: @digits = split(//, $inputline);

31: if (@digits > 36) {

32:         die ("Number too large for program to handle.\n");

33: }

34: $oddlot = @digits % 3;

35: $grouping = (@digits-1) / 3;

36: 

37: # this loop iterates once for each grouping

38: $count = 0;

39: while ($grouping >= 0) {

40:         if ($oddlot == 2) {

41:                 $digit1 = 0;

42:                 $digit2 = $digits[0];

43:                 $digit3 = $digits[1];

44:                 $count += 2;

45:         } elsif ($oddlot == 1) {

46:                 $digit1 = 0;

47:                 $digit2 = 0;

48:                 $digits = $digits[0];

49:                 $count += 1;

50:         } else {      # regular group of three digits

51:                 $digit1 = $digits[$count];

52:                 $digit2 = $digits[$count+1];

53:                 $digit3 = $digits[$count+2];

54:                 $count += 3;

55:         }

56:         $oddlot = 0;

57:         if ($digit1 != 0) {

58:                 print ("$digitword[$digit1] hundred ");

59:         }

60:         if (($digit1 != 0 || ($grouping == 0 && $count > 3)) &&

61:             ($digit2 != 0 || $digit3 != 0)) {

62:                 print ("and ");

63:         }

64:         if ($digit2 == 1) {

65:                 print ("$teenword[$digit3] ");

66:         } elsif ($digit2 != 0 && $digit3 != 0) {

67:                 print ("$digit10word[$digit2]-$digitword[$digit3] ");

68:         } elsif ($digit2 != 0 || $digit3 != 0) {

69:                 print ("$digit10word[$digit2]$digitword[$digit3] ");

70:         }

71:         if ($digit1 != 0 || $digit2 != 0 || $digit3 != 0) {

72:                 print ("$groupword[$grouping]\n");

73:         } elsif ($count <= 3 && $grouping == 0) {

74:                 print ("zero\n");

75:         }

76:         $grouping-;

77: }
