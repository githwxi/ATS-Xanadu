########################################################################.
##                                                                    ##.
##                         Applied Type System                        ##.
##                                                                    ##.
########################################################################.

##
## ATS/Xanadu - Unleashing the Potential of Types!
## Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
## All rights reserved
##
## ATS is free software;  you can  redistribute it and/or modify it under
## the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
## Free Software Foundation; either version 3, or (at  your  option)  any
## later version.
## 
## ATS is distributed in the hope that it will be useful, but WITHOUT ANY
## WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
## for more details.
## 
## You  should  have  received  a  copy of the GNU General Public License
## along  with  ATS;  see the  file COPYING.  If not, please write to the
## Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
## 02110-1301, USA.
##

########################################################################.
########################################################################.
##
## Author: Hongwei Xi
## Thu May  1 10:08:35 PM EDT 2025
## Authoremail: gmhwxiATgmailDOTcom
##
########################################################################.
########################################################################.
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
########################################################################.
##
## HX-2025-05-01:
##
def \
XATSPY_g_fprint(x0, out):
  out.write(str(x0)); return ## g_fprint
##
########################################################################.
##
def XATSPY_process_argv(): return sys.argv
##
########################################################################.
##
def \
XATSPY_sint_fprint(i0, out):
  print(i0, file = out); return ## sint_fprint
def \
XATSPY_bool_fprint(b0, out):
  print(b0, file = out); return ## bool_fprint
def \
XATSPY_dflt_fprint(f0, out):
  print(f0, file = out); return ## dflt_fprint
def \
XATSPY_strn_fprint(cs, out):
  print(cs, file = out); return ## strn_fprint
def \
XATSPY_char_fprint(c0, out):
  print(chr(c0), file = out); return ## char_fprint
##
########################################################################.
########################################################################.
## end of [ATS3/XANADU_xatslib_libcats_DATS_CATS_PY_gbas000.cats]
########################################################################.
########################################################################.
