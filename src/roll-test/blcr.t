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

# blcr-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'blcr installed');
} else {
  ok(! $isInstalled, 'blcr not installed');
}
SKIP: {

  skip 'blcr not installed', 4 if ! $isInstalled;
  my $modulesInstalled = -f '/etc/profile.d/modules.sh';
  my $setup = $modulesInstalled ?
              ". /etc/profile.d/modules.sh; module load blcr" :
              'echo > /dev/null'; # noop

  # TODO functionality test

  skip 'modules not installed', 3 if ! $modulesInstalled;
  `/bin/ls /opt/modulefiles/applications/blcr/[0-9.]* 2>&1`;
  ok($? == 0, 'blcr module installed');
  `/bin/ls /opt/modulefiles/applications/blcr/.version.[0-9.]* 2>&1`;
  ok($? == 0, 'blcr version module installed');
  ok(-l '/opt/modulefiles/applications/blcr/.version',
     'blcr version module link created');

}

`rm -f $TESTFILE*`;
