use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
              'NAME'		=> 'pgtop',
              'VERSION_FROM'	=> 'pgtop', # finds $VERSION
              'EXE_FILES'		=> [ 'pgtop' ],
              'PREREQ_PM'		=> {
                                            Term::ReadKey => 2.10,
                                            DBI           => 1.16,
                                            DBD::Pg    => 1.22,
                                           },
              'LIBS'		=> [''], # e.g., '-lm'
              'DEFINE'		=> '', # e.g., '-DHAVE_SOMETHING'
              'INC'		=> '', # e.g., '-I/usr/include/other'
);
