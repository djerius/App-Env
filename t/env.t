use Test::More tests => 9;

use strict;
use warnings;

use Env::Path;

use lib 't';
use File::Temp;
use App::Env;

my $app1 = App::Env->new( 'App1' );

my ( $env, $output );

$env = $app1->env;

is( $env->{Site1_App1}, '1', 'env' );


sub test_exclude {
    my ( $exclude, $label ) = @_;

    my $env = $app1->env( {Exclude => $exclude} );

    ok( ! exists $env->{Site_App1}, $label );
}

# test exclusion
test_exclude( qr/Site1_.*/, 'env; exclude regexp' );
test_exclude( 'Site1_App1', 'env; exclude scalar' );
test_exclude( [ 'Site1_App1' ], 'env; exclude array' );

test_exclude( sub { my( $var, $val ) = @_;
		    return $var eq 'Site1_App1' ? 1 : 0 },
	      'env; exclude code' );

$env = $app1->env( { Include => qr/Site1_App1.*/ } );
is ( keys %$env, 2, 'include re: count' );

$env = $app1->env( { Include => 'Site1_App1' } );
is ( keys %$env, 1, 'include: count' );
ok( exists $env->{Site1_App1}, 'include: exists' );
is( $env->{Site1_App1}, '1', 'include: value' );
