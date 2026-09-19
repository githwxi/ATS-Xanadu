########################################################################.
########################################################################.
##
## HX-2026-09-07:
## Mon Sep  7 02:57:41 PM EDT 2026
## ATS3-XANADU/srcgen2/xats2py/srcgen1
##
########################################################################.
########################################################################.
## use strict;
## use warning;
########################################################################.
use constant {
    TRUE  => 1,
    FALSE => 0,
};
########################################################################.
########################################################################.
##
our $XATSVOID = undef;
our $XATSTOP0 = undef;
##
########################################################################.
##
sub XATSCNUL { return 0; }
sub XATSCHR1 { return 0; }
##
sub XATSINT0 { return $_[0]; }
sub XATSINT1 { return $_[0]; }
##
sub XATSBTF0 { return $_[0]; }
sub XATSBOOL { return $_[0]; }
##
sub XATSCHR0 {
  return ord(substr($_[0], 0, 1));
}
sub XATSCHR2 {
  return ord(substr($_[0], 0, 1));
}
##
sub XATSCHR3 {
  my ($ch) = @_;
  my $c1 =
    ord(substr($ch, 1, 1));
  return $c1
    if (($c1<48) || ($c1>55));
  my $i1 = 2;
  my $ds = $c1 - 48;
  while ($i1 < length($ch)) {
    my $x1 = substr($ch, $i1, 1);
    return $ds if $x1 eq "'";
    $i1 += 1;
    $ds = 8 * $ds + ord($x1) - 48;
  }
  return $ds;
}
##
sub XATSFLT0 { return $_[0]; }
sub XATSFLT1 { return $_[0]; }
##
sub XATSSTR0 { return $_[0]; }
sub XATSSTRN { return $_[0]; }
##
sub XATSSFLT { return 0.0 + $_[0]; }
sub XATSDFLT { return 0.0 + $_[0]; }
##
########################################################################.
##
sub XATSDAPP { return $_[0]; }
sub XATSCAPP { return $_[1]; }
sub XATSCAST { return $_[1]->[0]; }
##
########################################################################.
##
sub XATSPFLT { return $_[0]; }
sub XATSPROJ { return $_[0]; }
sub XATSP0RJ { return $_[0]; }
sub XATSP1RJ { return $_[1]; }
sub XATSP1CN { return $_[1]; }
##
sub XATSPCON { return $_[0]->[$_[1] + 1]; }
##
########################################################################.
##
sub XATSTRCD { return $_[0]; }
##
sub XATSTUP0 { return $_[0]; }
sub XATSTUP1 { return $_[1]; }
sub XATSRCD2 { return $_[1]; }
##
########################################################################.
##
sub XATSROOT {
  return [0, $_[0]]; }
sub XATSLPFT {
  return [1+0, $_[1], $_[0]]; }
sub XATSLPBX {
  return [1+1, $_[1], $_[0]]; }
sub XATSLPCN {
  return [1+2, $_[1], $_[0] + 1]; }
##
sub XATSVAR0 { return XATSROOT([undef]); }
sub XATSVAR1 { return XATSROOT([$_[0]]); }
##
sub XATSADDR { return $_[0]; } # HX: no-op
sub XATSFLAT { return XATS000_lvget($_[0]); }
##
########################################################################.
##
sub XATSCTAG { return $_[1]; }
##
sub XATS000_inteq { return $_[0] == $_[1]; }
sub XATS000_btfeq { return $_[0] == $_[1]; }
sub XATS000_chreq { return $_[0] == $_[1]; }
sub XATS000_streq { return $_[0] eq $_[1]; }
sub XATS000_ctgeq { return $_[0]->[0] == $_[1]; }
##
########################################################################.
##
sub XATS2PL_optn_nil {
  return XATSCAPP('optn_nil', [0]); }
sub XATS2PL_optn_cons {
  return XATSCAPP('optn_cons', [1, $_[0]]); }
sub XATS2PL_list_nil {
  return XATSCAPP('list_nil', [0]); }
sub XATS2PL_list_cons {
  return XATSCAPP('list_cons', [1, $_[0], $_[1]]); }
##
sub XATS2PL_optn_vt_nil {
  return XATSCAPP('optn_vt_nil', [0]); }
sub XATS2PL_optn_vt_cons {
  return XATSCAPP('optn_vt_cons', [1, $_[0]]); }
sub XATS2PL_list_vt_nil {
  return XATSCAPP('list_vt_nil', [0]); }
sub XATS2PL_list_vt_cons {
  return XATSCAPP('list_vt_cons', [1, $_[0], $_[1]]); }
##
########################################################################.
##
sub XATS000_casef {
  die "XATS000_casef\n"; }
sub XATS000_patck {
  die "XATS000_patck\n" unless $_[0]; return; }
##
########################################################################.
##
sub XATS000_fold { return; }
sub XATS000_free { return; }
##
########################################################################.
##
sub XATS000_dp2tr
{
  return XATS000_lvget($_[0]);
}
##
sub XATS000_l0azy
{
  return [0, $_[0]]; # unevaluated
}
sub XATS000_dl0az {
  my ($l0az) = @_;
  if ($l0az->[0] > 0) {
    $l0az->[0] += 1;
    return $l0az->[1];
  }
  $l0az->[0] = 1;
  my $res = $l0az->[1]->();
  $l0az->[1] = $res; return $res;
}
##
sub XATS000_l1azy { return $_[0]; }
sub XATS000_dl1az { return $_[0]->(1); }
##
sub XATS000_assgn { return XATS000_lvset(@_); }
##
########################################################################.
##
sub XATS000_lvget {
  my ($lval) = @_;
  my $ctag = $lval->[0];
  return $lval->[1]->[0] if $ctag == 0;
  return
    XATS000_lvget($lval->[1])->[$lval->[2]] if $ctag == 1+0;
  return $lval->[1]->[$lval->[2]] if $ctag == 1+1 || $ctag == 1+2;
  return;
}
##
sub XATS000_lvset {
  my
  ($lval, $rval) = @_;
  my $ctag = $lval->[0];
  if ($ctag == 0) {
    $lval->[1]->[0] = $rval;
    return;
  }
  if ($ctag == 1+0) {
    return XATS000_lvset($lval->[1],
      XATS000_ftset(XATS000_lvget($lval->[1]), $lval->[2], $rval));
  }
  if ($ctag == 1+1) {
    $lval->[1]->[$lval->[2]] = $rval;
    return;
  }
  if ($ctag == 1+2) {
    $lval->[1]->[$lval->[2]] = $rval;
    return;
  }
  return;
}
##
sub XATS000_ftset {
  my
  ( $tpl0
  , $idx1
  , $rval) = @_;
  ## HX: shallow copy!
  my $tpl1 = [@$tpl0]; 
  $tpl1->[$idx1] = $rval; return $tpl1;
}
##
########################################################################.
##
## HX-2026-09-07:
## Mon Sep  7 03:10:47 PM EDT 2026
## A blessed exception retains
## the constructor for handlers using $@.
##
{
  package X2PLExcptn;
  sub new {
    my ($class, $xcon) = @_;
    return bless {args => [$xcon]}, $class;
  }
}
##
sub XATS000_raise { die X2PLExcptn->new($_[0]); }
##
########################################################################.
########################################################################.
##
## the end of
## [ATS3-XANADU/srcgen2/xats2pl/srcgen1/xshared/runtime/xats2pl_pl1emit.pl]
##
########################################################################.
########################################################################.
