// Sat Jan 17 10:31:22 PM EST 2026
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
/*
the beg of
[ATS3-XANADU/srcgen2/xats2js/srcgen1/xshared/runtime/srcgen2_precats.js]
*/
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
// Fri Jan 16 11:31:07 PM EST 2026
// LCSRCsome1(precats.dats)@(1291(line=30,offs=1)--1332(line=31,offs=28))
// I1Di0dcl(I0Dd3ecl(D3Cstaload(0;T_SRP_STALOAD();G1Ea2pp(G1Eid0(=);G1Eid0(UN);G1Estr(T_STRN1_clsd("prelude/SATS/unsfx00.sats";27)));$optn(FPATH(/home/hwxi/Research/ATS-Xanadu/prelude/SATS/unsfx00.sats));...)))
// I1Dextern(LCSRCsome1(precats.dats)@(1958(line=80,offs=1)--2028(line=85,offs=29)))
// LCSRCsome1(precats.dats)@(1966(line=81,offs=1)--2028(line=85,offs=29))
// I1FUNDCL
// XATS2JS_optn_nilq_1969
  // FJARGdarg($list(I1BNDcons(I1TNM(1);I0Pvar(xs(3));$list(@(xs(3),I1Vtnm(I1TNM(1)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_optn_nilq);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(2029(line=86,offs=1)--2118(line=90,offs=43)))
let XATS2JS_optn_nilq = function (arg1) { // impl
  let jsxtnm2 = arg1
  // I1CMP:start
  let jsxtnm5 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(3);I0Pdapp(I0Pcon(optn_nil(4));$list());$list()))
    if (XATS000_ctgeq(jsxtnm2, XATSCTAG("optn_nil",0))) { // gpt
      let jsxtnm3 = jsxtnm2
      jsxtnm5 = XATSBOOL(true)
      break // cls
    } // gpt
    // } // cls
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(4);I0Pdap1(I0Pcon(optn_cons(5)));$list()))
    if (XATS000_ctgeq(jsxtnm2, XATSCTAG("optn_cons",1))) { // gpt
      let jsxtnm4 = jsxtnm2
      jsxtnm5 = XATSBOOL(false)
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm5
  return jsxtnm5
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(2122(line=92,offs=1)--2193(line=97,offs=29)))
// LCSRCsome1(precats.dats)@(2130(line=93,offs=1)--2193(line=97,offs=29))
// I1FUNDCL
// XATS2JS_optn_consq_2133
  // FJARGdarg($list(I1BNDcons(I1TNM(6);I0Pvar(xs(6));$list(@(xs(6),I1Vtnm(I1TNM(6)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_optn_consq);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(2194(line=98,offs=1)--2286(line=102,offs=45)))
let XATS2JS_optn_consq = function (arg1) { // impl
  let jsxtnm7 = arg1
  // I1CMP:start
  let jsxtnm10 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(8);I0Pdapp(I0Pcon(optn_nil(4));$list());$list()))
    if (XATS000_ctgeq(jsxtnm7, XATSCTAG("optn_nil",0))) { // gpt
      let jsxtnm8 = jsxtnm7
      jsxtnm10 = XATSBOOL(false)
      break // cls
    } // gpt
    // } // cls
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(9);I0Pdap1(I0Pcon(optn_cons(5)));$list()))
    if (XATS000_ctgeq(jsxtnm7, XATSCTAG("optn_cons",1))) { // gpt
      let jsxtnm9 = jsxtnm7
      jsxtnm10 = XATSBOOL(true)
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm10
  return jsxtnm10
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(2313(line=106,offs=1)--2386(line=111,offs=28)))
// LCSRCsome1(precats.dats)@(2321(line=107,offs=1)--2386(line=111,offs=28))
// I1FUNDCL
// XATS2JS_optn_head$raw_2324
  // FJARGdarg($list(I1BNDcons(I1TNM(11);I0Pvar(xs(9));$list(@(xs(9),I1Vtnm(I1TNM(11)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_optn_head$raw);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(2387(line=112,offs=1)--2460(line=115,offs=35)))
let XATS2JS_optn_head$raw = function (arg1) { // impl
  let jsxtnm12 = arg1
  // I1CMP:start
  let jsxtnm14 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(13);I0Pdapp(I0Pcon(optn_cons(5));$list(I0Pvar(x0(11))));$list(@(x0(11),I1Vp1cn(I0Pcon(optn_cons(5));I1Vtnm(I1TNM(13));0)))))
    if (XATS000_ctgeq(jsxtnm12, XATSCTAG("optn_cons",1))) { // gpt
      let jsxtnm13 = jsxtnm12
      jsxtnm14 = XATSP1CN("optn_cons", jsxtnm13[0+1])
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm14
  return jsxtnm14
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(2464(line=117,offs=1)--2539(line=122,offs=28)))
// LCSRCsome1(precats.dats)@(2472(line=118,offs=1)--2539(line=122,offs=28))
// I1FUNDCL
// XATS2JS_optn_uncons$raw_2475
  // FJARGdarg($list(I1BNDcons(I1TNM(15);I0Pvar(xs(13));$list(@(xs(13),I1Vtnm(I1TNM(15)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_optn_uncons$raw);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(2540(line=123,offs=1)--2615(line=126,offs=35)))
let XATS2JS_optn_uncons$raw = function (arg1) { // impl
  let jsxtnm16 = arg1
  // I1CMP:start
  let jsxtnm18 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(17);I0Pdapp(I0Pcon(optn_cons(5));$list(I0Pvar(x0(15))));$list(@(x0(15),I1Vp1cn(I0Pcon(optn_cons(5));I1Vtnm(I1TNM(17));0)))))
    if (XATS000_ctgeq(jsxtnm16, XATSCTAG("optn_cons",1))) { // gpt
      let jsxtnm17 = jsxtnm16
      jsxtnm18 = XATSP1CN("optn_cons", jsxtnm17[0+1])
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm18
  return jsxtnm18
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(3007(line=159,offs=1)--3077(line=164,offs=29)))
// LCSRCsome1(precats.dats)@(3015(line=160,offs=1)--3077(line=164,offs=29))
// I1FUNDCL
// XATS2JS_list_nilq_3018
  // FJARGdarg($list(I1BNDcons(I1TNM(19);I0Pvar(xs(17));$list(@(xs(17),I1Vtnm(I1TNM(19)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_list_nilq);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(3078(line=165,offs=1)--3167(line=169,offs=43)))
