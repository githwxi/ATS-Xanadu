########################################################################
def XATS2RB_list_vt_foritm0_f1un(xs, work)
  until XATS2RB_list_vt_nilq1(xs)
    work.call(XATS2RB_list_vt_head_raw1(xs))
    xs = XATS2RB_list_vt_tail_raw0(xs)
  end
  nil
end
def XATS2RB_list_vt_forall0_f1un(xs, test, free)
  until XATS2RB_list_vt_nilq1(xs)
    x = XATS2RB_list_vt_head_raw1(xs)
    xs = XATS2RB_list_vt_tail_raw0(xs)
    unless test.call(x)
      XATS2RB_list_vt_foritm0_f1un(xs, free)
      return false
    end
  end
  true
end
$XATS2RB_list_vt_foritm0_f1un = method(:XATS2RB_list_vt_foritm0_f1un)
$XATS2RB_list_vt_forall0_f1un = method(:XATS2RB_list_vt_forall0_f1un)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/list000.cats]
########################################################################.
########################################################################.
