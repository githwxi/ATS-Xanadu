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
#|
def XATS2CM_bool_lt(b1, b2):
  return (b1 < b2) ;; HX: lt
def XATS2CM_bool_gt(b1, b2):
  return (b1 > b2) ;; HX: gt
def XATS2CM_bool_eq(b1, b2):
  return (b1 == b2) ;; HX: eq
def XATS2CM_bool_lte(b1, b2):
  return (b1 <= b2) ;; HX: lte
def XATS2CM_bool_gte(b1, b2):
  return (b1 >= b2) ;; HX: gte
def XATS2CM_bool_neq(b1, b2):
  return (b1 != b2) ;; HX: neq
|#
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATS2CM_bool_lt b1 b2)
  (if b1 #f b2))
(define (XATS2CM_bool_gt b1 b2)
  (if b2 #f b1))
(define (XATS2CM_bool_eq b1 b2)
  (if b1 b2 (not b2)))
;;
(define (XATS2CM_bool_lte b1 b2)
  (if b1 b2 #t))
(define (XATS2CM_bool_gte b1 b2)
  (if b2 b1 #t))
(define (XATS2CM_bool_neq b1 b2)
  (if b1 (not b2) b2))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;; end of [ATS3/XANADU_prelude_DATS_CATS_CM_bool000.cats]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
