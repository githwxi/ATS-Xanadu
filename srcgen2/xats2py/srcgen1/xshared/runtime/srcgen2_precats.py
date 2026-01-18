## Sat Jan 17 06:08:15 PM EST 2026
########################################################################
########################################################################
##
## the beg of
## [ATS3-XANADU
## /srcgen2/xats2py/srcgen1/xshared/runtime/srcgen2_precats.py]
##
########################################################################
########################################################################
## Sat Jan 17 06:06:11 PM EST 2026
## LCSRCsome1(precats.dats)@(1291(line=30,offs=1)--1332(line=31,offs=28))
## I1Di0dcl(I0Dd3ecl(D3Cstaload(0;T_SRP_STALOAD();G1Ea2pp(G1Eid0(=);G1Eid0(UN);G1Estr(T_STRN1_clsd("prelude/SATS/unsfx00.sats";27)));$optn(FPATH(/home/hwxi/Research/ATS-Xanadu/prelude/SATS/unsfx00.sats));...)))
## I1Dextern(LCSRCsome1(precats.dats)@(1978(line=81,offs=1)--2048(line=86,offs=29)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_optn_nilq(2293));$list(I1FUNDCL(XATS2PY_optn_nilq(2);$list(FJARGdarg($list(I1BNDcons(I1TNM(1);I0Pvar(xs(3));$list(@(xs(3),I1Vtnm(I1TNM(1))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_optn_nilq);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(2049(line=87,offs=1)--2138(line=91,offs=43)))
def XATS2PY_optn_nilq(arg1): ## impl
  pyxtnm2 = arg1
  ## I1CMP:start
  pyxtnm5 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(3);I0Pdapp(I0Pcon(optn_nil(4));$list());$list()))
    if (XATS000_ctgeq(pyxtnm2, XATSCTAG("optn_nil",0))): ## { // gpt
      pyxtnm3 = pyxtnm2
      pyxtnm5 = XATSBOOL(True)
      break ## cls
    ## } // gpt
    ## } // cls
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(4);I0Pdap1(I0Pcon(optn_cons(5)));$list()))
    if (XATS000_ctgeq(pyxtnm2, XATSCTAG("optn_cons",1))): ## { // gpt
      pyxtnm4 = pyxtnm2
      pyxtnm5 = XATSBOOL(False)
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm5
  return pyxtnm5
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(2142(line=93,offs=1)--2213(line=98,offs=29)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_optn_consq(2294));$list(I1FUNDCL(XATS2PY_optn_consq(5);$list(FJARGdarg($list(I1BNDcons(I1TNM(6);I0Pvar(xs(6));$list(@(xs(6),I1Vtnm(I1TNM(6))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_optn_consq);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(2214(line=99,offs=1)--2306(line=103,offs=45)))
def XATS2PY_optn_consq(arg1): ## impl
  pyxtnm7 = arg1
  ## I1CMP:start
  pyxtnm10 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(8);I0Pdapp(I0Pcon(optn_nil(4));$list());$list()))
    if (XATS000_ctgeq(pyxtnm7, XATSCTAG("optn_nil",0))): ## { // gpt
      pyxtnm8 = pyxtnm7
      pyxtnm10 = XATSBOOL(False)
      break ## cls
    ## } // gpt
    ## } // cls
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(9);I0Pdap1(I0Pcon(optn_cons(5)));$list()))
    if (XATS000_ctgeq(pyxtnm7, XATSCTAG("optn_cons",1))): ## { // gpt
      pyxtnm9 = pyxtnm7
      pyxtnm10 = XATSBOOL(True)
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm10
  return pyxtnm10
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(2333(line=107,offs=1)--2406(line=112,offs=28)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_optn_head$raw(2295));$list(I1FUNDCL(XATS2PY_optn_head$raw(8);$list(FJARGdarg($list(I1BNDcons(I1TNM(11);I0Pvar(xs(9));$list(@(xs(9),I1Vtnm(I1TNM(11))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_optn_head$raw);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(2407(line=113,offs=1)--2480(line=116,offs=35)))
def XATS2PY_optn_head_raw(arg1): ## impl
  pyxtnm12 = arg1
  ## I1CMP:start
  pyxtnm14 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(13);I0Pdapp(I0Pcon(optn_cons(5));$list(I0Pvar(x0(11))));$list(@(x0(11),I1Vp1cn(I0Pcon(optn_cons(5));I1Vtnm(I1TNM(13));0)))))
    if (XATS000_ctgeq(pyxtnm12, XATSCTAG("optn_cons",1))): ## { // gpt
      pyxtnm13 = pyxtnm12
      pyxtnm14 = XATSP1CN("optn_cons", pyxtnm13[0+1])
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm14
  return pyxtnm14
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(2484(line=118,offs=1)--2559(line=123,offs=28)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_optn_uncons$raw(2296));$list(I1FUNDCL(XATS2PY_optn_uncons$raw(12);$list(FJARGdarg($list(I1BNDcons(I1TNM(15);I0Pvar(xs(13));$list(@(xs(13),I1Vtnm(I1TNM(15))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_optn_uncons$raw);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(2560(line=124,offs=1)--2635(line=127,offs=35)))
def XATS2PY_optn_uncons_raw(arg1): ## impl
  pyxtnm16 = arg1
  ## I1CMP:start
  pyxtnm18 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(17);I0Pdapp(I0Pcon(optn_cons(5));$list(I0Pvar(x0(15))));$list(@(x0(15),I1Vp1cn(I0Pcon(optn_cons(5));I1Vtnm(I1TNM(17));0)))))
    if (XATS000_ctgeq(pyxtnm16, XATSCTAG("optn_cons",1))): ## { // gpt
      pyxtnm17 = pyxtnm16
      pyxtnm18 = XATSP1CN("optn_cons", pyxtnm17[0+1])
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm18
  return pyxtnm18
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(3050(line=162,offs=1)--3120(line=167,offs=29)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_list_nilq(2297));$list(I1FUNDCL(XATS2PY_list_nilq(16);$list(FJARGdarg($list(I1BNDcons(I1TNM(19);I0Pvar(xs(17));$list(@(xs(17),I1Vtnm(I1TNM(19))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_list_nilq);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(3121(line=168,offs=1)--3210(line=172,offs=43)))
def XATS2PY_list_nilq(arg1): ## impl
  pyxtnm20 = arg1
  ## I1CMP:start
  pyxtnm23 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(21);I0Pdapp(I0Pcon(list_nil(8));$list());$list()))
    if (XATS000_ctgeq(pyxtnm20, XATSCTAG("list_nil",0))): ## { // gpt
      pyxtnm21 = pyxtnm20
      pyxtnm23 = XATSBOOL(True)
      break ## cls
    ## } // gpt
    ## } // cls
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(22);I0Pdap1(I0Pcon(list_cons(9)));$list()))
    if (XATS000_ctgeq(pyxtnm20, XATSCTAG("list_cons",1))): ## { // gpt
      pyxtnm22 = pyxtnm20
      pyxtnm23 = XATSBOOL(False)
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm23
  return pyxtnm23
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(3214(line=174,offs=1)--3285(line=179,offs=29)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_list_consq(2298));$list(I1FUNDCL(XATS2PY_list_consq(19);$list(FJARGdarg($list(I1BNDcons(I1TNM(24);I0Pvar(xs(20));$list(@(xs(20),I1Vtnm(I1TNM(24))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_list_consq);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(3286(line=180,offs=1)--3378(line=184,offs=45)))
def XATS2PY_list_consq(arg1): ## impl
  pyxtnm25 = arg1
  ## I1CMP:start
  pyxtnm28 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(26);I0Pdapp(I0Pcon(list_nil(8));$list());$list()))
    if (XATS000_ctgeq(pyxtnm25, XATSCTAG("list_nil",0))): ## { // gpt
      pyxtnm26 = pyxtnm25
      pyxtnm28 = XATSBOOL(False)
      break ## cls
    ## } // gpt
    ## } // cls
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(27);I0Pdap1(I0Pcon(list_cons(9)));$list()))
    if (XATS000_ctgeq(pyxtnm25, XATSCTAG("list_cons",1))): ## { // gpt
      pyxtnm27 = pyxtnm25
      pyxtnm28 = XATSBOOL(True)
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm28
  return pyxtnm28
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(3405(line=188,offs=1)--3478(line=193,offs=28)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_list_head$raw(2299));$list(I1FUNDCL(XATS2PY_list_head$raw(22);$list(FJARGdarg($list(I1BNDcons(I1TNM(29);I0Pvar(xs(23));$list(@(xs(23),I1Vtnm(I1TNM(29))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_list_head$raw);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(3479(line=194,offs=1)--3556(line=197,offs=39)))
def XATS2PY_list_head_raw(arg1): ## impl
  pyxtnm30 = arg1
  ## I1CMP:start
  pyxtnm32 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(31);I0Pdapp(I0Pcon(list_cons(9));$list(I0Pvar(x1(25)),I0Pvar(xs(26))));$list(@(x1(25),I1Vp1cn(I0Pcon(list_cons(9));I1Vtnm(I1TNM(31));0)),@(xs(26),I1Vp1cn(I0Pcon(list_cons(9));I1Vtnm(I1TNM(31));1)))))
    if (XATS000_ctgeq(pyxtnm30, XATSCTAG("list_cons",1))): ## { // gpt
      pyxtnm31 = pyxtnm30
      pyxtnm32 = XATSP1CN("list_cons", pyxtnm31[0+1])
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm32
  return pyxtnm32
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(3603(line=202,offs=1)--3681(line=207,offs=32)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_lazy_make_f0un(2300));$list(I1FUNDCL(XATS2PY_lazy_make_f0un(27);$list(FJARGdarg($list(I1BNDcons(I1TNM(33);I0Pvar(f0(28));$list(@(f0(28),I1Vtnm(I1TNM(33))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_lazy_make_f0un);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(3682(line=208,offs=1)--3731(line=209,offs=41)))
def XATS2PY_lazy_make_f0un(arg1): ## impl
  pyxtnm34 = arg1
  ## I1CMP:start
  def pyxtnm36_(): ## { // l0azy
    ## I1CMP:start
    pyxtnm35 = XATSDAPP(pyxtnm34())
    ## I1CMP:return:pyxtnm35
    return pyxtnm35
  ## } // end(l0azy)
  pyxtnm36 = XATS000_l0azy(pyxtnm36_)
  ## I1CMP:return:pyxtnm36
  return pyxtnm36
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(3778(line=214,offs=1)--3848(line=218,offs=32)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_strmcon_nil(2301));$list(I1FUNDCL(XATS2PY_strmcon_nil(30);$list(FJARGdarg($list()));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_strmcon_nil);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(3849(line=219,offs=1)--3895(line=220,offs=38)))
def XATS2PY_strmcon_nil(): ## impl
  ## I1CMP:start
  pyxtnm37 = XATSCAPP("strmcon_nil", [0])
  ## I1CMP:return:pyxtnm37
  return pyxtnm37
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(3899(line=222,offs=1)--3989(line=227,offs=38)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_strmcon_cons(2302));$list(I1FUNDCL(XATS2PY_strmcon_cons(31);$list(FJARGdarg($list(I1BNDcons(I1TNM(38);I0Pvar(x1(32));$list(@(x1(32),I1Vtnm(I1TNM(38))))),I1BNDcons(I1TNM(39);I0Pvar(xs(33));$list(@(xs(33),I1Vtnm(I1TNM(39))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_strmcon_cons);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(3990(line=228,offs=1)--4048(line=229,offs=50)))
def XATS2PY_strmcon_cons(arg1, arg2): ## impl
  pyxtnm40 = arg1
  pyxtnm41 = arg2
  ## I1CMP:start
  pyxtnm42 = XATSCAPP("strmcon_cons", [1, pyxtnm40, pyxtnm41])
  ## I1CMP:return:pyxtnm42
  return pyxtnm42
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(4075(line=233,offs=1)--4151(line=238,offs=32)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_strmcon_nilq(2303));$list(I1FUNDCL(XATS2PY_strmcon_nilq(36);$list(FJARGdarg($list(I1BNDcons(I1TNM(43);I0Pvar(xs(37));$list(@(xs(37),I1Vtnm(I1TNM(43))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_strmcon_nilq);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(4152(line=239,offs=1)--4250(line=243,offs=49)))
def XATS2PY_strmcon_nilq(arg1): ## impl
  pyxtnm44 = arg1
  ## I1CMP:start
  pyxtnm47 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(45);I0Pdapp(I0Pcon(strmcon_nil(12));$list());$list()))
    if (XATS000_ctgeq(pyxtnm44, XATSCTAG("strmcon_nil",0))): ## { // gpt
      pyxtnm45 = pyxtnm44
      pyxtnm47 = XATSBOOL(True)
      break ## cls
    ## } // gpt
    ## } // cls
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(46);I0Pdap1(I0Pcon(strmcon_cons(13)));$list()))
    if (XATS000_ctgeq(pyxtnm44, XATSCTAG("strmcon_cons",1))): ## { // gpt
      pyxtnm46 = pyxtnm44
      pyxtnm47 = XATSBOOL(False)
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm47
  return pyxtnm47
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(4254(line=245,offs=1)--4331(line=250,offs=32)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_strmcon_consq(2304));$list(I1FUNDCL(XATS2PY_strmcon_consq(39);$list(FJARGdarg($list(I1BNDcons(I1TNM(48);I0Pvar(xs(40));$list(@(xs(40),I1Vtnm(I1TNM(48))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_strmcon_consq);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(4332(line=251,offs=1)--4433(line=255,offs=51)))
def XATS2PY_strmcon_consq(arg1): ## impl
  pyxtnm49 = arg1
  ## I1CMP:start
  pyxtnm52 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(50);I0Pdapp(I0Pcon(strmcon_nil(12));$list());$list()))
    if (XATS000_ctgeq(pyxtnm49, XATSCTAG("strmcon_nil",0))): ## { // gpt
      pyxtnm50 = pyxtnm49
      pyxtnm52 = XATSBOOL(False)
      break ## cls
    ## } // gpt
    ## } // cls
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(51);I0Pdap1(I0Pcon(strmcon_cons(13)));$list()))
    if (XATS000_ctgeq(pyxtnm49, XATSCTAG("strmcon_cons",1))): ## { // gpt
      pyxtnm51 = pyxtnm49
      pyxtnm52 = XATSBOOL(True)
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm52
  return pyxtnm52
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(4460(line=259,offs=1)--4539(line=264,offs=31)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_strmcon_head$raw(2305));$list(I1FUNDCL(XATS2PY_strmcon_head$raw(42);$list(FJARGdarg($list(I1BNDcons(I1TNM(53);I0Pvar(xs(43));$list(@(xs(43),I1Vtnm(I1TNM(53))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_strmcon_head$raw);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(4540(line=265,offs=1)--4623(line=268,offs=42)))
def XATS2PY_strmcon_head_raw(arg1): ## impl
  pyxtnm54 = arg1
  ## I1CMP:start
  pyxtnm56 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(55);I0Pdapp(I0Pcon(strmcon_cons(13));$list(I0Pvar(x1(45)),I0Pvar(xs(46))));$list(@(x1(45),I1Vp1cn(I0Pcon(strmcon_cons(13));I1Vtnm(I1TNM(55));0)),@(xs(46),I1Vp1cn(I0Pcon(strmcon_cons(13));I1Vtnm(I1TNM(55));1)))))
    if (XATS000_ctgeq(pyxtnm54, XATSCTAG("strmcon_cons",1))): ## { // gpt
      pyxtnm55 = pyxtnm54
      pyxtnm56 = XATSP1CN("strmcon_cons", pyxtnm55[0+1])
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm56
  return pyxtnm56
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(5084(line=306,offs=1)--5162(line=311,offs=32)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_optn_vt_nilq1(2306));$list(I1FUNDCL(XATS2PY_optn_vt_nilq1(47);$list(FJARGdarg($list(I1BNDcons(I1TNM(57);I0Pvar(xs(48));$list(@(xs(48),I1Vtnm(I1TNM(57))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_optn_vt_nilq1);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(5163(line=312,offs=1)--5259(line=316,offs=46)))
def XATS2PY_optn_vt_nilq1(arg1): ## impl
  pyxtnm58 = arg1
  ## I1CMP:start
  pyxtnm61 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(59);I0Pdapp(I0Pcon(optn_vt_nil(6));$list());$list()))
    if (XATS000_ctgeq(pyxtnm58, XATSCTAG("optn_vt_nil",0))): ## { // gpt
      pyxtnm59 = pyxtnm58
      pyxtnm61 = XATSBOOL(True)
      break ## cls
    ## } // gpt
    ## } // cls
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(60);I0Pdapp(I0Pcon(optn_vt_cons(7));$list(I0Pvar(x0(50))));$list(@(x0(50),I1Vp1cn(I0Pcon(optn_vt_cons(7));I1Vtnm(I1TNM(60));0)))))
    if (XATS000_ctgeq(pyxtnm58, XATSCTAG("optn_vt_cons",1))): ## { // gpt
      pyxtnm60 = pyxtnm58
      pyxtnm61 = XATSBOOL(False)
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm61
  return pyxtnm61
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(5263(line=318,offs=1)--5342(line=323,offs=32)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_optn_vt_consq1(2307));$list(I1FUNDCL(XATS2PY_optn_vt_consq1(51);$list(FJARGdarg($list(I1BNDcons(I1TNM(62);I0Pvar(xs(52));$list(@(xs(52),I1Vtnm(I1TNM(62))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_optn_vt_consq1);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(5343(line=324,offs=1)--5442(line=328,offs=48)))
def XATS2PY_optn_vt_consq1(arg1): ## impl
  pyxtnm63 = arg1
  ## I1CMP:start
  pyxtnm66 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(64);I0Pdapp(I0Pcon(optn_vt_nil(6));$list());$list()))
    if (XATS000_ctgeq(pyxtnm63, XATSCTAG("optn_vt_nil",0))): ## { // gpt
      pyxtnm64 = pyxtnm63
      pyxtnm66 = XATSBOOL(False)
      break ## cls
    ## } // gpt
    ## } // cls
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(65);I0Pdapp(I0Pcon(optn_vt_cons(7));$list(I0Pvar(x0(54))));$list(@(x0(54),I1Vp1cn(I0Pcon(optn_vt_cons(7));I1Vtnm(I1TNM(65));0)))))
    if (XATS000_ctgeq(pyxtnm63, XATSCTAG("optn_vt_cons",1))): ## { // gpt
      pyxtnm65 = pyxtnm63
      pyxtnm66 = XATSBOOL(True)
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm66
  return pyxtnm66
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(5469(line=332,offs=1)--5549(line=337,offs=31)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_optn_vt_head$raw0(2308));$list(I1FUNDCL(XATS2PY_optn_vt_head$raw0(55);$list(FJARGdarg($list(I1BNDcons(I1TNM(67);I0Pvar(xs(56));$list(@(xs(56),I1Vtnm(I1TNM(67))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_optn_vt_head$raw0);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(5550(line=338,offs=1)--5631(line=341,offs=39)))
def XATS2PY_optn_vt_head_raw0(arg1): ## impl
  pyxtnm68 = arg1
  ## I1CMP:start
  pyxtnm70 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(69);I0Pfree(I0Pdapp(I0Pcon(optn_vt_cons(7));$list(I0Pvar(x0(58)))));$list(@(x0(58),I1Vp1cn(I0Pcon(optn_vt_cons(7));I1Vtnm(I1TNM(69));0)))))
    if (XATS000_ctgeq(pyxtnm68, XATSCTAG("optn_vt_cons",1))): ## { // gpt
      pyxtnm69 = pyxtnm68
      pyxtnm70 = XATSP1CN("optn_vt_cons", pyxtnm69[0+1])
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm70
  return pyxtnm70
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(5635(line=343,offs=1)--5717(line=348,offs=31)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_optn_vt_uncons$raw0(2309));$list(I1FUNDCL(XATS2PY_optn_vt_uncons$raw0(59);$list(FJARGdarg($list(I1BNDcons(I1TNM(71);I0Pvar(xs(60));$list(@(xs(60),I1Vtnm(I1TNM(71))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_optn_vt_uncons$raw0);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(5718(line=349,offs=1)--5801(line=352,offs=39)))
def XATS2PY_optn_vt_uncons_raw0(arg1): ## impl
  pyxtnm72 = arg1
  ## I1CMP:start
  pyxtnm74 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(73);I0Pfree(I0Pdapp(I0Pcon(optn_vt_cons(7));$list(I0Pvar(x0(62)))));$list(@(x0(62),I1Vp1cn(I0Pcon(optn_vt_cons(7));I1Vtnm(I1TNM(73));0)))))
    if (XATS000_ctgeq(pyxtnm72, XATSCTAG("optn_vt_cons",1))): ## { // gpt
      pyxtnm73 = pyxtnm72
      pyxtnm74 = XATSP1CN("optn_vt_cons", pyxtnm73[0+1])
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm74
  return pyxtnm74
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(6220(line=385,offs=1)--6298(line=390,offs=32)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_list_vt_nilq1(2310));$list(I1FUNDCL(XATS2PY_list_vt_nilq1(63);$list(FJARGdarg($list(I1BNDcons(I1TNM(75);I0Pvar(xs(64));$list(@(xs(64),I1Vtnm(I1TNM(75))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_list_vt_nilq1);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(6299(line=391,offs=1)--6395(line=395,offs=46)))
def XATS2PY_list_vt_nilq1(arg1): ## impl
  pyxtnm76 = arg1
  ## I1CMP:start
  pyxtnm79 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(77);I0Pdapp(I0Pcon(list_vt_nil(10));$list());$list()))
    if (XATS000_ctgeq(pyxtnm76, XATSCTAG("list_vt_nil",0))): ## { // gpt
      pyxtnm77 = pyxtnm76
      pyxtnm79 = XATSBOOL(True)
      break ## cls
    ## } // gpt
    ## } // cls
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(78);I0Pdap1(I0Pcon(list_vt_cons(11)));$list()))
    if (XATS000_ctgeq(pyxtnm76, XATSCTAG("list_vt_cons",1))): ## { // gpt
      pyxtnm78 = pyxtnm76
      pyxtnm79 = XATSBOOL(False)
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm79
  return pyxtnm79
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(6399(line=397,offs=1)--6478(line=402,offs=32)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_list_vt_consq1(2311));$list(I1FUNDCL(XATS2PY_list_vt_consq1(66);$list(FJARGdarg($list(I1BNDcons(I1TNM(80);I0Pvar(xs(67));$list(@(xs(67),I1Vtnm(I1TNM(80))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_list_vt_consq1);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(6479(line=403,offs=1)--6578(line=407,offs=48)))
def XATS2PY_list_vt_consq1(arg1): ## impl
  pyxtnm81 = arg1
  ## I1CMP:start
  pyxtnm84 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(82);I0Pdapp(I0Pcon(list_vt_nil(10));$list());$list()))
    if (XATS000_ctgeq(pyxtnm81, XATSCTAG("list_vt_nil",0))): ## { // gpt
      pyxtnm82 = pyxtnm81
      pyxtnm84 = XATSBOOL(False)
      break ## cls
    ## } // gpt
    ## } // cls
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(83);I0Pdap1(I0Pcon(list_vt_cons(11)));$list()))
    if (XATS000_ctgeq(pyxtnm81, XATSCTAG("list_vt_cons",1))): ## { // gpt
      pyxtnm83 = pyxtnm81
      pyxtnm84 = XATSBOOL(True)
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm84
  return pyxtnm84
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(6605(line=411,offs=1)--6685(line=416,offs=31)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_list_vt_head$raw1(2312));$list(I1FUNDCL(XATS2PY_list_vt_head$raw1(69);$list(FJARGdarg($list(I1BNDcons(I1TNM(85);I0Pvar(xs(70));$list(@(xs(70),I1Vtnm(I1TNM(85))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_list_vt_head$raw1);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(6686(line=417,offs=1)--6826(line=426,offs=42)))
def XATS2PY_list_vt_head_raw1(arg1): ## impl
  pyxtnm86 = arg1
  ## I1CMP:start
  pyxtnm92 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(87);I0Pdapp(I0Pcon(list_vt_cons(11));$list(I0Pvar(x1(72)),I0Pvar(xs(73))));$list(@(x1(72),I1Vp1cn(I0Pcon(list_vt_cons(11));I1Vtnm(I1TNM(87));0)),@(xs(73),I1Vp1cn(I0Pcon(list_vt_cons(11));I1Vtnm(I1TNM(87));1)))))
    if (XATS000_ctgeq(pyxtnm86, XATSCTAG("list_vt_cons",1))): ## { // gpt
      pyxtnm87 = pyxtnm86
      ## let
      pyxtnm91 = None
      ## I1Dvaldclist(LCSRCsome1(precats.dats)@(6776(line=425,offs=1)--6801(line=426,offs=17)))
      ## I1VALDCL
      pyxtnm89 = None
      pyxtnm88 = XATSCAST("datacopy_1720", [XATSP1CN("list_vt_cons", pyxtnm87[0+1])])
      pyxtnm89 = pyxtnm88
      XATS000_patck(True)
      pyxtnm90 = XATSCAST("enlinear_1756", [pyxtnm89])
      pyxtnm91 = pyxtnm90
      ## end-of(let)
      pyxtnm92 = pyxtnm91
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm92
  return pyxtnm92
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(6830(line=428,offs=1)--6918(line=433,offs=38)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_list_vt_tail$raw0(2313));$list(I1FUNDCL(XATS2PY_list_vt_tail$raw0(75);$list(FJARGdarg($list(I1BNDcons(I1TNM(93);I0Pvar(xs(76));$list(@(xs(76),I1Vtnm(I1TNM(93))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_list_vt_tail$raw0);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(6919(line=434,offs=1)--7049(line=441,offs=43)))
def XATS2PY_list_vt_tail_raw0(arg1): ## impl
  pyxtnm94 = arg1
  ## I1CMP:start
  pyxtnm99 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(95);I0Pfree(I0Pdapp(I0Pcon(list_vt_cons(11));$list(I0Pvar(x1(78)),I0Pvar(xs(79)))));$list(@(x1(78),I1Vp1cn(I0Pcon(list_vt_cons(11));I1Vtnm(I1TNM(95));0)),@(xs(79),I1Vp1cn(I0Pcon(list_vt_cons(11));I1Vtnm(I1TNM(95));1)))))
    if (XATS000_ctgeq(pyxtnm94, XATSCTAG("list_vt_cons",1))): ## { // gpt
      pyxtnm95 = pyxtnm94
      ## let
      pyxtnm98 = None
      ## I1Dvaldclist(LCSRCsome1(precats.dats)@(7013(line=441,offs=7)--7038(line=441,offs=32)))
      ## I1VALDCL
      pyxtnm97 = None
      pyxtnm96 = XATSCAST("delinear_1667", [XATSP1CN("list_vt_cons", pyxtnm95[0+1])])
      pyxtnm97 = pyxtnm96
      XATS000_patck(True)
      pyxtnm98 = XATSP1CN("list_vt_cons", pyxtnm95[1+1])
      ## end-of(let)
      pyxtnm99 = pyxtnm98
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm99
  return pyxtnm99
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(7096(line=446,offs=1)--7172(line=451,offs=31)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_lazy_vt_eval(2314));$list(I1FUNDCL(XATS2PY_lazy_vt_eval(81);$list(FJARGdarg($list(I1BNDcons(I1TNM(100);I0Pvar(lz(82));$list(@(lz(82),I1Vtnm(I1TNM(100))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_lazy_vt_eval);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(7173(line=452,offs=1)--7218(line=453,offs=37)))
def XATS2PY_lazy_vt_eval(arg1): ## impl
  pyxtnm101 = arg1
  ## I1CMP:start
  pyxtnm102 = XATS000_dl1az(pyxtnm101)
  ## I1CMP:return:pyxtnm102
  return pyxtnm102
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(7222(line=455,offs=1)--7299(line=460,offs=32)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_lazy_vt_free(2315));$list(I1FUNDCL(XATS2PY_lazy_vt_free(84);$list(FJARGdarg($list(I1BNDcons(I1TNM(103);I0Pvar(lz(85));$list(@(lz(85),I1Vtnm(I1TNM(103))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_lazy_vt_free);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(7300(line=461,offs=1)--7345(line=462,offs=37)))
def XATS2PY_lazy_vt_free(arg1): ## impl
  pyxtnm104 = arg1
  ## I1CMP:start
  XATS000_free(pyxtnm104)
  ## I1CMP:return:[]
  return []
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(7372(line=466,offs=1)--7456(line=471,offs=35)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_lazy_vt_make_f0un(2316));$list(I1FUNDCL(XATS2PY_lazy_vt_make_f0un(87);$list(FJARGdarg($list(I1BNDcons(I1TNM(105);I0Pvar(f0(88));$list(@(f0(88),I1Vtnm(I1TNM(105))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_lazy_vt_make_f0un);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(7457(line=472,offs=1)--7510(line=473,offs=45)))
def XATS2PY_lazy_vt_make_f0un(arg1): ## impl
  pyxtnm106 = arg1
  ## I1CMP:start
  def pyxtnm108(tlaz): ## { // l1azy
    ## I1CMP:start
    pyxtnm107 = XATSDAPP(pyxtnm106())
    ## I1CMP:return:pyxtnm107
    return pyxtnm107
  ## } // end(l1azy)
  ## I1CMP:return:pyxtnm108
  return pyxtnm108
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(7557(line=478,offs=1)--7633(line=482,offs=35)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_strmcon_vt_nil(2317));$list(I1FUNDCL(XATS2PY_strmcon_vt_nil(90);$list(FJARGdarg($list()));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_strmcon_vt_nil);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(7634(line=483,offs=1)--7686(line=484,offs=44)))
def XATS2PY_strmcon_vt_nil(): ## impl
  ## I1CMP:start
  pyxtnm109 = XATSCAPP("strmcon_vt_nil", [0])
  ## I1CMP:return:pyxtnm109
  return pyxtnm109
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(7690(line=486,offs=1)--7789(line=491,offs=44)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_strmcon_vt_cons(2318));$list(I1FUNDCL(XATS2PY_strmcon_vt_cons(91);$list(FJARGdarg($list(I1BNDcons(I1TNM(110);I0Pvar(x1(92));$list(@(x1(92),I1Vtnm(I1TNM(110))))),I1BNDcons(I1TNM(111);I0Pvar(xs(93));$list(@(xs(93),I1Vtnm(I1TNM(111))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_strmcon_vt_cons);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(7790(line=492,offs=1)--7854(line=493,offs=56)))
def XATS2PY_strmcon_vt_cons(arg1, arg2): ## impl
  pyxtnm112 = arg1
  pyxtnm113 = arg2
  ## I1CMP:start
  pyxtnm114 = XATSCAPP("strmcon_vt_cons", [1, pyxtnm112, pyxtnm113])
  ## I1CMP:return:pyxtnm114
  return pyxtnm114
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(7881(line=497,offs=1)--7965(line=502,offs=35)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_strmcon_vt_nilq1(2319));$list(I1FUNDCL(XATS2PY_strmcon_vt_nilq1(96);$list(FJARGdarg($list(I1BNDcons(I1TNM(115);I0Pvar(xs(97));$list(@(xs(97),I1Vtnm(I1TNM(115))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_strmcon_vt_nilq1);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(7966(line=503,offs=1)--8070(line=507,offs=51)))
def XATS2PY_strmcon_vt_nilq1(arg1): ## impl
  pyxtnm116 = arg1
  ## I1CMP:start
  pyxtnm119 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(117);I0Pdapp(I0Pcon(strmcon_vt_nil(15));$list());$list()))
    if (XATS000_ctgeq(pyxtnm116, XATSCTAG("strmcon_vt_nil",0))): ## { // gpt
      pyxtnm117 = pyxtnm116
      pyxtnm119 = XATSBOOL(True)
      break ## cls
    ## } // gpt
    ## } // cls
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(118);I0Pdap1(I0Pcon(strmcon_vt_cons(16)));$list()))
    if (XATS000_ctgeq(pyxtnm116, XATSCTAG("strmcon_vt_cons",1))): ## { // gpt
      pyxtnm118 = pyxtnm116
      pyxtnm119 = XATSBOOL(False)
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm119
  return pyxtnm119
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(8074(line=509,offs=1)--8159(line=514,offs=35)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_strmcon_vt_consq1(2320));$list(I1FUNDCL(XATS2PY_strmcon_vt_consq1(99);$list(FJARGdarg($list(I1BNDcons(I1TNM(120);I0Pvar(xs(100));$list(@(xs(100),I1Vtnm(I1TNM(120))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_strmcon_vt_consq1);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(8160(line=515,offs=1)--8267(line=519,offs=53)))
def XATS2PY_strmcon_vt_consq1(arg1): ## impl
  pyxtnm121 = arg1
  ## I1CMP:start
  pyxtnm124 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(122);I0Pdapp(I0Pcon(strmcon_vt_nil(15));$list());$list()))
    if (XATS000_ctgeq(pyxtnm121, XATSCTAG("strmcon_vt_nil",0))): ## { // gpt
      pyxtnm122 = pyxtnm121
      pyxtnm124 = XATSBOOL(False)
      break ## cls
    ## } // gpt
    ## } // cls
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(123);I0Pdap1(I0Pcon(strmcon_vt_cons(16)));$list()))
    if (XATS000_ctgeq(pyxtnm121, XATSCTAG("strmcon_vt_cons",1))): ## { // gpt
      pyxtnm123 = pyxtnm121
      pyxtnm124 = XATSBOOL(True)
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm124
  return pyxtnm124
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(8294(line=523,offs=1)--8381(line=528,offs=34)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_strmcon_vt_head$raw1(2321));$list(I1FUNDCL(XATS2PY_strmcon_vt_head$raw1(102);$list(FJARGdarg($list(I1BNDcons(I1TNM(125);I0Pvar(xs(103));$list(@(xs(103),I1Vtnm(I1TNM(125))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_strmcon_vt_head$raw1);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(8382(line=529,offs=1)--8531(line=538,offs=42)))
def XATS2PY_strmcon_vt_head_raw1(arg1): ## impl
  pyxtnm126 = arg1
  ## I1CMP:start
  pyxtnm132 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(127);I0Pdapp(I0Pcon(strmcon_vt_cons(16));$list(I0Pvar(x1(105)),I0Pvar(xs(106))));$list(@(x1(105),I1Vp1cn(I0Pcon(strmcon_vt_cons(16));I1Vtnm(I1TNM(127));0)),@(xs(106),I1Vp1cn(I0Pcon(strmcon_vt_cons(16));I1Vtnm(I1TNM(127));1)))))
    if (XATS000_ctgeq(pyxtnm126, XATSCTAG("strmcon_vt_cons",1))): ## { // gpt
      pyxtnm127 = pyxtnm126
      ## let
      pyxtnm131 = None
      ## I1Dvaldclist(LCSRCsome1(precats.dats)@(8481(line=537,offs=1)--8506(line=538,offs=17)))
      ## I1VALDCL
      pyxtnm129 = None
      pyxtnm128 = XATSCAST("datacopy_1720", [XATSP1CN("strmcon_vt_cons", pyxtnm127[0+1])])
      pyxtnm129 = pyxtnm128
      XATS000_patck(True)
      pyxtnm130 = XATSCAST("enlinear_1756", [pyxtnm129])
      pyxtnm131 = pyxtnm130
      ## end-of(let)
      pyxtnm132 = pyxtnm131
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm132
  return pyxtnm132
## endfun(impl)
## I1Dextern(LCSRCsome1(precats.dats)@(8535(line=540,offs=1)--8629(line=545,offs=41)))
## I1Dfundclst(T_FUN(FNKfn1);$list();$list(XATS2PY_strmcon_vt_tail$raw0(2322));$list(I1FUNDCL(XATS2PY_strmcon_vt_tail$raw0(108);$list(FJARGdarg($list(I1BNDcons(I1TNM(133);I0Pvar(xs(109));$list(@(xs(109),I1Vtnm(I1TNM(133))))))));TEQI1CMPsome(T_EQ0();I1CMPcons($list();I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2PY_strmcon_vt_tail$raw0);G1Nlist($list())))))))
## I1Dimplmnt0(LCSRCsome1(precats.dats)@(8630(line=546,offs=1)--8769(line=553,offs=43)))
def XATS2PY_strmcon_vt_tail_raw0(arg1): ## impl
  pyxtnm134 = arg1
  ## I1CMP:start
  pyxtnm139 = None
  while True: ## do {
    ## { // cls
    ## I1GPTpat(I1BNDcons(I1TNM(135);I0Pfree(I0Pdapp(I0Pcon(strmcon_vt_cons(16));$list(I0Pvar(x1(111)),I0Pvar(xs(112)))));$list(@(x1(111),I1Vp1cn(I0Pcon(strmcon_vt_cons(16));I1Vtnm(I1TNM(135));0)),@(xs(112),I1Vp1cn(I0Pcon(strmcon_vt_cons(16));I1Vtnm(I1TNM(135));1)))))
    if (XATS000_ctgeq(pyxtnm134, XATSCTAG("strmcon_vt_cons",1))): ## { // gpt
      pyxtnm135 = pyxtnm134
      ## let
      pyxtnm138 = None
      ## I1Dvaldclist(LCSRCsome1(precats.dats)@(8733(line=553,offs=7)--8758(line=553,offs=32)))
      ## I1VALDCL
      pyxtnm137 = None
      pyxtnm136 = XATSCAST("delinear_1667", [XATSP1CN("strmcon_vt_cons", pyxtnm135[0+1])])
      pyxtnm137 = pyxtnm136
      XATS000_patck(True)
      pyxtnm138 = XATSP1CN("strmcon_vt_cons", pyxtnm135[1+1])
      ## end-of(let)
      pyxtnm139 = pyxtnm138
      break ## cls
    ## } // gpt
    ## } // cls
    XATS000_cfail()
  ## } while True // end-of(do-cls)
  ## I1CMP:return:pyxtnm139
  return pyxtnm139
## endfun(impl)
## LCSRCsome1(precats.dats)@(9025(line=561,offs=1)--9025(line=561,offs=1))
## I1Dnone1(I0Dnone1(LCSRCsome1(precats.dats)@(9025(line=561,offs=1)--9025(line=561,offs=1));D3Cnone0()))
########################################################################
########################################################################
