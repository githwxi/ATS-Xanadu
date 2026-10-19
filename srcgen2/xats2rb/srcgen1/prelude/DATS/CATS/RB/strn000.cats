########################################################################
def XATS2RB_strn_cmp(a, b); a <=> b; end
def XATS2RB_strn_print(s); print(s); nil; end
def XATS2RB_strn_length(s); s.length; end
def XATS2RB_strn_get_at_raw(s, i); s[i].ord; end
def XATS2RB_strn_make_fwork(work)
  out = +''
  work.call(->(code) { out << code.chr(Encoding::UTF_8) })
  out
end
def XATS2RB_strn_make_env_fwork(env, work)
  out = +''
  work.call(env, ->(code) { out << code.chr(Encoding::UTF_8) })
  out
end
def XATS2RB_strn_make1_env_fwork(env, work); XATS2RB_strn_make_env_fwork(env, work); end
$XATS2RB_strn_cmp = method(:XATS2RB_strn_cmp)
$XATS2RB_strn_print = method(:XATS2RB_strn_print)
$XATS000_strn_print = method(:XATS2RB_strn_print)
$XATS2RB_strn_length = method(:XATS2RB_strn_length)
$XATS000_strn_length = method(:XATS2RB_strn_length)
$XATS2RB_strn_get_at_raw = method(:XATS2RB_strn_get_at_raw)
$XATS000_strn_get_at_raw = method(:XATS2RB_strn_get_at_raw)
$XATS2RB_strn_make_fwork = method(:XATS2RB_strn_make_fwork)
$XATS000_strn_make_fwork = method(:XATS2RB_strn_make_fwork)
$XATS2RB_strn_make_env_fwork = method(:XATS2RB_strn_make_env_fwork)
$XATS000_strn_make_env_fwork = method(:XATS2RB_strn_make_env_fwork)
$XATS2RB_strn_make1_env_fwork = method(:XATS2RB_strn_make1_env_fwork)
$XATS000_strn_make1_env_fwork = method(:XATS2RB_strn_make1_env_fwork)
########################################################################
########################################################################.
## end of
## [ATS3-XANADU
## /srcgen2/xats2rb/srcgen1/prelude/DATS/CATS/RB/strn000.cats]
########################################################################.
########################################################################.