let XATS2JS_list_nilq = function (arg1) { // impl
  let jsxtnm20 = arg1
  // I1CMP:start
  let jsxtnm23 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(21);I0Pdapp(I0Pcon(list_nil(8));$list());$list()))
    if (XATS000_ctgeq(jsxtnm20, XATSCTAG("list_nil",0))) { // gpt
      let jsxtnm21 = jsxtnm20
      jsxtnm23 = XATSBOOL(true)
      break // cls
    } // gpt
    // } // cls
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(22);I0Pdap1(I0Pcon(list_cons(9)));$list()))
    if (XATS000_ctgeq(jsxtnm20, XATSCTAG("list_cons",1))) { // gpt
      let jsxtnm22 = jsxtnm20
      jsxtnm23 = XATSBOOL(false)
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm23
  return jsxtnm23
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(3171(line=171,offs=1)--3242(line=176,offs=29)))
// LCSRCsome1(precats.dats)@(3179(line=172,offs=1)--3242(line=176,offs=29))
// I1FUNDCL
// XATS2JS_list_consq_3182
  // FJARGdarg($list(I1BNDcons(I1TNM(24);I0Pvar(xs(20));$list(@(xs(20),I1Vtnm(I1TNM(24)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_list_consq);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(3243(line=177,offs=1)--3335(line=181,offs=45)))
let XATS2JS_list_consq = function (arg1) { // impl
  let jsxtnm25 = arg1
  // I1CMP:start
  let jsxtnm28 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(26);I0Pdapp(I0Pcon(list_nil(8));$list());$list()))
    if (XATS000_ctgeq(jsxtnm25, XATSCTAG("list_nil",0))) { // gpt
      let jsxtnm26 = jsxtnm25
      jsxtnm28 = XATSBOOL(false)
      break // cls
    } // gpt
    // } // cls
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(27);I0Pdap1(I0Pcon(list_cons(9)));$list()))
    if (XATS000_ctgeq(jsxtnm25, XATSCTAG("list_cons",1))) { // gpt
      let jsxtnm27 = jsxtnm25
      jsxtnm28 = XATSBOOL(true)
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm28
  return jsxtnm28
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(3362(line=185,offs=1)--3435(line=190,offs=28)))
// LCSRCsome1(precats.dats)@(3370(line=186,offs=1)--3435(line=190,offs=28))
// I1FUNDCL
// XATS2JS_list_head$raw_3373
  // FJARGdarg($list(I1BNDcons(I1TNM(29);I0Pvar(xs(23));$list(@(xs(23),I1Vtnm(I1TNM(29)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_list_head$raw);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(3436(line=191,offs=1)--3513(line=194,offs=39)))
let XATS2JS_list_head$raw = function (arg1) { // impl
  let jsxtnm30 = arg1
  // I1CMP:start
  let jsxtnm32 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(31);I0Pdapp(I0Pcon(list_cons(9));$list(I0Pvar(x1(25)),I0Pvar(xs(26))));$list(@(x1(25),I1Vp1cn(I0Pcon(list_cons(9));I1Vtnm(I1TNM(31));0)),@(xs(26),I1Vp1cn(I0Pcon(list_cons(9));I1Vtnm(I1TNM(31));1)))))
    if (XATS000_ctgeq(jsxtnm30, XATSCTAG("list_cons",1))) { // gpt
      let jsxtnm31 = jsxtnm30
      jsxtnm32 = XATSP1CN("list_cons", jsxtnm31[0+1])
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm32
  return jsxtnm32
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(3560(line=199,offs=1)--3638(line=204,offs=32)))
// LCSRCsome1(precats.dats)@(3568(line=200,offs=1)--3638(line=204,offs=32))
// I1FUNDCL
// XATS2JS_lazy_make_f0un_3571
  // FJARGdarg($list(I1BNDcons(I1TNM(33);I0Pvar(f0(28));$list(@(f0(28),I1Vtnm(I1TNM(33)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_lazy_make_f0un);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(3639(line=205,offs=1)--3688(line=206,offs=41)))
let XATS2JS_lazy_make_f0un = function (arg1) { // impl
  let jsxtnm34 = arg1
  // I1CMP:start
  let jsxtnm36 = XATS000_l0azy(function () { // l0azy
    // I1CMP:start
    let jsxtnm35 = XATSDAPP(jsxtnm34())
    // I1CMP:return:jsxtnm35
    return jsxtnm35
  }) // endfun(l0azy)
  // I1CMP:return:jsxtnm36
  return jsxtnm36
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(3735(line=211,offs=1)--3805(line=215,offs=32)))
// LCSRCsome1(precats.dats)@(3743(line=212,offs=1)--3805(line=215,offs=32))
// I1FUNDCL
// XATS2JS_strmcon_nil_3746
  // FJARGdarg($list())
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strmcon_nil);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(3806(line=216,offs=1)--3852(line=217,offs=38)))
let XATS2JS_strmcon_nil = function () { // impl
  // I1CMP:start
  let jsxtnm37 = XATSCAPP("strmcon_nil", [0])
  // I1CMP:return:jsxtnm37
  return jsxtnm37
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(3856(line=219,offs=1)--3946(line=224,offs=38)))
// LCSRCsome1(precats.dats)@(3864(line=220,offs=1)--3946(line=224,offs=38))
// I1FUNDCL
// XATS2JS_strmcon_cons_3867
  // FJARGdarg($list(I1BNDcons(I1TNM(38);I0Pvar(x1(32));$list(@(x1(32),I1Vtnm(I1TNM(38))))),I1BNDcons(I1TNM(39);I0Pvar(xs(33));$list(@(xs(33),I1Vtnm(I1TNM(39)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strmcon_cons);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(3947(line=225,offs=1)--4005(line=226,offs=50)))
let XATS2JS_strmcon_cons = function (arg1, arg2) { // impl
  let jsxtnm40 = arg1
  let jsxtnm41 = arg2
  // I1CMP:start
  let jsxtnm42 = XATSCAPP("strmcon_cons", [1, jsxtnm40, jsxtnm41])
  // I1CMP:return:jsxtnm42
  return jsxtnm42
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(4009(line=228,offs=1)--4099(line=233,offs=38)))
// LCSRCsome1(precats.dats)@(4017(line=229,offs=1)--4099(line=233,offs=38))
// I1FUNDCL
// XATS2JS_strxcon_cons_4020
  // FJARGdarg($list(I1BNDcons(I1TNM(43);I0Pvar(x1(37));$list(@(x1(37),I1Vtnm(I1TNM(43))))),I1BNDcons(I1TNM(44);I0Pvar(xs(38));$list(@(xs(38),I1Vtnm(I1TNM(44)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strxcon_cons);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(4100(line=234,offs=1)--4158(line=235,offs=50)))
