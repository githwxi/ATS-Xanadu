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
;; Sun Jun 28 09:48:20 AM EDT 2026
;; Authoremail: gmhwxiATgmailDOTcom
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
 (XATS2CM_char_lt c1 c2) (< c1 c2)
(define
 (XATS2CM_char_gt c1 c2) (> c1 c2)
(define
 (XATS2CM_char_eq c1 c2) (= c1 c2)
;;
(define
 (XATS2CM_char_lte c1 c2) (<= c1 c2))
(define
 (XATS2CM_char_gte c1 c2) (>= c1 c2))
(define
 (XATS2CM_char_neq c1 c2) (not (= c1 c2))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
 (XATS2CM_char_sub_char c1 c2) (- c1 c2))
(define
 (XATS2CM_char_add_sint c1 i2) (modulo (+ c1 i2)))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define
 (XATS2CM_char_print c0)
 (XATS2CM_strn_print (string (integer->char c0))))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; HX-2026-01-17:
;; Sat Jan 17 09:51:13 PM EST 2026
;;
(define (XATS2CM_char_make_sint i0) i0)
(define (XATS2CM_sint_make_char ch) ch)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;; end of [ATS3/XANADU_prelude_DATS_CATS_CM_char000.cats]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
