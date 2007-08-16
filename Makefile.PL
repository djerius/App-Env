use ExtUtils::MakeMaker;

my $EUMM_VERSION = eval $ExtUtils::MakeMaker::VERSION;


# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'App::Env',
    VERSION_FROM      => 'lib/App/Env.pm', # finds $VERSION
    PREREQ_PM         => {
			  Module::Load => 0,
			  Scalar::Util => 0,
			  Params::Validate => 0,
			  Module::Load::Conditional => 0,
			  Test::More => 0,
			  Env::Path => 0,
			  File::Temp => 0
			 }, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/App/Env.pm', # retrieve abstract from module
       AUTHOR         => 'Diab Jerius <djerius@cpan.org>') : ()),
    ( $EUMM_VERSION >= 6.31 ? (
        LICENSE         => 'gpl',
    ) : ()),
);
