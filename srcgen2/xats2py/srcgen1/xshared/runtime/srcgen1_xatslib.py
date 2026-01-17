## Sat Jan 17 03:05:05 PM EST 2026
##################################################################
##
## Basics for XATS2PY
##
##################################################################
##
def \
XATS2PY_g_stdin():
  return sys.stdin ## g_stdin
##
def \
XATS2PY_g_stdout():
  return sys.stdout ## g_stdout
def \
XATS2PY_g_stderr():
  return sys.stderr ## g_stderr
##
##################################################################
##
## HX-2025-05-01:
##
def \
XATS2PY_g_fprint(x0, out):
  out.write(str(x0)); return ## g_fprint
##
##################################################################
##
def \
XATS2PY_sint_fprint(i0, out):
  print(i0, file=out, end=''); return ## sint_fprint
def \
XATS2PY_bool_fprint(b0, out):
  print(b0, file=out, end=''); return ## bool_fprint
def \
XATS2PY_char_fprint(c0, out):
  ch = chr(c0)
  print(ch, file=out, end=''); return ## char_fprint
def \
XATS2PY_dflt_fprint(f0, out):
  print(f0, file=out, end=''); return ## dflt_fprint
def \
XATS2PY_strn_fprint(cs, out):
  print(cs, file=out, end=''); return ## strn_fprint
##
def \
XATS2PY_gint_fprint_sint(i0, out):
  print(i0, file=out, end=''); return ## sint_fprint
def \
XATS2PY_gint_fprint_uint(u0, out):
  print(u0, file=out, end=''); return ## uint_fprint
##
def \
XATS2PY_gint_fprint_sflt(f0, out):
  print(f0, file=out, end=''); return ## sflt_fprint
def \
XATS2PY_gint_fprint_dflt(f0, out):
  print(f0, file=out, end=''); return ## dflt_fprint
##
########################################################################.
########################################################################.
##end of [ATS3/XANADU_srcgen1_xatslib_libcats_DATS_CATS_PY_libcats.cats]
########################################################################.
########################################################################.
