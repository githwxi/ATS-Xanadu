########################################################################
def XATS2RB_strx_vt_forall0_f1un(fxs, test)
  loop do
    cxs = XATS2RB_lazy_vt_eval(fxs)
    x = XATS2RB_strxcon_vt_head_raw1(cxs)
    fxs = XATS2RB_strxcon_vt_tail_raw0(cxs)
    unless test.call(x)
      XATS2RB_lazy_vt_free(fxs)
      return false
    end
  end
end
def XATS2RB_strx_vt_filter0_f1un(fxs, test, free)
  XATS2RB_lazy_vt_make_f0un(-> { XATS2RB_strxcon_vt_filter0_f1un(XATS2RB_lazy_vt_eval(fxs), test, free) })
end
def XATS2RB_strxcon_vt_filter0_f1un(cxs, test, free)
  loop do
    x = XATS2RB_strxcon_vt_head_raw1(cxs)
    fxs = XATS2RB_strxcon_vt_tail_raw0(cxs)
    return XATS2RB_strxcon_vt_cons(x, XATS2RB_strx_vt_filter0_f1un(fxs, test, free)) if test.call(x)
    free.call(x)
    cxs = XATS2RB_lazy_vt_eval(fxs)
  end
end
$XATS2RB_strx_vt_forall0_f1un = method(:XATS2RB_strx_vt_forall0_f1un)
$XATS2RB_strx_vt_filter0_f1un = method(:XATS2RB_strx_vt_filter0_f1un)
$XATS2RB_strxcon_vt_filter0_f1un = method(:XATS2RB_strxcon_vt_filter0_f1un)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/strx000.cats]
########################################################################.
########################################################################.
