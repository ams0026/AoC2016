#!/usr/bin/env perl

#@instructions = ("R4", "R3", "R5", "L3", "L5", "R2", "L2", "R5", "L2", "R5", "R5", "R5", "R1", "R3", "L2", "L2", "L1", "R5", "L3", "R1", "L2", "R1", "L3", "L5", "L1", "R3", "L4", "R2", "R4", "L3", "L1", "R4", "L4", "R3", "L5", "L3", "R188", "R4", "L1", "R48", "L5", "R4", "R71", "R3", "L2", "R188", "L3", "R2", "L3", "R3", "L5", "L1", "R1", "L2", "L4", "L2", "R5", "L3", "R3", "R3", "R4", "L3", "L4", "R5", "L4", "L4", "R3", "R4", "L4", "R1", "L3", "L1", "L1", "R4", "R1", "L4", "R1", "L1", "L3", "R2", "L2", "R2", "L1", "R5", "R3", "R4", "L5", "R2", "R5", "L5", "R1", "R2", "L1", "L3", "R3", "R1", "R3", "L4", "R4", "L4", "L1", "R1", "L2", "L2", "L4", "R1", "L3", "R4", "L2", "R3", "L1", "L5", "R4", "R5", "R2", "R5", "R1", "R5", "R1", "R3", "L3", "L2", "L2", "L5", "R2", "L2", "R5", "R5", "L2", "R3", "L5", "R5", "L2", "R4", "R2", "L1", "R3", "L5", "R3", "R2", "R5", "L1", "R3", "L2", "R2", "R1" );
#@instructions = ("R1", "R1", "R1", "R1");
#@instructions = ("L1", "L1", "L1", "L1");
#@instructions = ("R5", "L5", "R5", "R3");
@instructions = ("R8", "R4", "R4", "R8");

$nsflag = 1; #starting facing north
$ewflag = 0;
$north = 0; $west = 0; $south = 0; $east=0;
$ns = 0; $ew = 0; $nstoo = 0; $ewtoo = 0;
$position = 0; $count = 0;
for ($x = 0, $x<250, $x++){
	for ($y = 0, $y < 250, $y++){
		$map[$x][$y] = (".");
    }
}
print "map is populated. \n";

for (@instructions){
  $item = $_;
  $a = substr $item, 0, 1;
  $n = substr $item, 1;
  if ($a eq "R") {
	if ($nsflag == 1 && $ewflag == 0) {
		$nsflag = 0; $ewflag = 1;
	} elsif ($nsflag == 0 && $ewflag == 1) {
		$nsflag = -1; $ewflag = 0;
	} elsif ($nsflag == -1 && $ewflag == 0) {
		$nsflag = 0; $ewflag = -1;
	} elsif ($nsflag == 0 && $ewflag == -1) {
		$nsflag = 1; $ewflag = 0;
	} 
  } elsif ($a eq "L") {
	if ($nsflag == 1 && $ewflag == 0) {
		$nsflag = 0; $ewflag = -1;
	} elsif ($nsflag == 0 && $ewflag == -1) {
		$nsflag = -1; $ewflag = 0;
	} elsif ($nsflag == -1 && $ewflag == 0) {
		$nsflag = 0; $ewflag = 1;
	} elsif ($nsflag == 0 && $ewflag == 1) {
		$nsflag = 1; $ewflag = 0;
	}
  } else {
     print "Bad input received. Exiting.\n";
	 print "Item:$item A:$a N:$n\nRemaining Instructions:\n";
	 print @instructions;
	 print "\n";
	 exit
  }
	$count = $count + 1; print "Number of steps: $count\n";
    $ew = $ewtoo + ($ewflag * ($n));
	$ns = $nstoo + ($nsflag * ($n));
	if ($ew != $ewtoo){
	   for ($d = $ewtoo, $d != $ew, $d + $n) { #process X axis
			if ($map[$d+10][$nstoo] = ".") {$map[$d+10][$nstoo]="-";}
			if ($map[$d+10][$nstoo] = "-") {$map[$d+10][$nstoo]="+";
			  print "first revisit at $d $nstoo\n";
			  exit;
			}
			$ewtoo = $ew;	   
	   }
	} elsif ($ns ne $nstoo) {
	   for ($d = $nstoo, $d != $ns, $d + $n) { #process Y axis
			if ($map[$ewtoo][$d+100] = ".") {$map[$ewtoo][$d+100]="-";}
			if ($map[$ewtoo][$d+100] = "-") {$map[$ewtoo][$d+100]="+";
			  print "first revisit at $ewtoo $d \n";
			  exit;
			}
			$nstoo = $ns;	   
	   }
	}
	
	print "$count: $ewtoo\t$nstoo\n";
	if ($ewtoo < $west) {$west = $ewtoo;}
	if ($ewtoo > $east) {$east = $ewtoo;}
	if ($nstoo < $south) {$south = $nstoo;}
	if ($nstoo > $north) {$north = $nstoo;}
	

}

print "\nProcessing instructions complete. \n";
print "Max: North $north West $west South $south East $east\n";
print "current position too: NStoo $nstoo EWtoo: $ewtoo\n";
$position = (abs($nstoo) + abs($ewtoo));
print "Location is: $position blocks away\n";


