package Amon2::Plugin::ConfigLoader;
# EXPERIMENTAL
use strict;
use warnings;
use Amon2::Util;
use File::Spec;
use Cwd ();

sub init {
    my ($class, $c, $conf) = @_;

    my $env = $ENV{PLACK_ENV} || 'development';
    my $fname = File::Spec->catfile($c->base_dir, 'config', "${env}.pl");
    my $config = do $fname or die "Cannot load configuration file: $fname";
    add_method($c, 'config', sub { $config });
}

1;
__END__

=head1 NAME

Amon2::ConfigLoader - configuration file loader for Amon2

=head1 DESCRIPTION

This is configuration file loader for Amon2.

