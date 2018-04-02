package App::Env::Null;

# ABSTRACT: return a snapshot of the current environment

use strict;
use warnings;

our $VERSION = '0.33';

=pod

=begin making_pod_coverage_shut_up

=item envs

=end making_pod_coverage_shut_up

=cut

sub envs { return \%ENV }

1;

# COPYRIGHT

__END__

=head1 SYNOPSIS

  use App::Env;

  my $env = App::Env->new( 'null', { Cache => 0 } );

=head1 DESCRIPTION

This module returns a snapshot of the current environment.  It must
not be used directly; see B<App::ENV>.  No B<AppOpts> options are
recognized.
