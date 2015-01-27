use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  VERSION   => '0.04',
  PREREQ_PM => {
                'Mojolicious' => '5.69',
                'DBIx::Class' => '0',
                'Mojolicious::Plugin::AssetPack' => 0
                },
  test      => {TESTS => 't/*.t'}
);
