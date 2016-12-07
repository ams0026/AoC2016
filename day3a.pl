#!/usr/bin/perl

$a = 0; $b = 0; $c = 0; 
$count = 0; $validcount = 0; 
$filename = 'day3input.txt';  

open($datain,"<",$filename) or die "Could not open $filename $!";

while ($dataline = <$datain>){
	
	chomp $dataline; 
	($a, $b, $c) = split / /, $dataline; 
	
	print "$count: a: $a b: $b c: $c \n"; 
	
	if ((($a + $b) >= $c) && (($a + $c) >= $b) && (($b + $c) >=$a))
	{
		print "valid \n";
		$validcount++; 
	} else {
		print "invalid \n";
	}
	$count++;
}

print "Number of valid triangles: $validcount total rows: $count\n"; 

close $datain; 
	
	
	
	

 
