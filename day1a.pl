#!/usr/bin/env perl

@instructions = ("R4", "R3", "R5", "L3", "L5", "R2", "L2", "R5", "L2", "R5", "R5", "R5", "R1", "R3", "L2", "L2", "L1", "R5", "L3", "R1", "L2", "R1", "L3", "L5", "L1", "R3", "L4", "R2", "R4", "L3", "L1", "R4", "L4", "R3", "L5", "L3", "R188", "R4", "L1", "R48", "L5", "R4", "R71", "R3", "L2", "R188", "L3", "R2", "L3", "R3", "L5", "L1", "R1", "L2", "L4", "L2", "R5", "L3", "R3", "R3", "R4", "L3", "L4", "R5", "L4", "L4", "R3", "R4", "L4", "R1", "L3", "L1", "L1", "R4", "R1", "L4", "R1", "L1", "L3", "R2", "L2", "R2", "L1", "R5", "R3", "R4", "L5", "R2", "R5", "L5", "R1", "R2", "L1", "L3", "R3", "R1", "R3", "L4", "R4", "L4", "L1", "R1", "L2", "L2", "L4", "R1", "L3", "R4", "L2", "R3", "L1", "L5", "R4", "R5", "R2", "R5", "R1", "R5", "R1", "R3", "L3", "L2", "L2", "L5", "R2", "L2", "R5", "R5", "L2", "R3", "L5", "R5", "L2", "R4", "R2", "L1", "R3", "L5", "R3", "R2", "R5", "L1", "R3", "L2", "R2", "R1" );
#@instructions = ("R1", "R1", "R1", "R1");
#@instructions = ("L1", "L1", "L1", "L1");
#@instructions = ("R5", "L5", "R5", "R3");

$nsflag = 1; #starting in an arbitrary direction; facing north
$ewflag = 0;
$north = 0; $west = 0; $south = 0; $east=0;
$ns = 0; $ew = 0;


$position = 0; 

print "North\n";

for (@instructions){
  $item = $_;
  print "This instruction is $item \t";
  $a = substr $item, 0, 1;
  $n = substr $item, 1;
  if ($a eq "R") {
	if ($nsflag == 1 && $ewflag == 0) {
		$nsflag = 0; $ewflag = 1;
		print "East\n";
		$ew = $ew + $n;
		$east = $east + $n;
	} elsif ($nsflag == 0 && $ewflag == 1) {
		$nsflag = -1; $ewflag = 0;
		print "South\n";
		$ns = $ns - $n;
		$south = $south + $n;
	} elsif ($nsflag == -1 && $ewflag == 0) {
		$nsflag = 0; $ewflag = -1;
		print "West\n";
		$ew = $ew - $n;
		$west = $west + $n;
	} elsif ($nsflag == 0 && $ewflag == -1) {
		$nsflag = 1; $ewflag = 0;
		print "North\n";
		$ns = $ns + $n;
		$north = $north + $n;
	} 
  } elsif ($a eq "L") {
	if ($nsflag == 1 && $ewflag == 0) {
		$nsflag = 0; $ewflag = -1;
		print "West\n";
		$ew = $ew - $n;
		$west = $west + $n;
	} elsif ($nsflag == 0 && $ewflag == -1) {
		$nsflag = -1; $ewflag = 0;
		print "South\n";
		$ns = $ns - $n;
		$south = $south + $n;
	} elsif ($nsflag == -1 && $ewflag == 0) {
		$nsflag = 0; $ewflag = 1;
		print "East\n";
		$ew = $ew + $n;
		$east = $east + $n;
	} elsif ($nsflag == 0 && $ewflag == 1) {
		$nsflag = 1; $ewflag = 0;
		print "North\n";
		$ns = $ns + $n;
		$north = $north + $n;
	}
  } else {
     print "Bad input received. Exiting.\n";
	 print "Item:$item A:$a N:$n\nRemaining Instructions:\n";
	 print @instructions;
	 print "\n";
	 exit
  }
}

print "\nProcessing instructions complete. \n";
print "current positions: North/South: $ns East/West: $ew\n";
print "Max: North $north West $west South $south East $east\n";
$position = (abs($ns) + abs($ew));
print "Location is: $position blocks away\n";


