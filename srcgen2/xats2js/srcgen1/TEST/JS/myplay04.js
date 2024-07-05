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
let XATSSFLT = (sflt) => sflt
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
//
// I1Dfundclist(LCSRCsome1(./DATA/mytest12.dats)@(1561(line=116,offs=1)--1638(line=120,offs=37)))
// I1FUNDCL
function fact1_mul_tail_1564(arg1)
{ // fun
  let tnm131 = arg1
  // I1CMP:start
  // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(14650(line=1141,offs=1)--14804(line=1152,offs=4)))
  let tnm232 = function (arg1) { // timp: strm_vt_mul0(1533)
    let tnm132 = arg1
    // I1CMP:start
    let tnm231 // let
    { // let
      // LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(14697(line=1146,offs=1)--14722(line=1147,offs=17))
      // I1Di0dcl(I0Dd3ecl(D3Cd2ecl(D2Csexpdef(xs;S2Eapps(S2Ecst(strm_vt);$list(S2Evar(x0[6489])))))))
      // I1Dimplmnt0(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(14723(line=1148,offs=1)--14758(line=1149,offs=27)))
      // I1Dimplmnt0(DIMPLone2(map0$fopr(30);$list(@(x0[299],T2Pvar(x0[6489])),@(y0[300],T2Pvar(x0[6489]))))):timp
      // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(11074(line=836,offs=1)--11281(line=854,offs=7)))
      let tnm229 = function (arg1) { // timp: glseq_map0_mul0(1674)
        let tnm134 = arg1
        // I1CMP:start
        let tnm228 // let
        { // let
          // I1Dimplmnt0(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(11126(line=842,offs=1)--11207(line=847,offs=28)))
          // I1Dimplmnt0(DIMPLone2(foldl0$fopr(75);$list(@(x0[363],T2Pvar(x0[6211])),@(r0[364],T2Pvar(y0[6212]))))):timp
          // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(3647(line=286,offs=1)--3962(line=314,offs=2)))
          let tnm219 = function (arg1, arg2) { // timp: glseq_foldl0(1630)
            let tnm139 = arg1
            let tnm140 = arg2
            // I1CMP:start
            let tnm218 // let
            { // let
              // I1Dvardclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(3708(line=293,offs=1)--3723(line=293,offs=16)))
              // I1VARDCL
              // I1CMP:start
              // I1CMP:return:tnm140
              let tnm141 = XATSVAR1(tnm140)
              // I1Dvaldclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(3727(line=295,offs=1)--3745(line=295,offs=19)))
              // I1VALDCL
              XATS000_patck(true)
              let tnm142
              tnm142 = XATSADDR(tnm141)
              // I1Dvaldclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(3749(line=297,offs=1)--3957(line=312,offs=2)))
              // I1VALDCL
              XATS000_patck(true)
              let tnm143
              let tnm216 // let
              { // let
                // I1Dimplmnt0(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(3799(line=302,offs=1)--3929(line=311,offs=4)))
                // I1Dimplmnt0(DIMPLone2(foreach0$work(71);$list(@(x0[358],T2Pvar(x0[6148]))))):timp
                // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(8198(line=625,offs=1)--8386(line=641,offs=4)))
                let tnm214 = function (arg1) { // timp: glseq_foreach0(1641)
                  let tnm150 = arg1
                  // I1CMP:start
                  let tnm213 // let
                  { // let
                    // I1Dvaldclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(8241(line=629,offs=1)--8366(line=638,offs=2)))
                    // I1VALDCL
                    XATS000_patck(true)
                    let tnm151
                    let tnm212 // let
                    { // let
                      // I1Dimplmnt0(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(8286(line=633,offs=1)--8364(line=637,offs=4)))
                      // I1Dimplmnt0(DIMPLone2(forall0$test(67);$list(@(x0[354],T2Pvar(x0[6190]))))):timp
                      // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(7343(line=567,offs=1)--7440(line=573,offs=33)))
                      let tnm210 = function (arg1) { // timp: glseq_forall0(1638)
                        let tnm156 = arg1
                        // I1CMP:start
                        // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(9004(line=693,offs=1)--9334(line=718,offs=2)))
                        let tnm204 = function (arg1) { // timp: strm_vt_forall0(1520)
                          let tnm157 = arg1
                          // I1CMP:start
                          let tnm203 // let
                          { // let
                            // I1Dfundclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(9071(line=699,offs=1)--9312(line=717,offs=2)))
                            // I1FUNDCL
                            function loop_9074(arg1)
                            { // fun
                              let tnm158 = arg1
                              // I1CMP:start
                              let tnm159 = XATS000_dl1az(tnm158)
                              let tnm201 // cas
                              do {
                                // { // cls
                                if (XATS000_ctgeq(tnm159, XATSCTAG("strmcon_vt_nil", 0))) { // gpt
                                  let tnm160 = tnm159
                                  tnm201 = XATSBOOL(true)
                                  break // cls
                                } // gpt
                                // } // cls
                                // { // cls
                                if (XATS000_ctgeq(tnm159, XATSCTAG("strmcon_vt_cons", 1))) { // gpt
                                  let tnm161 = tnm159
                                  let tnm200 // let
                                  { // let
                                    // I1Dvaldclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(9189(line=710,offs=3)--9222(line=711,offs=30)))
                                    // I1VALDCL
                                    XATS000_patck(true)
                                    let tnm162
                                    // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(8286(line=633,offs=1)--8364(line=637,offs=4)))
                                    let tnm191 = function (arg1) { // timp: forall0$test(67)
                                      let tnm163 = arg1
                                      // I1CMP:start
                                      let tnm190 // let
                                      { // let
                                        // I1Dvaldclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(8322(line=636,offs=1)--8352(line=636,offs=31)))
                                        // I1VALDCL
                                        XATS000_patck(true)
                                        let tnm164
                                        // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(3799(line=302,offs=1)--3929(line=311,offs=4)))
                                        let tnm188 = function (arg1) { // timp: foreach0$work(71)
                                          let tnm165 = arg1
                                          // I1CMP:start
                                          let tnm187 // let
                                          { // let
                                            // I1Dvaldclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(3836(line=305,offs=1)--3865(line=305,offs=30)))
                                            // I1VALDCL
                                            XATS000_patck(true)
                                            let tnm166
                                            // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/unsafex.dats)@(160(line=12,offs=1)--294(line=22,offs=2)))
                                            let tnm169
                                            let tnm168 // let
                                            { // let
                                              // I1Dextern(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/unsafex.dats)@(223(line=17,offs=1)--292(line=21,offs=31)))
                                              // LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/unsafex.dats)@(231(line=18,offs=1)--292(line=21,offs=31))
                                              // I1FUNDCL
                                              // XATS2JS_UN_p2tr_get_234
                                                // FJARGdarg($list(I1BNDcons(I1TNM(167);I0Pvar(p0(4876));$list(@(p0(4876),I1Vtnm(I1TNM(167)))))))
                                                // I1CMP:start
                                                // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_UN_p2tr_get);G1Nlist($list())) // I1CMP:return
                                              tnm168 = XATS2JS_UN_p2tr_get
                                            } // endlet
                                            tnm169 = tnm168
                                            let tnm170 = XATSDAPP(tnm169(tnm142))
                                            tnm166 = tnm170
                                            // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/unsafex.dats)@(315(line=24,offs=1)--459(line=35,offs=2)))
                                            let tnm174
                                            let tnm173 // let
                                            { // let
                                              // I1Dextern(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/unsafex.dats)@(378(line=29,offs=1)--457(line=34,offs=36)))
                                              // LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/unsafex.dats)@(386(line=30,offs=1)--457(line=34,offs=36))
                                              // I1FUNDCL
                                              // XATS2JS_UN_p2tr_set_389
                                                // FJARGdarg($list(I1BNDcons(I1TNM(171);I0Pvar(p0(4878));$list(@(p0(4878),I1Vtnm(I1TNM(171))))),I1BNDcons(I1TNM(172);I0Pvar(x0(4879));$list(@(x0(4879),I1Vtnm(I1TNM(172)))))))
                                                // I1CMP:start
                                                // I1CMP(ival):I1Vextnam(T_DLR_EXTNAM();I1Vvar(XATS2JS_UN_p2tr_set);G1Nlist($list())) // I1CMP:return
                                              tnm173 = XATS2JS_UN_p2tr_set
                                            } // endlet
                                            tnm174 = tnm173
                                            // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(11126(line=842,offs=1)--11207(line=847,offs=28)))
                                            let tnm184 = function (arg1, arg2) { // timp: foldl0$fopr(75)
                                              let tnm175 = arg1
                                              let tnm176 = arg2
                                              // I1CMP:start
                                              // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gnum000.dats)@(980(line=88,offs=1)--1018(line=90,offs=23)))
                                              let tnm179
                                              // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gint000.dats)@(2658(line=116,offs=1)--2701(line=117,offs=35)))
                                              let tnm178
                                              // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/basics0.dats)@(8033(line=531,offs=1)--8091(line=532,offs=50)))
                                              let tnm177
                                              tnm177 = XATS2JS_gint_mul_sint_sint
                                              tnm178 = tnm177
                                              tnm179 = tnm178
                                              // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(14723(line=1148,offs=1)--14758(line=1149,offs=27)))
                                              let tnm181 = function (arg1) { // timp: map0$fopr(30)
                                                let tnm180 = arg1
                                                // I1CMP:start
                                                // I1CMP:return:tnm180
                                                return tnm180
                                              } // endtimp(map0$fopr(30))
                                              let tnm182 = XATSDAPP(tnm181(tnm176))
                                              let tnm183 = XATSDAPP(tnm179(tnm175, tnm182))
                                              // I1CMP:return:tnm183
                                              return tnm183
                                            } // endtimp(foldl0$fopr(75))
                                            let tnm185 = XATSDAPP(tnm184(tnm166, tnm165))
                                            let tnm186 = XATSDAPP(tnm174(tnm142, tnm185))
                                            tnm187 = tnm186
                                          } // endlet
                                          // I1CMP:return:tnm187
                                          return tnm187
                                        } // endtimp(foreach0$work(71))
                                        let tnm189 = XATSDAPP(tnm188(tnm163))
                                        tnm164 = tnm189
                                        tnm190 = XATSBOOL(true)
                                      } // endlet
                                      // I1CMP:return:tnm190
                                      return tnm190
                                    } // endtimp(forall0$test(67))
                                    let tnm192 = XATSDAPP(tnm191(XATSP1CN("strmcon_vt_cons", tnm161[0+1])))
                                    tnm162 = tnm192
                                    let tnm199 // ift
                                    if (tnm162) // ift
                                    {
                                      let tnm193 = XATSDAPP(loop_9074(XATSP1CN("strmcon_vt_cons", tnm161[1+1])))
                                      tnm199 = tnm193
                                    } else {
                                      // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(25297(line=1961,offs=1)--25349(line=1963,offs=37)))
                                      let tnm197
                                      // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(1792(line=150,offs=1)--1842(line=152,offs=31)))
                                      let tnm196 = function (arg1) { // timp: strm_vt_free(1494)
                                        let tnm194 = arg1
                                        // I1CMP:start
                                        // let tnm195 = I1INSfree(I1Vtnm(I1TNM(194)))
                                        // I1CMP:return:tnm195
                                        return // tnm195
                                      } // endtimp(strm_vt_free(1494))
                                      tnm197 = tnm196
                                      let tnm198 = XATSDAPP(tnm197(XATSP1CN("strmcon_vt_cons", tnm161[1+1])))
                                      tnm199 = XATSBOOL(false)
                                    } // end(if)
                                    tnm200 = tnm199
                                  } // endlet
                                  tnm201 = tnm200
                                  break // cls
                                } // gpt
                                // } // cls
                                XATS000_casef()
                              } while (false) // end(do)
                              // I1CMP:return:tnm201
                              return tnm201
                            } // endfun(loop_9074)
                            let tnm202 = XATSDAPP(loop_9074(tnm157))
                            tnm203 = tnm202
                          } // endlet
                          // I1CMP:return:tnm203
                          return tnm203
                        } // endtimp(strm_vt_forall0(1520))
                        // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(25646(line=1985,offs=1)--25718(line=1988,offs=41)))
                        let tnm207
                        // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(4648(line=368,offs=1)--4697(line=370,offs=30)))
                        let tnm206 = function (arg1) { // timp: strm_vt_strmize0(1503)
                          let tnm205 = arg1
                          // I1CMP:start
                          // I1CMP:return:tnm205
                          return tnm205
                        } // endtimp(strm_vt_strmize0(1503))
                        tnm207 = tnm206
                        let tnm208 = XATSDAPP(tnm207(tnm156))
                        let tnm209 = XATSDAPP(tnm204(tnm208))
                        // I1CMP:return:tnm209
                        return tnm209
                      } // endtimp(glseq_forall0(1638))
                      let tnm211 = XATSDAPP(tnm210(tnm150))
                      tnm212 = tnm211
                    } // endlet
                    tnm151 = tnm212
                    tnm213 = []
                  } // endlet
                  // I1CMP:return:tnm213
                  return tnm213
                } // endtimp(glseq_foreach0(1641))
                let tnm215 = XATSDAPP(tnm214(tnm139))
                tnm216 = tnm215
              } // endlet
              tnm143 = tnm216
              let tnm217 = XATSFLAT(tnm141)
              tnm218 = tnm217
            } // endlet
            // I1CMP:return:tnm218
            return tnm218
          } // endtimp(glseq_foldl0(1630))
          // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/gseq000_vt.dats)@(10752(line=811,offs=1)--10791(line=813,offs=26)))
          let tnm225
          // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gnum000.dats)@(591(line=52,offs=1)--623(line=54,offs=17)))
          let tnm224
          // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gnum000.dats)@(161(line=15,offs=1)--198(line=17,offs=22)))
          let tnm223 = function () { // timp: g_1(181)
            // I1CMP:start
            // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gint000.dats)@(1698(line=59,offs=1)--1724(line=60,offs=18)))
            let tnm221 = function (arg1) { // timp: g_si(186)
              let tnm220 = arg1
              // I1CMP:start
              // I1CMP:return:tnm220
              return tnm220
            } // endtimp(g_si(186))
            let tnm222 = XATSDAPP(tnm221(XATSINT1(1)))
            // I1CMP:return:tnm222
            return tnm222
          } // endtimp(g_1(181))
          tnm224 = tnm223
          tnm225 = tnm224
          let tnm226 = XATSDAPP(tnm225())
          let tnm227 = XATSDAPP(tnm219(tnm134, tnm226))
          tnm228 = tnm227
        } // endlet
        // I1CMP:return:tnm228
        return tnm228
      } // endtimp(glseq_map0_mul0(1674))
      let tnm230 = XATSDAPP(tnm229(tnm132))
      tnm231 = tnm230
    } // endlet
    // I1CMP:return:tnm231
    return tnm231
  } // endtimp(strm_vt_mul0(1533))
  // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(2021(line=166,offs=1)--2141(line=173,offs=33)))
  let tnm243 = function (arg1) { // timp: strm_vt_tail0(1497)
    let tnm233 = arg1
    // I1CMP:start
    let tnm234 = XATS000_dl1az(tnm233)
    let tnm242 // cas
    do {
      // { // cls
      if (XATS000_ctgeq(tnm234, XATSCTAG("strmcon_vt_cons", 1))) { // gpt
        let tnm235 = tnm234
        let tnm241 // let
        { // let
          // I1Dvaldclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(2109(line=173,offs=1)--2131(line=173,offs=23)))
          // I1VALDCL
          XATS000_patck(true)
          let tnm236
          // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gbas000.dats)@(190(line=19,offs=1)--223(line=21,offs=18)))
          let tnm239 = function (arg1) { // timp: g_free(7)
            let tnm237 = arg1
            // I1CMP:start
            let tnm238 = XATSTUP0([])
            // I1CMP:return:tnm238
            return tnm238
          } // endtimp(g_free(7))
          let tnm240 = XATSDAPP(tnm239(XATSP1CN("strmcon_vt_cons", tnm235[0+1])))
          tnm236 = tnm240
          tnm241 = XATSP1CN("strmcon_vt_cons", tnm235[1+1])
        } // endlet
        tnm242 = tnm241
        break // cls
      } // gpt
      // } // cls
      XATS000_casef()
    } while (false) // end(do)
    // I1CMP:return:tnm242
    return tnm242
  } // endtimp(strm_vt_tail0(1497))
  // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gint000.dats)@(6198(line=388,offs=1)--6313(line=396,offs=28)))
  let tnm268 = function (arg1) { // timp: gint_strmize_sint(366)
    let tnm244 = arg1
    // I1CMP:start
    // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/basics0.dats)@(6290(line=415,offs=1)--6348(line=416,offs=50)))
    let tnm245
    tnm245 = XATS2JS_gint_lte_sint_sint
    let tnm246 = XATSDAPP(tnm245(tnm244, XATSINT1(0)))
    let tnm267 // ift
    if (tnm246) // ift
    {
      // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/VT/strm000_vt.dats)@(1177(line=100,offs=1)--1242(line=105,offs=21)))
      let tnm249 = function () { // timp: strm_vt_nil(1487)
        // I1CMP:start
        let tnm248 = function (tlaz) { // l1azy
          // I1CMP:start
          let tnm247 = XATSCAPP("strmcon_vt_nil", [0])
          // I1CMP:return:tnm247
          return tnm247
        } // endfun(l1azy)
        // I1CMP:return:tnm248
        return tnm248
      } // endtimp(strm_vt_nil(1487))
      let tnm250 = XATSDAPP(tnm249())
      tnm267 = tnm250
    } else {
      // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gint000.dats)@(5883(line=359,offs=1)--6137(line=384,offs=2)))
      let tnm265 = function (arg1) { // timp: gint_strmize_nint(365)
        let tnm251 = arg1
        // I1CMP:start
        let tnm264 // let
        { // let
          // I1Dfundclist(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/gint000.dats)@(5955(line=366,offs=1)--6135(line=383,offs=2)))
          // I1FUNDCL
          function auxmain_5958(arg1, arg2)
          { // fun
            let tnm252 = arg1
            let tnm253 = arg2
            // I1CMP:start
            let tnm262 = function (tlaz) { // l1azy
              // I1CMP:start
              // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/basics0.dats)@(6638(line=438,offs=1)--6696(line=439,offs=50)))
              let tnm254
              tnm254 = XATS2JS_gint_gte_sint_sint
              let tnm255 = XATSDAPP(tnm254(tnm253, tnm252))
              let tnm261 // ift
              if (tnm255) // ift
              {
                let tnm256 = XATSCAPP("strmcon_vt_nil", [0])
                tnm261 = tnm256
              } else {
                // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/basics0.dats)@(3846(line=262,offs=1)--3896(line=263,offs=42)))
                let tnm257
                tnm257 = XATS2JS_gint_succ_sint
                let tnm258 = XATSDAPP(tnm257(tnm253))
                let tnm259 = XATSDAPP(auxmain_5958(tnm252, tnm258))
                let tnm260 = XATSCAPP("strmcon_vt_cons", [1, tnm253, tnm259])
                tnm261 = tnm260
              } // end(if)
              // I1CMP:return:tnm261
              return tnm261
            } // endfun(l1azy)
            // I1CMP:return:tnm262
            return tnm262
          } // endfun(auxmain_5958)
          let tnm263 = XATSDAPP(auxmain_5958(tnm251, XATSINT1(0)))
          tnm264 = tnm263
        } // endlet
        // I1CMP:return:tnm264
        return tnm264
      } // endtimp(gint_strmize_nint(365))
      let tnm266 = XATSDAPP(tnm265(tnm244))
      tnm267 = tnm266
    } // end(if)
    // I1CMP:return:tnm267
    return tnm267
  } // endtimp(gint_strmize_sint(366))
  // T1IMPallx(LCSRCsome1(/home/hwxi/Research/ATS-Xanadu/srcgen1/prelude/DATS/CATS/JS/basics0.dats)@(7706(line=510,offs=1)--7764(line=511,offs=50)))
  let tnm269
  tnm269 = XATS2JS_gint_add_sint_sint
  let tnm270 = XATSDAPP(tnm269(tnm131, XATSINT1(1)))
  let tnm271 = XATSDAPP(tnm268(tnm270))
  let tnm272 = XATSDAPP(tnm243(tnm271))
  let tnm273 = XATSDAPP(tnm232(tnm272))
  // I1CMP:return:tnm273
  return tnm273
} // endfun(fact1_mul_tail_1564)

console.log("fact1_mul_tail(10) =", fact1_mul_tail_1564(10))

////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
