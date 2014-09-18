# SDSC "blcr" roll

## Overview

This Rocks roll bundles the blcr checkpointing library.  For more information
about blcr, please visit the
<a href="http://crd.lbl.gov/groups-depts/ftg/projects/current-projects/BLCR"
target="_blank">official web page</a>.


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate blcr source file(s) using a machine that does have
Internet access and copy them into the `src/blcr` directory on your Rocks
development machine.


## Dependencies

None.

## Building

To build the blcr-roll, execute these instructions on a Rocks development machine
(e.g., a frontend or development appliance):

```shell
% make default 2>&1 | tee build.log
% grep "RPM build error" build.log
```

If nothing is returned from the grep command then the roll should have been
created as... `blcr-roll-*.iso`. If you built the roll on a Rocks frontend then
proceed to the installation step. If you built the roll on a Rocks development
appliance you need to copy the roll to your Rocks frontend before continuing
with installation.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll blcr
% cd /export/rocks/install
% rocks create distro
% rocks run roll blcr | bash
```

In addition to the software itself, the roll installs blcr environment module
files in:

```shell
/opt/modulefiles/applications/blcr
```

## Testing

The blcr-roll includes a test script which can be run to verify proper installation
of the blcr-roll documentation, binaries and module files. To run the test scripts
execute the following command(s):

```shell
% /root/rolltests/blcr.t 
```

