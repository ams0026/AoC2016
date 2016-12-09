#!/usr/bin/perl

$a1 = 0; $b1 = 0; $c1 = 0;
$a2 = 0; $b2 = 0; $c2 = 0;
$a3 = 0; $b3 = 0; $c3 = 0;
$count = 0; $validcount = 0;
$filename = 'day3input.txt';
$line1 = ""; $line2 = ""; $line3=""; 

open($datain,"<",$filename) or die "Could not open $filename $!";

while ($line1 = <$datain>){
    
    chomp $line1;
    ($a1, $b1, $c1) = split / /, $line1;

	$line2 = <$datain>;
	chomp $line2;
    ($a2, $b2, $c2) = split / /, $line2;

	$line3 = <$datain>;
	chomp $line3;
    ($a3, $b3, $c3) = split / /, $line3;
	
	print "$a1\t$a2\t$a3\n$b1\t$b2\t$b3\n$c1\t$c2\t$c3\n\n";

	if ((($a1 + $a2) > $a3) && 
		(($a1 + $a3) > $a2) && 
		(($a2 + $a3) > $a1))
		{
			$validcount++; 
		} else {
		   #this triangle is invalid		   
		}
	
	if ((($b1 + $b2) > $b3) && 
		(($b1 + $b3) > $b2) && 
		(($b2 + $b3) > $b1))
		{
			$validcount++; 
		} else {
		   #this triangle is invalid		   
		}
	
	if ((($c1 + $c2) > $c3) && 
		(($c1 + $c3) > $c2) && 
		(($c2 + $c3) > $c1))
		{
			$validcount++; 
		} else {
		   #this triangle is invalid		   
		}
		

   	
}

print "Number of valid triangles: $validcount\n";

close $datain;