let XATS2JS_strxcon_cons = function (arg1, arg2) { // impl
  let jsxtnm45 = arg1
  let jsxtnm46 = arg2
  // I1CMP:start
  let jsxtnm47 = XATSCAPP("strxcon_cons", [0, jsxtnm45, jsxtnm46])
  // I1CMP:return:jsxtnm47
  return jsxtnm47
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(4185(line=239,offs=1)--4261(line=244,offs=32)))
// LCSRCsome1(precats.dats)@(4193(line=240,offs=1)--4261(line=244,offs=32))
// I1FUNDCL
// XATS2JS_strmcon_nilq_4196
  // FJARGdarg($list(I1BNDcons(I1TNM(48);I0Pvar(xs(42));$list(@(xs(42),I1Vtnm(I1TNM(48)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strmcon_nilq);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(4262(line=245,offs=1)--4360(line=249,offs=49)))
let XATS2JS_strmcon_nilq = function (arg1) { // impl
  let jsxtnm49 = arg1
  // I1CMP:start
  let jsxtnm52 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(50);I0Pdapp(I0Pcon(strmcon_nil(12));$list());$list()))
    if (XATS000_ctgeq(jsxtnm49, XATSCTAG("strmcon_nil",0))) { // gpt
      let jsxtnm50 = jsxtnm49
      jsxtnm52 = XATSBOOL(true)
      break // cls
    } // gpt
    // } // cls
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(51);I0Pdap1(I0Pcon(strmcon_cons(13)));$list()))
    if (XATS000_ctgeq(jsxtnm49, XATSCTAG("strmcon_cons",1))) { // gpt
      let jsxtnm51 = jsxtnm49
      jsxtnm52 = XATSBOOL(false)
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm52
  return jsxtnm52
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(4364(line=251,offs=1)--4441(line=256,offs=32)))
// LCSRCsome1(precats.dats)@(4372(line=252,offs=1)--4441(line=256,offs=32))
// I1FUNDCL
// XATS2JS_strmcon_consq_4375
  // FJARGdarg($list(I1BNDcons(I1TNM(53);I0Pvar(xs(45));$list(@(xs(45),I1Vtnm(I1TNM(53)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strmcon_consq);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(4442(line=257,offs=1)--4543(line=261,offs=51)))
let XATS2JS_strmcon_consq = function (arg1) { // impl
  let jsxtnm54 = arg1
  // I1CMP:start
  let jsxtnm57 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(55);I0Pdapp(I0Pcon(strmcon_nil(12));$list());$list()))
    if (XATS000_ctgeq(jsxtnm54, XATSCTAG("strmcon_nil",0))) { // gpt
      let jsxtnm55 = jsxtnm54
      jsxtnm57 = XATSBOOL(false)
      break // cls
    } // gpt
    // } // cls
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(56);I0Pdap1(I0Pcon(strmcon_cons(13)));$list()))
    if (XATS000_ctgeq(jsxtnm54, XATSCTAG("strmcon_cons",1))) { // gpt
      let jsxtnm56 = jsxtnm54
      jsxtnm57 = XATSBOOL(true)
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm57
  return jsxtnm57
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(4570(line=265,offs=1)--4649(line=270,offs=31)))
// LCSRCsome1(precats.dats)@(4578(line=266,offs=1)--4649(line=270,offs=31))
// I1FUNDCL
// XATS2JS_strmcon_head$raw_4581
  // FJARGdarg($list(I1BNDcons(I1TNM(58);I0Pvar(xs(48));$list(@(xs(48),I1Vtnm(I1TNM(58)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strmcon_head$raw);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(4650(line=271,offs=1)--4733(line=274,offs=42)))
let XATS2JS_strmcon_head$raw = function (arg1) { // impl
  let jsxtnm59 = arg1
  // I1CMP:start
  let jsxtnm61 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(60);I0Pdapp(I0Pcon(strmcon_cons(13));$list(I0Pvar(x1(50)),I0Pvar(xs(51))));$list(@(x1(50),I1Vp1cn(I0Pcon(strmcon_cons(13));I1Vtnm(I1TNM(60));0)),@(xs(51),I1Vp1cn(I0Pcon(strmcon_cons(13));I1Vtnm(I1TNM(60));1)))))
    if (XATS000_ctgeq(jsxtnm59, XATSCTAG("strmcon_cons",1))) { // gpt
      let jsxtnm60 = jsxtnm59
      jsxtnm61 = XATSP1CN("strmcon_cons", jsxtnm60[0+1])
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm61
  return jsxtnm61
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(4737(line=276,offs=1)--4820(line=281,offs=35)))
// LCSRCsome1(precats.dats)@(4745(line=277,offs=1)--4820(line=281,offs=35))
// I1FUNDCL
// XATS2JS_strmcon_tail$raw_4748
  // FJARGdarg($list(I1BNDcons(I1TNM(62);I0Pvar(xs(53));$list(@(xs(53),I1Vtnm(I1TNM(62)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strmcon_tail$raw);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(4821(line=282,offs=1)--4904(line=285,offs=42)))
let XATS2JS_strmcon_tail$raw = function (arg1) { // impl
  let jsxtnm63 = arg1
  // I1CMP:start
  let jsxtnm65 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(64);I0Pdapp(I0Pcon(strmcon_cons(13));$list(I0Pvar(x1(55)),I0Pvar(xs(56))));$list(@(x1(55),I1Vp1cn(I0Pcon(strmcon_cons(13));I1Vtnm(I1TNM(64));0)),@(xs(56),I1Vp1cn(I0Pcon(strmcon_cons(13));I1Vtnm(I1TNM(64));1)))))
    if (XATS000_ctgeq(jsxtnm63, XATSCTAG("strmcon_cons",1))) { // gpt
      let jsxtnm64 = jsxtnm63
      jsxtnm65 = XATSP1CN("strmcon_cons", jsxtnm64[1+1])
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm65
  return jsxtnm65
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(4931(line=289,offs=1)--5032(line=297,offs=31)))
// LCSRCsome1(precats.dats)@(4939(line=290,offs=1)--5032(line=297,offs=31))
// I1FUNDCL
// XATS2JS_strxcon_head$raw_4964
  // FJARGdarg($list(I1BNDcons(I1TNM(66);I0Pvar(xs(58));$list(@(xs(58),I1Vtnm(I1TNM(66)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strxcon_head$raw);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(5033(line=298,offs=1)--5116(line=301,offs=42)))
