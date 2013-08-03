package Euler::Vector2D;

=head1 NAME
Euler::Vector2D - Module to handle 2D Vector Mathematics
=cut

sub new { 
        my ($class_name, $x, $y) = @_;

        my $vector = {
            x => $x,
            y => $y
        };

        bless($vector, $class_name);
        return $vector;
}

sub x {
        my ($v) = @_;   
        return $v->{x};
}

sub y {
        my ($v) = @_;   
        return $v->{y};
}

sub clone {
    my $v = shift;
    my $c = $v->new( $v->x, $v->y );
    return $c;
}


sub stringify {   # convert a vector to a string (with optional format)
    my $v = shift;
    return "[ " . $v->x() . ", " . $v->y() . " ]";
}

sub length {   # convert a vector to a string
    my $v = shift;
    return sqrt( $v.$v );
}

sub norm {   # scale vector to a length of one
    my $v = shift;
    return $v / $v->length;
}

use overload
     'neg' => \&_negate,
      '""' => \&_stringify,
       '+' => \&_addition,
       '-' => \&_subtract,
       '*' => \&_multiply,
       '/' => \&_scalar_divide,
       'x' => \&_cross_product, # Redefination of the string function
       '|' => \&_distance, # Redefination of the string function
       '.' => \&_dot_product,   # These includes stingify/concatanation
'fallback' => undef;


sub _trace {
    return unless $TRACE;
    my($text,$object,$argument,$flip) = @_;
    unless (defined $object)   { $object   = 'undef'; };
    unless (defined $argument) { $argument = 'undef'; };
    unless (defined $flip)     { $flip     = 'undef'; };
    if (ref($object))   { $object   = ref($object);   }
    if (ref($argument)) { $argument = ref($argument); }
    $argument =~ s/\n/\\n/g;
    print "$text: \$obj='$object' \$arg='$argument' \$flip='$flip'\n";
}


sub _negate {
    my($object,$argument,$flip) = @_;
    _trace("'neg'",$object,$argument,$flip);
    return new($object->x * -1, $object->y * -1);
}

sub _stringify {
    my($object,$argument,$flip) = @_;
    _trace("'\"\"'",$object,$argument,$flip);
    return $object->stringify;
}

sub _distance {
    my($object,$argument,$flip) = @_;
    
    if ( (defined $argument) && ref($argument) &&
       (ref($argument) !~ /^SCALAR$|^ARRAY$|^HASH$|^CODE$|^REF$/) ) {
        my $d1 = $object->x - $argument->x;
        my $d2 = $object->y - $argument->y;
        return sqrt($d1*$d1+$d2*$d2);
    }
    croak("non-vector argument for 'd'");
}

sub _addition {
    # Operation on two vectors, as such $flip will be undefined or false
    # The operation is also communitive - order does not matter.
    my($object,$argument,$flip) = @_;
    _trace("'+'",$object,$argument,$flip);
    if ( (defined $argument) && ref($argument) &&
       (ref($argument) !~ /^SCALAR$|^ARRAY$|^HASH$|^CODE$|^REF$/) ) {
        return new($object->x + $argument->x, $object->y + $argument->y);
    }
    croak("non-vector argument for '+'");
}


sub _subtract {
  my($object,$argument,$flip) = @_;
  _trace("'-'",$object,$argument,$flip);
  # Operation on two vectors, as such $flip will be undefined or false
  # Note; however this is not communitive - order matters
  if ( (defined $argument) && ref($argument) &&
       (ref($argument) !~ /^SCALAR$|^ARRAY$|^HASH$|^CODE$|^REF$/) ) {
        return new($object->x - $argument->x, $object->y - $argument->y);
  }
  croak("non-vector argument for '-'");
}


sub _multiply {
    die("not implemented");
  my($object,$argument,$flip) = @_;
  _trace("'*'",$object,$argument,$flip);
  if ( ref($argument) ) {
    # Assume multiply by  Math::MatrixReal object  EG:  $v * $M --> $new_v
    # Order is communicative, but $flip should NOT be true
    if ( ! $flip ) {
      return ( $object->vector2matrix_row($argument)
                        * $argument )->matrix_row2vector;
    } else { # just in case flip is true..
      return ( $argument *
                $object->vector2matrix_row($argument) )->matrix_row2vector;
    }
  }
  elsif ( defined $argument ) {
    # defined $argument must be a scalar, so Scalar Multiply
    # Communitive - order does not matter, $flip can be ignored
    my $v = $object->clone;
    for ( 0 .. 2 ) { $v->[0][0][$_] *= $argument; }
    $v->[6] *= abs($argument) if defined $v->[6]; # multiply vector length
    return $v;
  }
  croak("undefined argument given for vector multiply");
}


sub _scalar_divide {
  my($object,$argument,$flip) = @_;
  _trace("'/'",$object,$argument,$flip);
  # The order is very important, you can NOT divide a scalar by a vector
  croak("You can not divide a scalar by a vector") if $flip;
  # The provided $argument must be a defined scalar
  if ( (defined $argument) && ! ref($argument)  ) {
    my $v = $object->clone;
    for ( 0 .. 2 ) { $v->[0][0][$_] /= $argument; }
    $v->[6] /= abs($argument) if defined $v->[6]; # do vector length
    return $v;
  }
  croak("non-scalar given for vector scalar divide");
}


sub _cross_product {
  my($object,$argument,$flip) = @_;
  # Operation on two vectors, as such $flip will be undefined or false
  # Note: however this is not communitive - order does matters
  _trace("'x'",$object,$argument,$flip);
  if ( (defined $argument) && ref($argument) &&
       (ref($argument) !~ /^SCALAR$|^ARRAY$|^HASH$|^CODE$|^REF$/) ) {
    return ($object->x * $argument->y) - ($object->y * $argument->x);
  }
  croak("string 'x' with a vector does not make sense!");
}


sub _dot_product {
  my($object,$argument,$flip) = @_;
  if ( (defined $argument) && ref($argument) &&
       (ref($argument) !~ /^SCALAR$|^ARRAY$|^HASH$|^CODE$|^REF$/) ) {
    # Operation on two vectors, and communitive - order does not matter
    return ($object->x * $argument->x) + ($object->y * $argument->y);
  }
  return $object->stringify . $argument;
}

sub croak {
    die @_[0];
}

1;
# ------------------------------------------------------------------

