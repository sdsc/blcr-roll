#!/usr/bin/perl -w
# blcr roll installation test.  Usage:
# blcr.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/blcr';
my $output;

my $TESTFILE = 'tmpblcr';

open(OUT, ">$TESTFILE.c");
print OUT <<END;
#include <stdio.h>
#include <unistd.h>
int main() {
  printf("Hello\\n");
  sleep(30);
  printf("World\\n");
  return 0;
}
END
close(OUT);

open(OUT, ">$TESTFILE.sh");
print OUT <<END;
module load gnu blcr
gcc -o $TESTFILE.exe $TESTFILE.c -L\$BLCRHOME/lib -lcr_run -u cr_run_link_me
cr_run ./$TESTFILE.exe &
pid=\$!
sleep 2
cr_checkpoint --file $TESTFILE.context \$pid
cr_restart $TESTFILE.context
END
close(OUT);

# blcr-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'blcr installed');
} else {
  ok(! $isInstalled, 'blcr not installed');
}

SKIP: {

  skip 'blcr not installed', 5 if ! $isInstalled;

  $output = `/bin/bash $TESTFILE.sh 2>&1`;
  ok(-f "$TESTFILE.exe", 'link w/blcr');
  like($output, qr/World.*World/s, 'Simple blcr run');

  `/bin/ls /opt/modulefiles/applications/blcr/[0-9.]* 2>&1`;
  ok($? == 0, 'blcr module installed');
  `/bin/ls /opt/modulefiles/applications/blcr/.version.[0-9.]* 2>&1`;
  ok($? == 0, 'blcr version module installed');
  ok(-l '/opt/modulefiles/applications/blcr/.version',
     'blcr version module link created');

}

`rm -f $TESTFILE*`;