let XATS2JS_strxcon_head$raw = function (arg1) { // impl
  let jsxtnm67 = arg1
  // I1CMP:start
  let jsxtnm69 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(68);I0Pdapp(I0Pcon(strxcon_cons(14));$list(I0Pvar(x1(60)),I0Pvar(xs(61))));$list(@(x1(60),I1Vp1cn(I0Pcon(strxcon_cons(14));I1Vtnm(I1TNM(68));0)),@(xs(61),I1Vp1cn(I0Pcon(strxcon_cons(14));I1Vtnm(I1TNM(68));1)))))
    if (XATS000_ctgeq(jsxtnm67, XATSCTAG("strxcon_cons",0))) { // gpt
      let jsxtnm68 = jsxtnm67
      jsxtnm69 = XATSP1CN("strxcon_cons", jsxtnm68[0+1])
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm69
  return jsxtnm69
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(5120(line=303,offs=1)--5225(line=311,offs=35)))
// LCSRCsome1(precats.dats)@(5128(line=304,offs=1)--5225(line=311,offs=35))
// I1FUNDCL
// XATS2JS_strxcon_tail$raw_5153
  // FJARGdarg($list(I1BNDcons(I1TNM(70);I0Pvar(xs(63));$list(@(xs(63),I1Vtnm(I1TNM(70)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strxcon_tail$raw);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(5226(line=312,offs=1)--5309(line=315,offs=42)))
let XATS2JS_strxcon_tail$raw = function (arg1) { // impl
  let jsxtnm71 = arg1
  // I1CMP:start
  let jsxtnm73 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(72);I0Pdapp(I0Pcon(strxcon_cons(14));$list(I0Pvar(x1(65)),I0Pvar(xs(66))));$list(@(x1(65),I1Vp1cn(I0Pcon(strxcon_cons(14));I1Vtnm(I1TNM(72));0)),@(xs(66),I1Vp1cn(I0Pcon(strxcon_cons(14));I1Vtnm(I1TNM(72));1)))))
    if (XATS000_ctgeq(jsxtnm71, XATSCTAG("strxcon_cons",0))) { // gpt
      let jsxtnm72 = jsxtnm71
      jsxtnm73 = XATSP1CN("strxcon_cons", jsxtnm72[1+1])
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm73
  return jsxtnm73
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(5767(line=352,offs=1)--5845(line=357,offs=32)))
// LCSRCsome1(precats.dats)@(5775(line=353,offs=1)--5845(line=357,offs=32))
// I1FUNDCL
// XATS2JS_optn_vt_nilq1_5778
  // FJARGdarg($list(I1BNDcons(I1TNM(74);I0Pvar(xs(68));$list(@(xs(68),I1Vtnm(I1TNM(74)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_optn_vt_nilq1);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(5846(line=358,offs=1)--5942(line=362,offs=46)))
let XATS2JS_optn_vt_nilq1 = function (arg1) { // impl
  let jsxtnm75 = arg1
  // I1CMP:start
  let jsxtnm78 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(76);I0Pdapp(I0Pcon(optn_vt_nil(6));$list());$list()))
    if (XATS000_ctgeq(jsxtnm75, XATSCTAG("optn_vt_nil",0))) { // gpt
      let jsxtnm76 = jsxtnm75
      jsxtnm78 = XATSBOOL(true)
      break // cls
    } // gpt
    // } // cls
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(77);I0Pdapp(I0Pcon(optn_vt_cons(7));$list(I0Pvar(x0(70))));$list(@(x0(70),I1Vp1cn(I0Pcon(optn_vt_cons(7));I1Vtnm(I1TNM(77));0)))))
    if (XATS000_ctgeq(jsxtnm75, XATSCTAG("optn_vt_cons",1))) { // gpt
      let jsxtnm77 = jsxtnm75
      jsxtnm78 = XATSBOOL(false)
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm78
  return jsxtnm78
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(5946(line=364,offs=1)--6025(line=369,offs=32)))
// LCSRCsome1(precats.dats)@(5954(line=365,offs=1)--6025(line=369,offs=32))
// I1FUNDCL
// XATS2JS_optn_vt_consq1_5957
  // FJARGdarg($list(I1BNDcons(I1TNM(79);I0Pvar(xs(72));$list(@(xs(72),I1Vtnm(I1TNM(79)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_optn_vt_consq1);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(6026(line=370,offs=1)--6125(line=374,offs=48)))
let XATS2JS_optn_vt_consq1 = function (arg1) { // impl
  let jsxtnm80 = arg1
  // I1CMP:start
  let jsxtnm83 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(81);I0Pdapp(I0Pcon(optn_vt_nil(6));$list());$list()))
    if (XATS000_ctgeq(jsxtnm80, XATSCTAG("optn_vt_nil",0))) { // gpt
      let jsxtnm81 = jsxtnm80
      jsxtnm83 = XATSBOOL(false)
      break // cls
    } // gpt
    // } // cls
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(82);I0Pdapp(I0Pcon(optn_vt_cons(7));$list(I0Pvar(x0(74))));$list(@(x0(74),I1Vp1cn(I0Pcon(optn_vt_cons(7));I1Vtnm(I1TNM(82));0)))))
    if (XATS000_ctgeq(jsxtnm80, XATSCTAG("optn_vt_cons",1))) { // gpt
      let jsxtnm82 = jsxtnm80
      jsxtnm83 = XATSBOOL(true)
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm83
  return jsxtnm83
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(6152(line=378,offs=1)--6232(line=383,offs=31)))
// LCSRCsome1(precats.dats)@(6160(line=379,offs=1)--6232(line=383,offs=31))
// I1FUNDCL
// XATS2JS_optn_vt_head$raw0_6163
  // FJARGdarg($list(I1BNDcons(I1TNM(84);I0Pvar(xs(76));$list(@(xs(76),I1Vtnm(I1TNM(84)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_optn_vt_head$raw0);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(6233(line=384,offs=1)--6314(line=387,offs=39)))
