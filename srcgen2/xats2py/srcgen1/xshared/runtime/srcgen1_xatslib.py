## Sun May  4 06:06:37 PM EDT 2025
##################################################################
##
## Basics for XATS2PY
##
##################################################################
##
def \
XATSPY_g_stdin():
  return sys.stdin ## g_stdin
##
def \
XATSPY_g_stdout():
  return sys.stdout ## g_stdout
def \
XATSPY_g_stderr():
  return sys.stderr ## g_stderr
##
##################################################################
##
## HX-2025-05-01:
##
def \
XATSPY_g_fprint(x0, out):
  out.write(str(x0)); return ## g_fprint
##
##################################################################
##
def \
XATSPY_sint_fprint(i0, out):
  print(i0, file=out, end=''); return ## sint_fprint
def \
XATSPY_bool_fprint(b0, out):
  print(b0, file=out, end=''); return ## bool_fprint
def \
XATSPY_char_fprint(c0, out):
  ch = chr(c0)
  print(ch, file=out, end=''); return ## char_fprint
def \
XATSPY_dflt_fprint(f0, out):
  print(f0, file=out, end=''); return ## dflt_fprint
def \
XATSPY_strn_fprint(cs, out):
  print(cs, file=out, end=''); return ## strn_fprint
##
def \
XATSPY_gint_fprint_sint(i0, out):
  print(i0, file=out, end=''); return ## sint_fprint
def \
XATSPY_gint_fprint_uint(u0, out):
  print(u0, file=out, end=''); return ## uint_fprint
##
def \
XATSPY_gint_fprint_sflt(f0, out):
  print(f0, file=out, end=''); return ## sflt_fprint
def \
XATSPY_gint_fprint_dflt(f0, out):
  print(f0, file=out, end=''); return ## dflt_fprint
##
########################################################################.
########################################################################.
##end of [ATS3/XANADU_srcgen1_xatslib_libcats_DATS_CATS_PY_libcats.cats]
########################################################################.
########################################################################.
