////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
//
// HX-2024-06-22:
// ATS3-XANADU/srcgen2/xats2js/srcgen1
//
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

'use strict';

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

let XATSINT1 = (i) => i
let XATSBOOL = (b) => b
let XATSCHAR = (c) => c
let XATSSFLT = (sflr) => sflt
let XATSDFLT = (dflt) => dflt
let XATSSTRN = (strn) => strn

////////////////////////////////////////////////////////////////////////////////////

/*
let XATSVAR0 = () => [null]
let XATSVAR1 = (init) => [init]
let XATSFLAT = (addr) => addr[0]
*/

////////////////////////////////////////////////////////////////////////////////////

let XATSDAPP = (dapp) => dapp
let XATSCAPP = (_, capp) => capp

////////////////////////////////////////////////////////////////////////////////////

let XATSPFLT = (pflt) => pflt
let XATSPROJ = (proj) => proj
let XATSP1RJ = (_, p1rj) => p1rj
let XATSP1CN = (_, p1cn) => p1cn

////////////////////////////////////////////////////////////////////////////////////
//
let XATSTRCD = (knd0) => knd0
//
let XATSTUP0 = (tpl0) => tpl0
let XATSTUP1 = (knd0, tpl1) => tpl1
let XATSRCD2 = (knd0, rcd2) => rcd2
//
////////////////////////////////////////////////////////////////////////////////////

let XATSROOT = (x) => [0, x]
let XATSLPFT = (i, x) => [1+0, x, i]
let XATSLPBX = (i, x) => [1+1, x, i]

let XATSADDR = (addr) => addr
let XATSVAR0 = (    ) => XATSROOT([null])
let XATSVAR1 = (init) => XATSROOT([init])
let XATSFLAT = (addr) => XATS000_lvget(addr)

////////////////////////////////////////////////////////////////////////////////////

let XATSCTAG = (_, t) => t
let XATS000_ctgeq = (v, t) => (v[0] == t)

////////////////////////////////////////////////////////////////////////////////////

let XATS000_casef = function()
  {
    throw new Error("XATS000_casef");
  }

let XATS000_patck = function(pck)
  {
    if (!pck) {
      throw new Error("XATS000_patck");
    } // end-of-[if]
  }

////////////////////////////////////////////////////////////////////////////////////

let XATS000_dl0az = (dlaz) => dlaz()
let XATS000_dl1az = (dlaz) => dlaz(1)

let XATS000_assgn =
  (lval, rval) => XATS000_lvset(lval, rval)

////////////////////////////////////////////////////////////////////////////////////

let XATS000_ftset =
  function(tpl0, idx1, rval)
  {
    let tpl1 = tpl0.slice();
    tpl1[idx1] = rval; return tpl1
  }

let XATS000_lvget = function(lval)
  {
    let ctag = lval[0]
    if (ctag === 0)
      return lval[1][0]
    if (ctag === 1+0)
      return XATS000_lvget(lval[1])[lval[2]]
    if (ctag === 1+1)
      return lval[1][lval[2]]
  }