let XATS2JS_optn_vt_head$raw0 = function (arg1) { // impl
  let jsxtnm85 = arg1
  // I1CMP:start
  let jsxtnm87 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(86);I0Pfree(I0Pdapp(I0Pcon(optn_vt_cons(7));$list(I0Pvar(x0(78)))));$list(@(x0(78),I1Vp1cn(I0Pcon(optn_vt_cons(7));I1Vtnm(I1TNM(86));0)))))
    if (XATS000_ctgeq(jsxtnm85, XATSCTAG("optn_vt_cons",1))) { // gpt
      let jsxtnm86 = jsxtnm85
      jsxtnm87 = XATSP1CN("optn_vt_cons", jsxtnm86[0+1])
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm87
  return jsxtnm87
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(6318(line=389,offs=1)--6400(line=394,offs=31)))
// LCSRCsome1(precats.dats)@(6326(line=390,offs=1)--6400(line=394,offs=31))
// I1FUNDCL
// XATS2JS_optn_vt_uncons$raw0_6329
  // FJARGdarg($list(I1BNDcons(I1TNM(88);I0Pvar(xs(80));$list(@(xs(80),I1Vtnm(I1TNM(88)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_optn_vt_uncons$raw0);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(6401(line=395,offs=1)--6484(line=398,offs=39)))
let XATS2JS_optn_vt_uncons$raw0 = function (arg1) { // impl
  let jsxtnm89 = arg1
  // I1CMP:start
  let jsxtnm91 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(90);I0Pfree(I0Pdapp(I0Pcon(optn_vt_cons(7));$list(I0Pvar(x0(82)))));$list(@(x0(82),I1Vp1cn(I0Pcon(optn_vt_cons(7));I1Vtnm(I1TNM(90));0)))))
    if (XATS000_ctgeq(jsxtnm89, XATSCTAG("optn_vt_cons",1))) { // gpt
      let jsxtnm90 = jsxtnm89
      jsxtnm91 = XATSP1CN("optn_vt_cons", jsxtnm90[0+1])
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm91
  return jsxtnm91
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(6903(line=431,offs=1)--6981(line=436,offs=32)))
// LCSRCsome1(precats.dats)@(6911(line=432,offs=1)--6981(line=436,offs=32))
// I1FUNDCL
// XATS2JS_list_vt_nilq1_6914
  // FJARGdarg($list(I1BNDcons(I1TNM(92);I0Pvar(xs(84));$list(@(xs(84),I1Vtnm(I1TNM(92)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_list_vt_nilq1);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(6982(line=437,offs=1)--7078(line=441,offs=46)))
let XATS2JS_list_vt_nilq1 = function (arg1) { // impl
  let jsxtnm93 = arg1
  // I1CMP:start
  let jsxtnm96 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(94);I0Pdapp(I0Pcon(list_vt_nil(10));$list());$list()))
    if (XATS000_ctgeq(jsxtnm93, XATSCTAG("list_vt_nil",0))) { // gpt
      let jsxtnm94 = jsxtnm93
      jsxtnm96 = XATSBOOL(true)
      break // cls
    } // gpt
    // } // cls
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(95);I0Pdap1(I0Pcon(list_vt_cons(11)));$list()))
    if (XATS000_ctgeq(jsxtnm93, XATSCTAG("list_vt_cons",1))) { // gpt
      let jsxtnm95 = jsxtnm93
      jsxtnm96 = XATSBOOL(false)
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm96
  return jsxtnm96
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(7082(line=443,offs=1)--7161(line=448,offs=32)))
// LCSRCsome1(precats.dats)@(7090(line=444,offs=1)--7161(line=448,offs=32))
// I1FUNDCL
// XATS2JS_list_vt_consq1_7093
  // FJARGdarg($list(I1BNDcons(I1TNM(97);I0Pvar(xs(87));$list(@(xs(87),I1Vtnm(I1TNM(97)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_list_vt_consq1);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(7162(line=449,offs=1)--7261(line=453,offs=48)))
let XATS2JS_list_vt_consq1 = function (arg1) { // impl
  let jsxtnm98 = arg1
  // I1CMP:start
  let jsxtnm101 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(99);I0Pdapp(I0Pcon(list_vt_nil(10));$list());$list()))
    if (XATS000_ctgeq(jsxtnm98, XATSCTAG("list_vt_nil",0))) { // gpt
      let jsxtnm99 = jsxtnm98
      jsxtnm101 = XATSBOOL(false)
      break // cls
    } // gpt
    // } // cls
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(100);I0Pdap1(I0Pcon(list_vt_cons(11)));$list()))
    if (XATS000_ctgeq(jsxtnm98, XATSCTAG("list_vt_cons",1))) { // gpt
      let jsxtnm100 = jsxtnm98
      jsxtnm101 = XATSBOOL(true)
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm101
  return jsxtnm101
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(7288(line=457,offs=1)--7368(line=462,offs=31)))
// LCSRCsome1(precats.dats)@(7296(line=458,offs=1)--7368(line=462,offs=31))
// I1FUNDCL
// XATS2JS_list_vt_head$raw1_7299
  // FJARGdarg($list(I1BNDcons(I1TNM(102);I0Pvar(xs(90));$list(@(xs(90),I1Vtnm(I1TNM(102)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_list_vt_head$raw1);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(7369(line=463,offs=1)--7509(line=472,offs=42)))
let XATS2JS_list_vt_head$raw1 = function (arg1) { // impl
  let jsxtnm103 = arg1
  // I1CMP:start
  let jsxtnm109 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(104);I0Pdapp(I0Pcon(list_vt_cons(11));$list(I0Pvar(x1(92)),I0Pvar(xs(93))));$list(@(x1(92),I1Vp1cn(I0Pcon(list_vt_cons(11));I1Vtnm(I1TNM(104));0)),@(xs(93),I1Vp1cn(I0Pcon(list_vt_cons(11));I1Vtnm(I1TNM(104));1)))))
    if (XATS000_ctgeq(jsxtnm103, XATSCTAG("list_vt_cons",1))) { // gpt
      let jsxtnm104 = jsxtnm103
      let jsxtnm108 // let
      { // let
        // I1Dvaldclist(LCSRCsome1(precats.dats)@(7459(line=471,offs=1)--7484(line=472,offs=17)))
        // I1VALDCL
        let jsxtnm106
        let jsxtnm105 = XATSCAST("datacopy_1720", [XATSP1CN("list_vt_cons", jsxtnm104[0+1])])
        jsxtnm106 = jsxtnm105
        XATS000_patck(true)
        let jsxtnm107 = XATSCAST("enlinear_1756", [jsxtnm106])
        jsxtnm108 = jsxtnm107
      } // endlet
      jsxtnm109 = jsxtnm108
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm109
  return jsxtnm109
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(7513(line=474,offs=1)--7601(line=479,offs=38)))
// LCSRCsome1(precats.dats)@(7521(line=475,offs=1)--7601(line=479,offs=38))
// I1FUNDCL
// XATS2JS_list_vt_tail$raw0_7524
  // FJARGdarg($list(I1BNDcons(I1TNM(110);I0Pvar(xs(96));$list(@(xs(96),I1Vtnm(I1TNM(110)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_list_vt_tail$raw0);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(7602(line=480,offs=1)--7732(line=487,offs=43)))
