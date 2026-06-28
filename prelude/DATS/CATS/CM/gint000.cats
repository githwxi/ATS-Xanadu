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
;; Sun Jun 28 10:15:28 AM EDT 2026
;; Authoremail: gmhwxiATgmailDOTcom
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATS2CM_sint_neg i1) (- i1))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATS2CM_sint_lt_sint i1 i2) (< i1 i2))
(define (XATS2CM_sint_gt_sint i1 i2) (> i1 i2))
(define (XATS2CM_sint_eq_sint i1 i2) (= i1 i2))
;;
(define (XATS2CM_sint_lte_sint i1 i2) (<= i1 i2))
(define (XATS2CM_sint_gte_sint i1 i2) (>= i1 i2))
(define (XATS2CM_sint_neq_sint i1 i2) (not (= i1 i2))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATS2CM_sint_add_sint i1 i2) (+ i1 i2))
(define (XATS2CM_sint_sub_sint i1 i2) (- i1 i2))
(define (XATS2CM_sint_mul_sint i1 i2) (* i1 i2))
(define (XATS2CM_sint_div_sint i1 i2) (quotient i1 i2))
(define (XATS2CM_sint_mod_sint i1 i2) (remainder i1 i2))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATS2CM_sint_print i0) (strn_print (number->string i0)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;; end of [ATS3/XANADU_prelude_DATS_CATS_CM_gint000.cats]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
