##############################################################################
# Copyright © 2009 Six Apart Ltd.
# This program is free software: you can redistribute it and/or modify it
# under the terms of version 2 of the GNU General Public License as published
# by the Free Software Foundation, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details.  You should have received a copy of the GNU
# General Public License version 2 along with this program. If not, see
# <http://www.gnu.org/licenses/>.

package Tidings::Util;

sub tidyfilter {
    my ( $str, $val, $ctx ) = @_;
    eval { require HTML::Tidy; };
    if ($@) {
        return $str;
    }
    my ( $type, $whole_page );
    if ( ref($val) eq 'ARRAY' ) {
        $type         = $val->[0];
        $addl_options = $val->[1];
    }
    else {
        $type = $val;
    }
    my $params;
    $params->{show_warnings} = 0;
    $params->{show_body_only} = 1;
    if ( $addl_options ) {
        my @options = split(/;/, $addl_options);
        foreach my $option ( @options ) {
            my @results = split(/:/, $option);
            next unless ( scalar @results == 2 );
            my $key = $results[0];
            my $val = $results[1];
            $key =~ s|\s*(.*)\s*|$1|;
            $val =~ s|\s*(.*)\s*|$1|;
            $params->{$key} = $val;
        }
    }
    if ( $type eq 'html' ) {
        $params->{output_html} = 1;
    }
    elsif ( $type eq 'xml' ) {
        $params->{output_xml} = 1;
    }
    else {
        $params->{output_xhtml} = 1;
    }
    my $tidy = HTML::Tidy->new($params);
    return $tidy->clean($str);
}

1;
