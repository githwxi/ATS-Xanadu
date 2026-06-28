;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;                                                                    ;;.
;;                         Applied Type System                        ;;.
;;                                                                    ;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.

;;
;; ATS/Xanadu - Unleashing the Potential of Types!
;; Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
;; All rights reserved
;;
;; ATS is free software;  you can  redistribute it and/or modify it under
;; the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
;; Free Software Foundation; either version 3, or (at  your  option)  any
;; later version.
;; 
;; ATS is distributed in the hope that it will be useful, but WITHOUT ANY
;; WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
;; FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
;; for more details.
;; 
;; You  should  have  received  a  copy of the GNU General Public License
;; along  with  ATS;  see the  file COPYING.  If not, please write to the
;; Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
;; 02110-1301, USA.
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; Author: Hongwei Xi
;; Sun Jun 28 10:31:58 AM EDT 2026
;; Authoremail: gmhwxiATgmailDOTcom
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
 (XATS2CM_dflt_neg df) (- df))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
 (XATS2CM_dflt_abs df) (abs df))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
 (XATS2CM_dflt_sqrt df) (sqrt df)
(define
 (XATS2CM_dflt_cbrt df) (expt df 1.0/3.0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
 (XATS2CM_dflt_lt_dflt f1 f2) (< f1 f2))
(define
 (XATS2CM_dflt_gt_dflt f1 f2) (> f1 f2))
(define
 (XATS2CM_dflt_eq_dflt f1 f2) (= f1 f2))
;;
(define
 (XATS2CM_dflt_lte_dflt f1 f2) (<= f1 f2))
(define
 (XATS2CM_dflt_gte_dflt f1 f2) (>= f1 f2))
(define
 (XATS2CM_dflt_neq_dflt f1 f2) (not (= f1 f2)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
 (XATS2CM_dflt_add_dflt f1 f2) (+ f1 f2))
(define
 (XATS2CM_dflt_sub_dflt f1 f2) (- f1 f2))
(define
 (XATS2CM_dflt_mul_dflt f1 f2) (* f1 f2))
;;
(define
 (XATS2CM_dflt_div_dflt f1 f2) (/ f1 f2))
(define
 (XATS2CM_dflt_mod_dflt f1 f2) (- f1 (* f2 (floor (/ f1 f2)))))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATS2CM_dflt_ceil df) (ceiling df)
(define (XATS2CM_dflt_floor df) (floor df)
(define (XATS2CM_dflt_round df) (round df)
(define (XATS2CM_dflt_trunc df) (truncate df)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;; end of [ATS3/XANADU_prelude_DATS_CATS_CM_gflt000.cats]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
