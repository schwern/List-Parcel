#!/usr/bin/perl -w

use 5.008001;

use strict;
use Module::Build;

my $builder = Module::Build->new(
    module_name => 'List::Parcel',
    license     => 'perl',

    meta_merge  => {
        resources => {
            bugtracker =>
              'http://rt.cpan.org/Public/Dist/Display.html?Name=List-Parcel',
            repository =>
              'http://github.com/schwern/List-Parcel/tree/master',
        },

        configure_requires => {
            'Module::Build'     => 0.2808
        },
    },

    build_requires      => {
        'Test::More'        => 0.88,
    },
);

$builder->create_build_script();
