# GTS GÉANT

In the GÉANT the deployment has moved to bare metal servers therefore this
deployment is now different than DFN. This tutorial will take you through the
steps to create bare metal servers in GTS GÉANT and configure them to run a
basic OS.

!!! tldr "TL;DR"
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
admins, for now the topology simply needs to include all BMS and the OS you would like to use.

In our case the machines were connected by 3 vlans creating a full-mesh between them:

 x  | ams | ham | par
:--:|:---:|:---:|:---:
ams |  -  |  20 | 30
ham |  20 |  -  | 10
par |  30 |  10 | - 

Table showing the current VLANs between the BMS in Amsterdam, Hamburg, and Paris

### Setting up the disks

A full introduction for the BMS available is online at the [GTS Wiki](https://wiki.geant.org/display/gn43wp7/GTS+User+Guide+v7.0%2C+rev.01#GTSUserGuidev7.0,rev.01-BareMetalServer(BMS))

!!! hint "Account Requirement"
    The GTS Wiki requires you to sign into an acount to be able to access it,
    you can do that either with your institution account or public accounts such
    as bitbucket or google.

## Configure GTS Machines

!!! important "TODO"

## Updating a GTS Machine

!!! important "TODO"
