package Bot::BasicBot::Pluggable::Module::Buscar;

use warnings;
use strict;
use parent 'Bot::BasicBot::Pluggable::Module';
use Google::Search;
our $VERSION = '0.01';

sub said {
    my ($self, $mess, $pri) = @_;
    my $body = $mess->{body};
    my $who = $mess->{who};

    return unless ($pri == 2);

    my ($command, $param) = split(/\s+/, $body, 2);
    $command = lc($command);

    # do something here
    return unless ($command =~ m/^buscar/);

    my $search = Google::Search->Web(q => $param);
    my $result = $search->first;
    if ($result){
        $result = $result->uri;
    } else {
        if($search) {
            my $error = $search->error;
            if($error) {
                print $error->reason;#debug
                print $error->http_response->as_string;#debug
                print "debug: google function error\n";#debug
                return "arrg ha ocurrido un error ¬¬";
            } else {
                return "es el fin de los tiempos google no encuentra eso, O.o!";
            }
        }
    }
    return $result;
}

sub help {
    return "Commands: 'buscar <frase>";
}

1;

=head1 NAME

Bot::BasicBot::Pluggable::Module::Buscar - google search interface

=head1 SYNOPSIS

Search in google for any phrase; just returns the first result.

=head1 IRC USAGE

        [buscar] <entry>

=head1 AUTHOR

Jotam Jr. Trejo, <jotamjr@gmail.com>

=head1 COPYRIGHT

Copyright 2014, Jotam Jr. Trejo

Distributed under the same terms as Perl itself.

=cut
