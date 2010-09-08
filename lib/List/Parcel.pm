package List::Parcel;

use strict;
use warnings;

our $VERSION = '0.01_01';

use Carp;

our @EXPORT = qw(parcel);
use Exporter 'import';


=head1 NAME

List::Parcel - Works like a single element list or a scalar

=head1 SYNOPSIS

    use List::Parcel;

    my $parcel = parcel(42);

    print @$parcel;      # 1
    print $parcel->[0];  # 42
    print $parcel;       # 42

=head1 DESCRIPTION

A parcel is a data structure which acts as both an array reference of
a single element and a scalar.  This allows you to have functions
which usually return a single element but can return lists.

For example, let's say you wanted to write a C<< pop >> method for
your object.  That returns a single element.

    my $element  = $array->pop;     # pop one element

But wouldn't it be useful if you could pop more than one at a time?
That returns multiple elements.

    my $elements = $array->pop(3);  # pop three elements

How do you decide?  Return a parcel!  If its used like an array
reference, it works like an array reference.  If its used as a scalar,
and contains only one element, it works like a scalar!

If a parcel contains more than one element, and its used as a scalar,
it will throw an error.

=cut

use overload
    q[""] => sub {
        my $self = shift;
        croak "This Parcel contains more than one element" if @$self > 1;
        return $self->[0];
    },
    fallback => 1
;

sub parcel {
    croak "Parcels can only contain one element" if @_ > 1;
    croak "parcel() requires an element" unless @_;

    return bless [$_[0]], "List::Parcel"; 
}


=head1 COPYRIGHT

Copyright 2010 by Michael G Schwern E<lt>schwern@pobox.comE<gt>.

This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.

See F<http://www.perl.com/perl/misc/Artistic.html>


=head1 SEE ALSO

Perl 6 Parcels

=cut


1;
