use Test::More tests => 3;

use lib 't';

BEGIN { use_ok('App::Env') };

#############################################################

# import alias.  Site1 App3 is an alias for Site1 App2
App::Env::import( 'App3' );
is( $ENV{Site1_App1}, 1, "import alias" );

# now import it directly. have to use Force to increment
# the internal counter or it'll be impossible to distinguish
# between a first time import or a cache
App::Env::import( 'App1', { Force => 1 } );
is( $ENV{Site1_App1}, 2, "import original" );
