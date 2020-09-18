# GTS GÉANT

In the GÉANT the deployment has moved to bare metal servers therefore this
deployment is now different than DFN. This tutorial will take you through the
steps to create bare metal servers in GTS GÉANT and configure them to run a
basic OS.

!!! note "TL;DR"
    The setup of the GTS GÉANT is by far the most manual network of them all, a
    lot has to be cleared with the operators if a completely new setup is to be
    made. We'll try to introduce you here to the basic process how we worked
    with this in the first setup and name the decision that have been made in
    our situation. Though this can change in a new approach.

## Create a GTS Account

An account can be created on the [GTS
webpage](https://gts.geant.org/login#register), clear the details with the
currently responsible operators as which institute you'll need to provide in the
process.

There is already an existing project with the name `SCIONLab` you can join.

The registration may take some time as the account has to be manually affirmed
by the GTS operators.

## GTS Server Setup

Bare Metal Servers (BMS) are reserved to projects for some time, this has to be
arranged again with the GTS operators again before a initialization of the
resources can begin. After this is cleared you can create a new type in `Types`
on the GTS page, add the BMS given to you by GÉANT. You do not need to create
connections between the machines here, they will get VLANs assigned by the GTS
admins, for now the topology simply needs to include all BMS and the OS you
would like to use.

In our case the machines were connected by 3 vlans creating a full-mesh between
them:

 x  | ams | ham | par
:--:|:---:|:---:|:---:
ams |  -  |  20 | 30 
ham |  20 |  -  | 10 
par |  30 |  10 | - 

Table showing the current VLANs between the BMS in Amsterdam, Hamburg, and Paris

### Setting up the disks

A full introduction for the BMS available is online at the [GTS
Wiki](https://wiki.geant.org/display/gn43wp7/GTS+User+Guide+v7.0%2C+rev.01#GTSUserGuidev7.0,rev.01-BareMetalServer(BMS))

!!! note "Account Requirement"
    The GTS Wiki requires you to sign into an acount to be able to access it,
    you can do that either with your institution account or public accounts such
    as bitbucket or google.

## Configure GTS Machines

Once the OS is installed use the setup script to instantiate the `scionlab` user
and prepare the system to be used as a SCIONLab node.

Next up are the network connections, in our setup the machines receive all VLAN
traffic on a singular interface on which we have to apply the VLAN tags to
filter out specific traffic.

For that we use systemd-networkd files to describe the interfaces and their ID
we expect to receive. The current systems can be found in the networkd section
of provided files, with subdirectories for each machine. They have to be
individually created for each machine.

!!! important "TODO" 
    Ask Cedric why this is in the `/run` directory, this memory is a tmpfs, if
    we get a full reboot this is cleared and not applied again.  I'll just link
    them into the documentation, to preserve them here.
    
This makes the configuration persistent to reboots and outages.

## Updating a GTS Machine

### Check for OS Upgrade

Running the `do-release-upgrade -c` on the current Ubuntu machines will tell you
if there is a new stable release available to be upgraded to.

!!! important
    Check this with the SCIONLab Team as they will know if the update
    can be performed without hindering functionality.

### Upgrading the OS

Currently the machines run Ubuntu 18.04 LTS. It is advisable to move up the LTS
version with 20.04 when the scionteam is ready and can ensure functionality. The
procedure to proceed in this case requires a reboot if no in-place upgrade is
performed.

!!! note "Performing in-place upgrade"
    We'll describe here the process of an
    out-of-place upgrade, the in-place approach requires some more work and a
    short reboot is acceptable in the network as other machines are still
    running and can route traffic over their VLANs.
    
The essence of the machine upgrade is the `do-release-upgrade` which
interactively starts the upgrading process

## Create Your Own Custom Testbed Configuration

!!! important "TODO"