let XATS000_lvset = function(lval, rval)
  {
    let ctag = lval[0]
    if (ctag === 0) return ( lval[1][0] = rval )
    if (ctag === 1+0)
    {
      return XATS000_lvset
	(lval[1], XATS000_ftset(XATS000_lvget(lval[1]), lval[2], rval))
    }
    if (ctag === 1+1) return ( lval[1][lval[2]] = rval )
  }

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
//
// end of [ATS3-XANADU/srcgen2/xats2js/srcgen1/xshared/runtime/xats2js_js1emit.js]
//
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
//
// HX-2024-06-22:
// ATS3-XANADU/srcgen2/xats2js/srcgen1
//
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
//
// prelude/SATS/bool000.sats
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_bool_neg
  (btf0)
{
    return (!btf0) ;
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_bool_add
  (btf1, btf2)
{
    return (btf1 || btf2);
}
//
function
XATS2JS_bool_mul
  (btf1, btf2)
{
    return (btf1 && btf2);
}
//
////////////////////////////////////////////////////////////////////////////////////
//
// prelude/SATS/char000.sats
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_eqz
  (chr0)
{
    return (0 === chr0); // eqz
}
function
XATS2JS_char_neqz
  (chr0)
{
    return (0 !== chr0); // neqz
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_char_cmp
  (chr1, chr2)
{
    if (chr1 < chr2)
	return (-1);
    else
	return (chr1 <= chr2 ? 0 : 1);
}
//
////////////////////////////////////////////////////////////////////////////////////
//
// prelude/SATS/gint000.sats
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_sint2uint
  (int0)
{
    return int0;
}
//
function
XATS2JS_gint_uint2sint
  (uix0)
{
    return uix0;
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_neg_sint
  (sint)
{
    return (-sint); // neg
}
//
/* ****** ****** */
//
function
XATS2JS_gint_abs_sint
  (sint)
{
    if (sint >= 0)
	return sint; // abs
    else
	return (-sint); // abs
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_succ_sint
  (sint)
{
    return (sint + 1); // +1
}
//
function
XATS2JS_gint_succ_uint
  (uint)
{
    return (uint + 1); // +1
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_pred_sint
  (sint)
{
    return (sint - 1); // -1
}
//
function
XATS2JS_gint_pred_uint
  (uint)
{
    return (uint - 1); // -1
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_lnot_uint
  (uint)
{
    return (~uint); // lnot
}
//
function
XATS2JS_gint_lor2_uint
  (uix0, uiy0)
{
    return (uix0 | uiy0); // lor2
}
//
function
XATS2JS_gint_land_uint
  (uix0, uiy0)
{
    return (uix0 & uiy0); // land
}
//
function
XATS2JS_gint_lxor_uint
  (uix0, uiy0)
{
    return (uix0 ^ uiy0); // lxor
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_asrn_sint
  (int0, n0)
{
    return (int0 >> n0); // asrn
}
//
function
XATS2JS_gint_lsln_uint
  (uix0, n0)
{
    return (uix0 << n0); // lsln
}
function
XATS2JS_gint_lsrn_uint
  (uix0, n0)
{
    return (uix0 >>> n0); // lsrn
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_lt_sint_sint
  (int1, int2)
{
    return (int1 < int2); // lt(<)
}
function
XATS2JS_gint_lt_uint_uint
  (uix1, uix2)
{
    return (uix1 < uix2); // lt(<)
}
//
function
XATS2JS_gint_gt_sint_sint
  (int1, int2)
{
    return (int1 > int2); // gt(>)
}
function
XATS2JS_gint_gt_uint_uint
  (uix1, uix2)
{
    return (uix1 > uix2); // gt(>)
}
//
function
XATS2JS_gint_eq_sint_sint
  (int1, int2)
{
    return (int1===int2); // eq(=)
}
function
XATS2JS_gint_eq_uint_uint
  (uix1, uix2)
{
    return (uix1===uix2); // eq(=)
}
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_lte_sint_sint
  (int1, int2)
{
    return (int1 <= int2); // lte(<=)
}
function
XATS2JS_gint_lte_uint_uint
  (uix1, uix2)
{
    return (uix1 <= uix2); // lte(<=)
}
//
function
XATS2JS_gint_gte_sint_sint
  (int1, int2)
{
    return (int1 >= int2); // gte(>=)
}
function
XATS2JS_gint_gte_uint_uint
  (uix1, uix2)
{
    return (uix1 >= uix2); // gte(>=)
}
//
function
XATS2JS_gint_neq_sint_sint
  (int1, int2)
{
    return (int1 !== int2); // neq(!=)
}
function
XATS2JS_gint_neq_uint_uint
  (uix1, uix2)
{
    return (uix1 !== uix2); // neq(!=)
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_cmp_sint_sint
  (int1, int2)
{
    if (int1 < int2)
	return (-1);
    else
	return (int1 <= int2 ? 0 : 1);
}
//
function
XATS2JS_gint_cmp_uint_uint
  (uix1, uix2)
{
    if (uix1 < uix2)
	return (-1);
    else
	return (uix1 <= uix2 ? 0 : 1);
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gint_add_sint_sint
  (int1, int2)
{
    return (int1 + int2); // add
}
//
function
XATS2JS_gint_sub_sint_sint
  (int1, int2)
{
    return (int1 - int2); // sub
}
//
function
XATS2JS_gint_mul_sint_sint
  (int1, int2)
{
    return (int1 * int2); // mul
}
//
function
XATS2JS_gint_mod_sint_sint
  (int1, int2)
{
    return (int1 % int2); // mod
}
//
function
XATS2JS_gint_div_sint_sint
  (int1, int2)
{ 
//
    let quot = int1 / int2;
//
    if (quot < 0)
	return Math.ceil( quot );
    else
	return Math.floor( quot );
}
//
////////////////////////////////////////////////////////////////////////////////////
//
// prelude/SATS/gflt000.sats
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gflt_si_sflt
  (int0)
{
    return int0 ; // sint
}
function
XATS2JS_gflt_si_dflt
  (int0)
{
    return int0 ; // sint
}
//
function
XATS2JS_gflt_ui_sflt
  (uix0)
{
    return uix0 ; // uint
}
function
XATS2JS_gflt_ui_dflt
  (uix0)
{
    return uix0 ; // uint
}
//
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_gflt_neg_dflt
  (flt0)
{
  return (-flt0); // neg
}
//
/* ****** ****** */
//
function
XATS2JS_gflt_abs_dflt
  (flt0)
{
    if (flt0 >= 0.0)
	return flt0; // abs
    else
	return (-flt0); // abs
}
//
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
//
// end of [ATS3-XANADU/srcgen2/xats2js/srcgen1/xshared/runtime/xats2js_basics0.js]
//
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
//
function
XATS2JS_UN_p2tr_get
  (ptr)
{
  return XATS000_lvget(ptr);
}
function
XATS2JS_UN_p2tr_set
  (ptr, obj)
{
    return XATS000_lvset(ptr, obj);
}
//
////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////

// I1Dfundclist(LCSRCsome1(./DATA/mytest11.dats)@(1561(line=115,offs=1)--1638(line=119,offs=37)))
// I1FUNDCL
function fact1_mul_tail_1564(arg1)
{ // fun
  let tnm240 = arg1
  // I1CMP:start
  // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(14650(line=1141,offs=1)--14804(line=1152,offs=4)))
  let tnm341 = function (arg1) { // timp: strm_vt_mul0(1533)
    let tnm241 = arg1
    // I1CMP:start
    let tnm340 // let
    { // let
      // LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(14697(line=1146,offs=1)--14722(line=1147,offs=17))
      // I1Di0dcl(I0Dd3ecl(D3Cd2ecl(D2Csexpdef(xs;S2Eapps(S2Ecst(strm_vt);$list(S2Evar(x0[6489])))))))
      // I1Dimplmnt0(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(14723(line=1148,offs=1)--14758(line=1149,offs=27)))
      // I1Dimplmnt0(DIMPLone2(map0$fopr(30);$list(@(x0[299],T2Pvar(x0[6489])),@(y0[300],T2Pvar(x0[6489]))))):timp
      // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(11074(line=836,offs=1)--11281(line=854,offs=7)))
      let tnm338 = function (arg1) { // timp: glseq_map0_mul0(1674)
        let tnm243 = arg1
        // I1CMP:start
        let tnm337 // let
        { // let
          // I1Dimplmnt0(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(11126(line=842,offs=1)--11207(line=847,offs=28)))
          // I1Dimplmnt0(DIMPLone2(foldl0$fopr(75);$list(@(x0[363],T2Pvar(x0[6211])),@(r0[364],T2Pvar(y0[6212]))))):timp
          // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(3647(line=286,offs=1)--3962(line=314,offs=2)))
          let tnm328 = function (arg1, arg2) { // timp: glseq_foldl0(1630)
            let tnm248 = arg1
            let tnm249 = arg2
            // I1CMP:start
            let tnm327 // let
            { // let
              // I1Dvardclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(3708(line=293,offs=1)--3723(line=293,offs=16)))
              // I1VARDCL
              // I1CMP:start
              // I1CMP:return:tnm249
              let tnm250 = XATSVAR1(tnm249)
              // I1Dvaldclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(3727(line=295,offs=1)--3745(line=295,offs=19)))
              // I1VALDCL
              XATS000_patck(true)
              let tnm251
              tnm251 = XATSADDR(tnm250)
              // I1Dvaldclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(3749(line=297,offs=1)--3957(line=312,offs=2)))
              // I1VALDCL
              XATS000_patck(true)
              let tnm252
              let tnm325 // let
              { // let
                // I1Dimplmnt0(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(3799(line=302,offs=1)--3929(line=311,offs=4)))
                // I1Dimplmnt0(DIMPLone2(foreach0$work(71);$list(@(x0[358],T2Pvar(x0[6148]))))):timp
                // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(8198(line=625,offs=1)--8386(line=641,offs=4)))
                let tnm323 = function (arg1) { // timp: glseq_foreach0(1641)
                  let tnm259 = arg1
                  // I1CMP:start
                  let tnm322 // let
                  { // let
                    // I1Dvaldclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(8241(line=629,offs=1)--8366(line=638,offs=2)))
                    // I1VALDCL
                    XATS000_patck(true)
                    let tnm260
                    let tnm321 // let
                    { // let
                      // I1Dimplmnt0(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(8286(line=633,offs=1)--8364(line=637,offs=4)))
                      // I1Dimplmnt0(DIMPLone2(forall0$test(67);$list(@(x0[354],T2Pvar(x0[6190]))))):timp
                      // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(7343(line=567,offs=1)--7440(line=573,offs=33)))
                      let tnm319 = function (arg1) { // timp: glseq_forall0(1638)
                        let tnm265 = arg1
                        // I1CMP:start
                        // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(9004(line=693,offs=1)--9334(line=718,offs=2)))
                        let tnm313 = function (arg1) { // timp: strm_vt_forall0(1520)
                          let tnm266 = arg1
                          // I1CMP:start
                          let tnm312 // let
                          { // let
                            // I1Dfundclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(9071(line=699,offs=1)--9312(line=717,offs=2)))
                            // I1FUNDCL
                            function loop_9074(arg1)
                            { // fun
                              let tnm267 = arg1
                              // I1CMP:start
                              let tnm268 = XATS000_dl1az(tnm267)
                              let tnm310 // cas
                              do {
                                // { // cls
                                if (XATS000_ctgeq(tnm268, XATSCTAG("strmcon_vt_nil", 0))) { // gpt
                                  let tnm269 = tnm268
                                  tnm310 = XATSBOOL(true)
                                  break // cls
                                } // gpt
                                // } // cls
                                // { // cls
                                if (XATS000_ctgeq(tnm268, XATSCTAG("strmcon_vt_cons", 1))) { // gpt
                                  let tnm270 = tnm268
                                  let tnm309 // let
                                  { // let
                                    // I1Dvaldclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(9189(line=710,offs=3)--9222(line=711,offs=30)))
                                    // I1VALDCL
                                    XATS000_patck(true)
                                    let tnm271
                                    // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(8286(line=633,offs=1)--8364(line=637,offs=4)))
                                    let tnm300 = function (arg1) { // timp: forall0$test(67)
                                      let tnm272 = arg1
                                      // I1CMP:start
                                      let tnm299 // let
                                      { // let
                                        // I1Dvaldclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(8322(line=636,offs=1)--8352(line=636,offs=31)))
                                        // I1VALDCL
                                        XATS000_patck(true)
                                        let tnm273
                                        // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(3799(line=302,offs=1)--3929(line=311,offs=4)))
                                        let tnm297 = function (arg1) { // timp: foreach0$work(71)
                                          let tnm274 = arg1
                                          // I1CMP:start
                                          let tnm296 // let
                                          { // let
                                            // I1Dvaldclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(3836(line=305,offs=1)--3865(line=305,offs=30)))
                                            // I1VALDCL
                                            XATS000_patck(true)
                                            let tnm275
                                            // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/unsafex.dats)@(160(line=12,offs=1)--294(line=22,offs=2)))
                                            let tnm278
                                            let tnm277 // let
                                            { // let
                                              // I1Dextern(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/unsafex.dats)@(223(line=17,offs=1)--292(line=21,offs=31)))
                                              // LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/unsafex.dats)@(231(line=18,offs=1)--292(line=21,offs=31))
                                              // I1FUNDCL
                                              // XATS2JS_UN_p2tr_get_234
                                                // FJARGdarg($list(I1BNDcons(I1TNM(276);I0Pvar(p0(4875));$list(@(p0(4875),I1Vtnm(I1TNM(276)))))))
                                                // I1CMP:start
                                                // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_UN_p2tr_get);G1Nlist($list())) // I1CMP:return
                                              tnm277 = XATS2JS_UN_p2tr_get
                                            } // endlet
                                            tnm278 = tnm277
                                            let tnm279 = XATSDAPP(tnm278(tnm251))
                                            tnm275 = tnm279
                                            // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/unsafex.dats)@(315(line=24,offs=1)--459(line=35,offs=2)))
                                            let tnm283
                                            let tnm282 // let
                                            { // let
                                              // I1Dextern(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/unsafex.dats)@(378(line=29,offs=1)--457(line=34,offs=36)))
                                              // LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/unsafex.dats)@(386(line=30,offs=1)--457(line=34,offs=36))
                                              // I1FUNDCL
                                              // XATS2JS_UN_p2tr_set_389
                                                // FJARGdarg($list(I1BNDcons(I1TNM(280);I0Pvar(p0(4877));$list(@(p0(4877),I1Vtnm(I1TNM(280))))),I1BNDcons(I1TNM(281);I0Pvar(x0(4878));$list(@(x0(4878),I1Vtnm(I1TNM(281)))))))
                                                // I1CMP:start
                                                // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_UN_p2tr_set);G1Nlist($list())) // I1CMP:return
                                              tnm282 = XATS2JS_UN_p2tr_set
                                            } // endlet
                                            tnm283 = tnm282
                                            // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(11126(line=842,offs=1)--11207(line=847,offs=28)))
                                            let tnm293 = function (arg1, arg2) { // timp: foldl0$fopr(75)
                                              let tnm284 = arg1
                                              let tnm285 = arg2
                                              // I1CMP:start
                                              // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gnum000.dats)@(980(line=88,offs=1)--1018(line=90,offs=23)))
                                              let tnm288
                                              // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gint000.dats)@(2658(line=116,offs=1)--2701(line=117,offs=35)))
                                              let tnm287
                                              // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/basics0.dats)@(8033(line=531,offs=1)--8091(line=532,offs=50)))
                                              let tnm286
                                              tnm286 = XATS2JS_gint_mul_sint_sint
                                              tnm287 = tnm286
                                              tnm288 = tnm287
                                              // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(14723(line=1148,offs=1)--14758(line=1149,offs=27)))
                                              let tnm290 = function (arg1) { // timp: map0$fopr(30)
                                                let tnm289 = arg1
                                                // I1CMP:start
                                                // I1CMP:return:tnm289
                                                return tnm289
                                              } // endtimp(map0$fopr(30))
                                              let tnm291 = XATSDAPP(tnm290(tnm285))
                                              let tnm292 = XATSDAPP(tnm288(tnm284, tnm291))
                                              // I1CMP:return:tnm292
                                              return tnm292
                                            } // endtimp(foldl0$fopr(75))
                                            let tnm294 = XATSDAPP(tnm293(tnm275, tnm274))
                                            let tnm295 = XATSDAPP(tnm283(tnm251, tnm294))
                                            tnm296 = tnm295
                                          } // endlet
                                          // I1CMP:return:tnm296
                                          return tnm296
                                        } // endtimp(foreach0$work(71))
                                        let tnm298 = XATSDAPP(tnm297(tnm272))
                                        tnm273 = tnm298
                                        tnm299 = XATSBOOL(true)
                                      } // endlet
                                      // I1CMP:return:tnm299
                                      return tnm299
                                    } // endtimp(forall0$test(67))
                                    let tnm301 = XATSDAPP(tnm300(XATSP1CN("strmcon_vt_cons", tnm270[0+1])))
                                    tnm271 = tnm301
                                    let tnm308 // ift
                                    if (tnm271) // ift
                                    {
                                      let tnm302 = XATSDAPP(loop_9074(XATSP1CN("strmcon_vt_cons", tnm270[1+1])))
                                      tnm308 = tnm302
                                    } else {
                                      // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(25297(line=1961,offs=1)--25349(line=1963,offs=37)))
                                      let tnm306
                                      // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(1792(line=150,offs=1)--1842(line=152,offs=31)))
                                      let tnm305 = function (arg1) { // timp: strm_vt_free(1494)
                                        let tnm303 = arg1
                                        // I1CMP:start
                                        let tnm304 = I1INSfree(I1Vtnm(I1TNM(303)))
                                        // I1CMP:return:tnm304
                                        return tnm304
                                      } // endtimp(strm_vt_free(1494))
                                      tnm306 = tnm305
                                      let tnm307 = XATSDAPP(tnm306(XATSP1CN("strmcon_vt_cons", tnm270[1+1])))
                                      tnm308 = XATSBOOL(false)
                                    } // end(if)
                                    tnm309 = tnm308
                                  } // endlet
                                  tnm310 = tnm309
                                  break // cls
                                } // gpt
                                // } // cls
                                XATS000_casef()
                              } while (false) // end(do)
                              // I1CMP:return:tnm310
                              return tnm310
                            } // endfun(loop_9074)
                            let tnm311 = XATSDAPP(loop_9074(tnm266))
                            tnm312 = tnm311
                          } // endlet
                          // I1CMP:return:tnm312
                          return tnm312
                        } // endtimp(strm_vt_forall0(1520))
                        // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(25646(line=1985,offs=1)--25718(line=1988,offs=41)))
                        let tnm316
                        // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(4648(line=368,offs=1)--4697(line=370,offs=30)))
                        let tnm315 = function (arg1) { // timp: strm_vt_strmize0(1503)
                          let tnm314 = arg1
                          // I1CMP:start
                          // I1CMP:return:tnm314
                          return tnm314
                        } // endtimp(strm_vt_strmize0(1503))
                        tnm316 = tnm315
                        let tnm317 = XATSDAPP(tnm316(tnm265))
                        let tnm318 = XATSDAPP(tnm313(tnm317))
                        // I1CMP:return:tnm318
                        return tnm318
                      } // endtimp(glseq_forall0(1638))
                      let tnm320 = XATSDAPP(tnm319(tnm259))
                      tnm321 = tnm320
                    } // endlet
                    tnm260 = tnm321
                    tnm322 = []
                  } // endlet
                  // I1CMP:return:tnm322
                  return tnm322
                } // endtimp(glseq_foreach0(1641))
                let tnm324 = XATSDAPP(tnm323(tnm248))
                tnm325 = tnm324
              } // endlet
              tnm252 = tnm325
              let tnm326 = XATSFLAT(tnm250)
              tnm327 = tnm326
            } // endlet
            // I1CMP:return:tnm327
            return tnm327
          } // endtimp(glseq_foldl0(1630))
          // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(10752(line=811,offs=1)--10791(line=813,offs=26)))
          let tnm334
          // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gnum000.dats)@(591(line=52,offs=1)--623(line=54,offs=17)))
          let tnm333
          // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gnum000.dats)@(161(line=15,offs=1)--198(line=17,offs=22)))
          let tnm332 = function () { // timp: g_1(181)
            // I1CMP:start
            // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gint000.dats)@(1698(line=59,offs=1)--1724(line=60,offs=18)))
            let tnm330 = function (arg1) { // timp: g_si(186)
              let tnm329 = arg1
              // I1CMP:start
              // I1CMP:return:tnm329
              return tnm329
            } // endtimp(g_si(186))
            let tnm331 = XATSDAPP(tnm330(XATSINT1(1)))
            // I1CMP:return:tnm331
            return tnm331
          } // endtimp(g_1(181))
          tnm333 = tnm332
          tnm334 = tnm333
          let tnm335 = XATSDAPP(tnm334())
          let tnm336 = XATSDAPP(tnm328(tnm243, tnm335))
          tnm337 = tnm336
        } // endlet
        // I1CMP:return:tnm337
        return tnm337
      } // endtimp(glseq_map0_mul0(1674))
      let tnm339 = XATSDAPP(tnm338(tnm241))
      tnm340 = tnm339
    } // endlet
    // I1CMP:return:tnm340
    return tnm340
  } // endtimp(strm_vt_mul0(1533))
  // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(2021(line=166,offs=1)--2141(line=173,offs=33)))
  let tnm352 = function (arg1) { // timp: strm_vt_tail0(1497)
    let tnm342 = arg1
    // I1CMP:start
    let tnm343 = XATS000_dl1az(tnm342)
    let tnm351 // cas
    do {
      // { // cls
      if (XATS000_ctgeq(tnm343, XATSCTAG("strmcon_vt_cons", 1))) { // gpt
        let tnm344 = tnm343
        let tnm350 // let
        { // let
          // I1Dvaldclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(2109(line=173,offs=1)--2131(line=173,offs=23)))
          // I1VALDCL
          XATS000_patck(true)
          let tnm345
          // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gbas000.dats)@(190(line=19,offs=1)--223(line=21,offs=18)))
          let tnm348 = function (arg1) { // timp: g_free(7)
            let tnm346 = arg1
            // I1CMP:start
            let tnm347 = XATSTUP0([])
            // I1CMP:return:tnm347
            return tnm347
          } // endtimp(g_free(7))
          let tnm349 = XATSDAPP(tnm348(XATSP1CN("strmcon_vt_cons", tnm344[0+1])))
          tnm345 = tnm349
          tnm350 = XATSP1CN("strmcon_vt_cons", tnm344[1+1])
        } // endlet
        tnm351 = tnm350
        break // cls
      } // gpt
      // } // cls
      XATS000_casef()
    } while (false) // end(do)
    // I1CMP:return:tnm351
    return tnm351
  } // endtimp(strm_vt_tail0(1497))
  // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gint000.dats)@(6198(line=388,offs=1)--6313(line=396,offs=28)))
  let tnm377 = function (arg1) { // timp: gint_strmize_sint(366)
    let tnm353 = arg1
    // I1CMP:start
    // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/basics0.dats)@(6290(line=415,offs=1)--6348(line=416,offs=50)))
    let tnm354
    tnm354 = XATS2JS_gint_lte_sint_sint
    let tnm355 = XATSDAPP(tnm354(tnm353, XATSINT1(0)))
    let tnm376 // ift
    if (tnm355) // ift
    {
      // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(1177(line=100,offs=1)--1242(line=105,offs=21)))
      let tnm358 = function () { // timp: strm_vt_nil(1487)
        // I1CMP:start
        let tnm357 = function (tlaz) { // l1azy
          // I1CMP:start
          let tnm356 = XATSCAPP("strmcon_vt_nil", [0])
          // I1CMP:return:tnm356
          return tnm356
        } // endfun(l1azy)
        // I1CMP:return:tnm357
        return tnm357
      } // endtimp(strm_vt_nil(1487))
      let tnm359 = XATSDAPP(tnm358())
      tnm376 = tnm359
    } else {
      // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gint000.dats)@(5883(line=359,offs=1)--6137(line=384,offs=2)))
      let tnm374 = function (arg1) { // timp: gint_strmize_nint(365)
        let tnm360 = arg1
        // I1CMP:start
        let tnm373 // let
        { // let
          // I1Dfundclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gint000.dats)@(5955(line=366,offs=1)--6135(line=383,offs=2)))
          // I1FUNDCL
          function auxmain_5958(arg1, arg2)
          { // fun
            let tnm361 = arg1
            let tnm362 = arg2
            // I1CMP:start
            let tnm371 = function (tlaz) { // l1azy
              // I1CMP:start
              // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/basics0.dats)@(6638(line=438,offs=1)--6696(line=439,offs=50)))
              let tnm363
              tnm363 = XATS2JS_gint_gte_sint_sint
              let tnm364 = XATSDAPP(tnm363(tnm362, tnm361))
              let tnm370 // ift
              if (tnm364) // ift
              {
                let tnm365 = XATSCAPP("strmcon_vt_nil", [0])
                tnm370 = tnm365
              } else {
                // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/basics0.dats)@(3846(line=262,offs=1)--3896(line=263,offs=42)))
                let tnm366
                tnm366 = XATS2JS_gint_succ_sint
                let tnm367 = XATSDAPP(tnm366(tnm362))
                let tnm368 = XATSDAPP(auxmain_5958(tnm361, tnm367))
                let tnm369 = XATSCAPP("strmcon_vt_cons", [1, tnm362, tnm368])
                tnm370 = tnm369
              } // end(if)
              // I1CMP:return:tnm370
              return tnm370
            } // endfun(l1azy)
            // I1CMP:return:tnm371
            return tnm371
          } // endfun(auxmain_5958)
          let tnm372 = XATSDAPP(auxmain_5958(tnm360, XATSINT1(0)))
          tnm373 = tnm372
        } // endlet
        // I1CMP:return:tnm373
        return tnm373
      } // endtimp(gint_strmize_nint(365))
      let tnm375 = XATSDAPP(tnm374(tnm353))
      tnm376 = tnm375
    } // end(if)
    // I1CMP:return:tnm376
    return tnm376
  } // endtimp(gint_strmize_sint(366))
  // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/basics0.dats)@(7706(line=510,offs=1)--7764(line=511,offs=50)))
  let tnm378
  tnm378 = XATS2JS_gint_add_sint_sint
  let tnm379 = XATSDAPP(tnm378(tnm240, XATSINT1(1)))
  let tnm380 = XATSDAPP(tnm377(tnm379))
  let tnm381 = XATSDAPP(tnm352(tnm380))
  let tnm382 = XATSDAPP(tnm341(tnm381))
  // I1CMP:return:tnm382
  return tnm382
} // endfun(fact1_mul_tail_1564)

console.log("fact1_mul_tail(10) =", fact1_mul_tail_1564(10))

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
