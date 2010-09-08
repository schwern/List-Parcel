#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

use List::Parcel;


# Simple usage
{
    my $parcel = parcel 42;
    ok $parcel,         "boolean true";
    is $parcel, 42;
    is $parcel->[0], 42;
    is @$parcel, 1;
}


# Wrong number of items
{
    ok !eval { parcel 23, 42 };
    like $@, qr/^Parcels can only contain one element/;
}


# parcel with a false element
{
    my $parcel = parcel 0;
    is $parcel, 0;
    ok !$parcel,        "boolean false";
}


# Copy
{
    my $parcel = parcel 99;
    my $copy = $parcel;
    is $copy->[0], 99;
    is $copy, 99;
}


# Parcel size increased
{
    my $parcel = parcel 23;
    push @$parcel, 42;
    is_deeply [@$parcel], [23, 42];
    ok !eval { my $foo = $parcel . ''; 1 };
    like $@, qr/^This Parcel contains more than one element/;
}


done_testing;
