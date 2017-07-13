#!/usr/bin/perl
#===============================================================================
#        USAGE:  qman.pl <command> [<parameters>]
#  DESCRIPTION:  Queue management from command line for PearlPBX
#       AUTHOR:  Alex Radetsky <rad@pearlpbx.com>
#      COMPANY:  PearlPBX
#      CREATED:  2017-07-13
#===============================================================================

use strict;
use warnings;

QMan->run (
	daemon      => undef,
    verbose     => 1,
    use_pidfile => 1,
    has_conf    => 1,
    conf_file   => "/etc/PearlPBX/asterisk-router.conf",
    infinite    => undef
);

1;

package QMan;

use strict;
use warnings;

use base qw(PearlPBX::App);
use Getopt::Long qw(:config auto_version auto_help pass_through);
use PearlPBX::CRUD::Queue;

sub start {
	my $self = shift;
	my $cmd; GetOptions ( 'cmd' => \$cmd ); $self->{'cmd'} = $cmd;
    my $name; GetOptions ('name' => \$name); $self->{'name'} = $name;
}

sub process {
    my $self = shift;
    if (( $cmd ne 'show' ) && ( $cmd ne 'update' )) {
        print("Use --cmd=<show|update>\n");
        return;
    }

}