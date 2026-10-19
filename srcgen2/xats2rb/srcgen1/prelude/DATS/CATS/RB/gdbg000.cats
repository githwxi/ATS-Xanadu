########################################################################
def XATS2RB_bool_assert_errmsg(cond, msg)
  raise "XATS2RB_bool_assert_errmsg: emsg = #{msg}" unless cond
  nil
end
$XATS2RB_bool_assert_errmsg = method(:XATS2RB_bool_assert_errmsg)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/gdbg000.cats]
########################################################################.
########################################################################.
