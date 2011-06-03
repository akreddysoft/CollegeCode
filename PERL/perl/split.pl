#If you use split with a limit, you can assign to several scalar variables at 
#once: $line = "11 12 13 14 15"; ($var1, $var2, $line) = split (/\s+/, $line, 3); 
#This splits $line into the list ("11", "12", "13 14 15"). $var1 is assigned 11, 
#$var2 is assigned 12, and $line is assigned "13 14 15". This enables you to 
#assign the "leftovers" to a single variable, which can then be split again at a 
#later time 