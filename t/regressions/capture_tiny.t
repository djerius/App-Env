#! perl

use Test::More;

use Capture::Tiny;

eval  "use App::Env;";

is ( $@, '', "succeeds" )
  or note $@;

done_testing;
