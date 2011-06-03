#!/usr/bin/perl
use strict;
use warnings;

my $debug=0;
my $count1=0;

my($num,@word,@options,@numlist);
open MYFILE,"wc.txt" or die "Cannot open file:$!";
while(<MYFILE>)
{
        $count1=$count1+1 if(/\+[a-zA-Z]*\+/)
}

my ($correctchoice,$total,$correct)=(0,0,0);

while(1)
{
	if(/linux/,$ENV{'TERM'})
	{
		system('clear');
	}
	else
	{
		system('cls');
	}
	
	my ($count,$index,@indexlist)=0,0,0;	
	seek(MYFILE,0,0);
	
	foreach my $i(0..4)
	{
		$numlist[$i]=int(rand($count1));        #this is the word displaed
	}
	
	$index=int(rand(5));
	
	while(<MYFILE>)
	{
	        if(/\+[a-zA-Z]*\+/)
	        {
	                if($count==$numlist[0])
	                {
	                        @word=split(/\+/);
	                        print $word[1] if $debug;
	                        $index=int(rand(5));
	                        print "\n@numlist\n" if $debug;
	                        print "\nm:",$index if $debug;
	                        $correctchoice=$index;
	                        push(@indexlist,$index);
	                        $options[$index]=<MYFILE>;                #save the correct option in the random position
	                }
	                if($count==$numlist[1]||$count==$numlist[2]||$count==$numlist[3]||$count==$numlist[4])
	                {
	                        $index=int(rand(5));
	                        while (&checkindex($index,@indexlist))
	                        {
	                                print "\n$count l:",$index if $debug;
	                                $index=int(rand(5));
	                        }
	                        push(@indexlist,$index);
	                        print "\n$count s:",$index if $debug;
	                        $options[$index]=<MYFILE>;
	                }
	                $count=$count+1;
	        }
	}
	
	print "@options" if $debug;


	$~="MAINFORMAT";
	write;
	
	print "Enter your choice:";
	my $choice=<STDIN>;
	chomp($choice);
	$total=$total+1;
	if($choice eq $correctchoice)
	{
		$correct=$correct+1;
		print "\nCorrect Answer";
	}
	else
	{
		print "\nWrong Answer";
		print "\tCorrect Answer: ",$correctchoice;
	}
	$~="ANSWERFORMAT";
	write;
	
	$choice=<STDIN>;
	chomp($choice);
	exit(1) if($choice eq 'n')
	
}

close MYFILE;

sub checkindex()
{
        my($i,@list)=@_;
        foreach my $j(@list)
        {
                if ($i==$j)
                {
                     
                        return 1;
                }
        }
        return 0;
}


format MAINFORMAT=

WORD : @<<<<<<<<<<<<<<<<<<<<<<<<<<<<		@<</@<<
$word[1],$numlist[0],$count1
====================================
0: @<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 $options[0]

1: @<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 $options[1]

2: @<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 $options[2]

3: @<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 $options[3]

4: @<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
 $options[4]

.

format ANSWERFORMAT=

Total Question: @<<		Correct Answers: @<<
$total,  $correct
Percentage: @##.##
$correct/$total*100
.
	