let XATS2JS_list_vt_tail$raw0 = function (arg1) { // impl
  let jsxtnm111 = arg1
  // I1CMP:start
  let jsxtnm116 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(112);I0Pfree(I0Pdapp(I0Pcon(list_vt_cons(11));$list(I0Pvar(x1(98)),I0Pvar(xs(99)))));$list(@(x1(98),I1Vp1cn(I0Pcon(list_vt_cons(11));I1Vtnm(I1TNM(112));0)),@(xs(99),I1Vp1cn(I0Pcon(list_vt_cons(11));I1Vtnm(I1TNM(112));1)))))
    if (XATS000_ctgeq(jsxtnm111, XATSCTAG("list_vt_cons",1))) { // gpt
      let jsxtnm112 = jsxtnm111
      let jsxtnm115 // let
      { // let
        // I1Dvaldclist(LCSRCsome1(precats.dats)@(7696(line=487,offs=7)--7721(line=487,offs=32)))
        // I1VALDCL
        let jsxtnm114
        let jsxtnm113 = XATSCAST("delinear_1667", [XATSP1CN("list_vt_cons", jsxtnm112[0+1])])
        jsxtnm114 = jsxtnm113
        XATS000_patck(true)
        jsxtnm115 = XATSP1CN("list_vt_cons", jsxtnm112[1+1])
      } // endlet
      jsxtnm116 = jsxtnm115
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm116
  return jsxtnm116
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(7779(line=492,offs=1)--7855(line=497,offs=31)))
// LCSRCsome1(precats.dats)@(7787(line=493,offs=1)--7855(line=497,offs=31))
// I1FUNDCL
// XATS2JS_lazy_vt_eval_7790
  // FJARGdarg($list(I1BNDcons(I1TNM(117);I0Pvar(lz(102));$list(@(lz(102),I1Vtnm(I1TNM(117)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_lazy_vt_eval);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(7856(line=498,offs=1)--7901(line=499,offs=37)))
let XATS2JS_lazy_vt_eval = function (arg1) { // impl
  let jsxtnm118 = arg1
  // I1CMP:start
  let jsxtnm119 = XATS000_dl1az(jsxtnm118)
  // I1CMP:return:jsxtnm119
  return jsxtnm119
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(7905(line=501,offs=1)--7982(line=506,offs=32)))
// LCSRCsome1(precats.dats)@(7913(line=502,offs=1)--7982(line=506,offs=32))
// I1FUNDCL
// XATS2JS_lazy_vt_free_7916
  // FJARGdarg($list(I1BNDcons(I1TNM(120);I0Pvar(lz(105));$list(@(lz(105),I1Vtnm(I1TNM(120)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_lazy_vt_free);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(7983(line=507,offs=1)--8028(line=508,offs=37)))
let XATS2JS_lazy_vt_free = function (arg1) { // impl
  let jsxtnm121 = arg1
  // I1CMP:start
  XATS000_free(jsxtnm121)
  // I1CMP:return:[]
  return []
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(8055(line=512,offs=1)--8139(line=517,offs=35)))
// LCSRCsome1(precats.dats)@(8063(line=513,offs=1)--8139(line=517,offs=35))
// I1FUNDCL
// XATS2JS_lazy_vt_make_f0un_8066
  // FJARGdarg($list(I1BNDcons(I1TNM(122);I0Pvar(f0(108));$list(@(f0(108),I1Vtnm(I1TNM(122)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_lazy_vt_make_f0un);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(8140(line=518,offs=1)--8193(line=519,offs=45)))
let XATS2JS_lazy_vt_make_f0un = function (arg1) { // impl
  let jsxtnm123 = arg1
  // I1CMP:start
  let jsxtnm125 = XATS000_l1azy(function (tlaz) { // l1azy
    // I1CMP:start
    let jsxtnm124 = XATSDAPP(jsxtnm123())
    // I1CMP:return:jsxtnm124
    return jsxtnm124
  }) // endfun(l1azy)
  // I1CMP:return:jsxtnm125
  return jsxtnm125
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(8240(line=524,offs=1)--8316(line=528,offs=35)))
// LCSRCsome1(precats.dats)@(8248(line=525,offs=1)--8316(line=528,offs=35))
// I1FUNDCL
// XATS2JS_strmcon_vt_nil_8251
  // FJARGdarg($list())
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strmcon_vt_nil);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(8317(line=529,offs=1)--8369(line=530,offs=44)))
let XATS2JS_strmcon_vt_nil = function () { // impl
  // I1CMP:start
  let jsxtnm126 = XATSCAPP("strmcon_vt_nil", [0])
  // I1CMP:return:jsxtnm126
  return jsxtnm126
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(8373(line=532,offs=1)--8472(line=537,offs=44)))
// LCSRCsome1(precats.dats)@(8381(line=533,offs=1)--8472(line=537,offs=44))
// I1FUNDCL
// XATS2JS_strmcon_vt_cons_8384
  // FJARGdarg($list(I1BNDcons(I1TNM(127);I0Pvar(x1(112));$list(@(x1(112),I1Vtnm(I1TNM(127))))),I1BNDcons(I1TNM(128);I0Pvar(xs(113));$list(@(xs(113),I1Vtnm(I1TNM(128)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strmcon_vt_cons);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(8473(line=538,offs=1)--8537(line=539,offs=56)))
