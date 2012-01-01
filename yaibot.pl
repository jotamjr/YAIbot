#!/usr/bin/perl

use warnings;
use strict;

use Getopt::Long;
use Pod::Usage;
use Bot::BasicBot::Pluggable::WithConfig;

my $config;
Getopt::Long::GetOptions( '--config=s' => \$config,) || pod2usage(2);
Bot::BasicBot::Pluggable::WithConfig->new_with_config( config => $config )->run;

__END__

=head1 SYNOPSIS

    $ yaibot.pl --config /etc/bot.yaml

    Options:
        --config    yaml configuration
