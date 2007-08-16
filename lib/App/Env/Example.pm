package App::Env::Example;


# This example uses Shell::GetEnv to illustrate how to source a shell
# script which defines the environment for an application.  Other
# similar modules are Shell::Source and Shell::EnvImporter.

use Shell:GetEnv;


sub envs
{
    my ( $opt ) = @_;

    # source the shell script and return the changed environment
    return Shell::GetEnv->new( 'tcsh',
			       'source /usr/local/mypkg/setup.csh'
			     )->envs;
}

1;

__END__

=head1 NAME

App::Env::Example - example application environment module for App::Env.

=head1 DESCRIPTION

Modules used by B<App::Env> to load application environments are named

  App::Env::<application>

or, if there is a site specific version:

  App::Env::<SITE>::<application>

They should define the following functions:

=over

=item envs

  $hashref = envs( \%opts );

C<$hashref> is a hash containing environmental variables and
their values.  C<%opts> has the following keys:

=over

=item Version

The application version.  The meaning of this is application specific.
A value of B<undef> means that no version was specified.

=item AppOpts

This is a hashref containing application specific options.

=back

=back


See the source of this module for a simple example.