let XATS2JS_strmcon_vt_cons = function (arg1, arg2) { // impl
  let jsxtnm129 = arg1
  let jsxtnm130 = arg2
  // I1CMP:start
  let jsxtnm131 = XATSCAPP("strmcon_vt_cons", [1, jsxtnm129, jsxtnm130])
  // I1CMP:return:jsxtnm131
  return jsxtnm131
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(8541(line=541,offs=1)--8640(line=546,offs=44)))
// LCSRCsome1(precats.dats)@(8549(line=542,offs=1)--8640(line=546,offs=44))
// I1FUNDCL
// XATS2JS_strxcon_vt_cons_8552
  // FJARGdarg($list(I1BNDcons(I1TNM(132);I0Pvar(x1(117));$list(@(x1(117),I1Vtnm(I1TNM(132))))),I1BNDcons(I1TNM(133);I0Pvar(xs(118));$list(@(xs(118),I1Vtnm(I1TNM(133)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strxcon_vt_cons);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(8641(line=547,offs=1)--8705(line=548,offs=56)))
let XATS2JS_strxcon_vt_cons = function (arg1, arg2) { // impl
  let jsxtnm134 = arg1
  let jsxtnm135 = arg2
  // I1CMP:start
  let jsxtnm136 = XATSCAPP("strxcon_vt_cons", [0, jsxtnm134, jsxtnm135])
  // I1CMP:return:jsxtnm136
  return jsxtnm136
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(8732(line=552,offs=1)--8816(line=557,offs=35)))
// LCSRCsome1(precats.dats)@(8740(line=553,offs=1)--8816(line=557,offs=35))
// I1FUNDCL
// XATS2JS_strmcon_vt_nilq1_8743
  // FJARGdarg($list(I1BNDcons(I1TNM(137);I0Pvar(xs(122));$list(@(xs(122),I1Vtnm(I1TNM(137)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strmcon_vt_nilq1);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(8817(line=558,offs=1)--8921(line=562,offs=51)))
let XATS2JS_strmcon_vt_nilq1 = function (arg1) { // impl
  let jsxtnm138 = arg1
  // I1CMP:start
  let jsxtnm141 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(139);I0Pdapp(I0Pcon(strmcon_vt_nil(15));$list());$list()))
    if (XATS000_ctgeq(jsxtnm138, XATSCTAG("strmcon_vt_nil",0))) { // gpt
      let jsxtnm139 = jsxtnm138
      jsxtnm141 = XATSBOOL(true)
      break // cls
    } // gpt
    // } // cls
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(140);I0Pdap1(I0Pcon(strmcon_vt_cons(16)));$list()))
    if (XATS000_ctgeq(jsxtnm138, XATSCTAG("strmcon_vt_cons",1))) { // gpt
      let jsxtnm140 = jsxtnm138
      jsxtnm141 = XATSBOOL(false)
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm141
  return jsxtnm141
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(8925(line=564,offs=1)--9010(line=569,offs=35)))
// LCSRCsome1(precats.dats)@(8933(line=565,offs=1)--9010(line=569,offs=35))
// I1FUNDCL
// XATS2JS_strmcon_vt_consq1_8936
  // FJARGdarg($list(I1BNDcons(I1TNM(142);I0Pvar(xs(125));$list(@(xs(125),I1Vtnm(I1TNM(142)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strmcon_vt_consq1);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(9011(line=570,offs=1)--9118(line=574,offs=53)))
let XATS2JS_strmcon_vt_consq1 = function (arg1) { // impl
  let jsxtnm143 = arg1
  // I1CMP:start
  let jsxtnm146 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(144);I0Pdapp(I0Pcon(strmcon_vt_nil(15));$list());$list()))
    if (XATS000_ctgeq(jsxtnm143, XATSCTAG("strmcon_vt_nil",0))) { // gpt
      let jsxtnm144 = jsxtnm143
      jsxtnm146 = XATSBOOL(false)
      break // cls
    } // gpt
    // } // cls
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(145);I0Pdap1(I0Pcon(strmcon_vt_cons(16)));$list()))
    if (XATS000_ctgeq(jsxtnm143, XATSCTAG("strmcon_vt_cons",1))) { // gpt
      let jsxtnm145 = jsxtnm143
      jsxtnm146 = XATSBOOL(true)
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm146
  return jsxtnm146
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(9145(line=578,offs=1)--9232(line=583,offs=34)))
// LCSRCsome1(precats.dats)@(9153(line=579,offs=1)--9232(line=583,offs=34))
// I1FUNDCL
// XATS2JS_strmcon_vt_head$raw1_9156
  // FJARGdarg($list(I1BNDcons(I1TNM(147);I0Pvar(xs(128));$list(@(xs(128),I1Vtnm(I1TNM(147)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strmcon_vt_head$raw1);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(9233(line=584,offs=1)--9382(line=593,offs=42)))
let XATS2JS_strmcon_vt_head$raw1 = function (arg1) { // impl
  let jsxtnm148 = arg1
  // I1CMP:start
  let jsxtnm154 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(149);I0Pdapp(I0Pcon(strmcon_vt_cons(16));$list(I0Pvar(x1(130)),I0Pvar(xs(131))));$list(@(x1(130),I1Vp1cn(I0Pcon(strmcon_vt_cons(16));I1Vtnm(I1TNM(149));0)),@(xs(131),I1Vp1cn(I0Pcon(strmcon_vt_cons(16));I1Vtnm(I1TNM(149));1)))))
    if (XATS000_ctgeq(jsxtnm148, XATSCTAG("strmcon_vt_cons",1))) { // gpt
      let jsxtnm149 = jsxtnm148
      let jsxtnm153 // let
      { // let
        // I1Dvaldclist(LCSRCsome1(precats.dats)@(9332(line=592,offs=1)--9357(line=593,offs=17)))
        // I1VALDCL
        let jsxtnm151
        let jsxtnm150 = XATSCAST("datacopy_1720", [XATSP1CN("strmcon_vt_cons", jsxtnm149[0+1])])
        jsxtnm151 = jsxtnm150
        XATS000_patck(true)
        let jsxtnm152 = XATSCAST("enlinear_1756", [jsxtnm151])
        jsxtnm153 = jsxtnm152
      } // endlet
      jsxtnm154 = jsxtnm153
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm154
  return jsxtnm154
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(9386(line=595,offs=1)--9480(line=600,offs=41)))
// LCSRCsome1(precats.dats)@(9394(line=596,offs=1)--9480(line=600,offs=41))
// I1FUNDCL
// XATS2JS_strmcon_vt_tail$raw0_9397
  // FJARGdarg($list(I1BNDcons(I1TNM(155);I0Pvar(xs(134));$list(@(xs(134),I1Vtnm(I1TNM(155)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strmcon_vt_tail$raw0);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(9481(line=601,offs=1)--9620(line=608,offs=43)))
