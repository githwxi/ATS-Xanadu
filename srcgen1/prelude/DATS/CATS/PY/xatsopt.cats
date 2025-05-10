##################################################################.
##################################################################.
##
## HX-2025-04-29:
## PY code for xatsopt
## Tue Apr 29 09:32:47 PM EDT 2025
##
##################################################################.
##################################################################.
##
def XATSOPT_argv_get():
  return sys.argv ## endof(argv_get)
##
##################################################################.
##
def XATSOPT_XATSHOME_get():
  xhm = os.environ['XATSHOME']
  return ("" if xhm is None else xhm)
##
##################################################################.
def XATSOPT_fpath_rexists(fpx):
  return os.path.isfile(fpx) ## end(fpath_rexists)
##################################################################.
def XATSOPT_fpath_full_read(fpx):
  try:
    filr = open(fpx, "r")
    text = filr.read() ## read all
    filr.close() ## leak if not done
    return text ## for a "small" file
  except Exception as e:
    return None ## nothing in case of errors
##################################################################.
##
def \
XATSOPT_strn_append_uint(name, stmp):
  return (name+str(stmp)) ## end(strn_append_uint)
##
##################################################################.
def \
XATSOPT_strn_dflt_parse(rep):
  try:
    return float(rep)
  except ValueError as e:
    return 0.0 ## default in case of errors
def \
XATSOPT_strn_dflt_parse_exn(rep): return float(rep)
##################################################################.
## end-of-[ATS3/XANADU_srcgen1_prelude_DATS_CATS_PY_xatsopt.cats]
##################################################################.
##################################################################.