let XATS2JS_strmcon_vt_tail$raw0 = function (arg1) { // impl
  let jsxtnm156 = arg1
  // I1CMP:start
  let jsxtnm161 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(157);I0Pfree(I0Pdapp(I0Pcon(strmcon_vt_cons(16));$list(I0Pvar(x1(136)),I0Pvar(xs(137)))));$list(@(x1(136),I1Vp1cn(I0Pcon(strmcon_vt_cons(16));I1Vtnm(I1TNM(157));0)),@(xs(137),I1Vp1cn(I0Pcon(strmcon_vt_cons(16));I1Vtnm(I1TNM(157));1)))))
    if (XATS000_ctgeq(jsxtnm156, XATSCTAG("strmcon_vt_cons",1))) { // gpt
      let jsxtnm157 = jsxtnm156
      let jsxtnm160 // let
      { // let
        // I1Dvaldclist(LCSRCsome1(precats.dats)@(9584(line=608,offs=7)--9609(line=608,offs=32)))
        // I1VALDCL
        let jsxtnm159
        let jsxtnm158 = XATSCAST("delinear_1667", [XATSP1CN("strmcon_vt_cons", jsxtnm157[0+1])])
        jsxtnm159 = jsxtnm158
        XATS000_patck(true)
        jsxtnm160 = XATSP1CN("strmcon_vt_cons", jsxtnm157[1+1])
      } // endlet
      jsxtnm161 = jsxtnm160
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm161
  return jsxtnm161
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(9669(line=615,offs=1)--9756(line=620,offs=34)))
// LCSRCsome1(precats.dats)@(9677(line=616,offs=1)--9756(line=620,offs=34))
// I1FUNDCL
// XATS2JS_strxcon_vt_head$raw1_9680
  // FJARGdarg($list(I1BNDcons(I1TNM(162);I0Pvar(xs(140));$list(@(xs(140),I1Vtnm(I1TNM(162)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strxcon_vt_head$raw1);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(9757(line=621,offs=1)--9906(line=630,offs=42)))
let XATS2JS_strxcon_vt_head$raw1 = function (arg1) { // impl
  let jsxtnm163 = arg1
  // I1CMP:start
  let jsxtnm169 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(164);I0Pdapp(I0Pcon(strxcon_vt_cons(17));$list(I0Pvar(x1(142)),I0Pvar(xs(143))));$list(@(x1(142),I1Vp1cn(I0Pcon(strxcon_vt_cons(17));I1Vtnm(I1TNM(164));0)),@(xs(143),I1Vp1cn(I0Pcon(strxcon_vt_cons(17));I1Vtnm(I1TNM(164));1)))))
    if (XATS000_ctgeq(jsxtnm163, XATSCTAG("strxcon_vt_cons",0))) { // gpt
      let jsxtnm164 = jsxtnm163
      let jsxtnm168 // let
      { // let
        // I1Dvaldclist(LCSRCsome1(precats.dats)@(9856(line=629,offs=1)--9881(line=630,offs=17)))
        // I1VALDCL
        let jsxtnm166
        let jsxtnm165 = XATSCAST("datacopy_1720", [XATSP1CN("strxcon_vt_cons", jsxtnm164[0+1])])
        jsxtnm166 = jsxtnm165
        XATS000_patck(true)
        let jsxtnm167 = XATSCAST("enlinear_1756", [jsxtnm166])
        jsxtnm168 = jsxtnm167
      } // endlet
      jsxtnm169 = jsxtnm168
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm169
  return jsxtnm169
} // endfun(impl)
// I1Dextern(LCSRCsome1(precats.dats)@(9932(line=635,offs=1)--10026(line=640,offs=41)))
// LCSRCsome1(precats.dats)@(9940(line=636,offs=1)--10026(line=640,offs=41))
// I1FUNDCL
// XATS2JS_strxcon_vt_tail$raw0_9943
  // FJARGdarg($list(I1BNDcons(I1TNM(170);I0Pvar(xs(146));$list(@(xs(146),I1Vtnm(I1TNM(170)))))))
  // I1CMP:start
  // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_strxcon_vt_tail$raw0);G1Nlist($list())) // I1CMP:return
// I1Dimplmnt0(LCSRCsome1(precats.dats)@(10027(line=641,offs=1)--10166(line=648,offs=43)))
let XATS2JS_strxcon_vt_tail$raw0 = function (arg1) { // impl
  let jsxtnm171 = arg1
  // I1CMP:start
  let jsxtnm176 // cas
  do {
    // { // cls
    // I1GPTpat(I1BNDcons(I1TNM(172);I0Pfree(I0Pdapp(I0Pcon(strxcon_vt_cons(17));$list(I0Pvar(x1(148)),I0Pvar(xs(149)))));$list(@(x1(148),I1Vp1cn(I0Pcon(strxcon_vt_cons(17));I1Vtnm(I1TNM(172));0)),@(xs(149),I1Vp1cn(I0Pcon(strxcon_vt_cons(17));I1Vtnm(I1TNM(172));1)))))
    if (XATS000_ctgeq(jsxtnm171, XATSCTAG("strxcon_vt_cons",0))) { // gpt
      let jsxtnm172 = jsxtnm171
      let jsxtnm175 // let
      { // let
        // I1Dvaldclist(LCSRCsome1(precats.dats)@(10130(line=648,offs=7)--10155(line=648,offs=32)))
        // I1VALDCL
        let jsxtnm174
        let jsxtnm173 = XATSCAST("delinear_1667", [XATSP1CN("strxcon_vt_cons", jsxtnm172[0+1])])
        jsxtnm174 = jsxtnm173
        XATS000_patck(true)
        jsxtnm175 = XATSP1CN("strxcon_vt_cons", jsxtnm172[1+1])
      } // endlet
      jsxtnm176 = jsxtnm175
      break // cls
    } // gpt
    // } // cls
    XATS000_cfail()
  } while (false) // end-of(do)
  // I1CMP:return:jsxtnm176
  return jsxtnm176
} // endfun(impl)
// LCSRCsome1(precats.dats)@(10422(line=656,offs=1)--10422(line=656,offs=1))
// I1Dnone1(I0Dnone1(LCSRCsome1(precats.dats)@(10422(line=656,offs=1)--10422(line=656,offs=1));D3Cnone0()))
////////////////////////////////////////////////////////////////////////.
////////////////////////////////////////////////////////////////////////.
