;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; HX-2026-07-03:
;; ATS3-XANADU/srcgen2/xats2cm/srcgen1
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define XATSTOP0 #f)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
(define (XATSCNUL) 0)
(define (XATSCHR1) 0)
;;
(define (XATSINT0 i0) i0)
(define (XATSINT1 i0) i0)
;;
(define (XATSBTF0 b0) b0)
(define (XATSBOOL b0) b0)
;;
(define (XATSCHR0 ch)
  (char->integer (string-ref ch 0)))
(define (XATSCHR2 ch)
  (char->integer (string-ref ch 0)))
;;
(define (XATSCHR3 ch)
  (let* ((x1 (string-ref ch 1))
         (c1 (char->integer x1)))
    (cond
      ;; ord('0') = 48
      ;; ord('7') = 55

      ;; e.g. "'(" or "')"
      ((< c1 48)
       c1)

      ((> c1 55)
       c1)

      ;; "'ddd" : octal
      (else
       (let loop ((i1 2)
                  (d1 (- c1 48)))
         (if (>= i1 (string-length ch))
             d1
             (let ((x1 (string-ref ch i1)))
               (if (char=? x1 #\')
                   d1
                   (loop (+ i1 1)
                         (+ (* 8 d1)
                            (- (char->integer x1) 48)))))))))))
;;
(define (XATSFLT0 f0) f0)
(define (XATSFLT1 f0) f0)
;;
(define (XATSSTR0 cs) cs)
(define (XATSSTRN cs) cs)
;;
(define
 (XATSSFLT sf) (string->number sf))
(define
 (XATSDFLT df) (string->number df))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.

def XATSDAPP(dapp): return dapp
def XATSCAPP(_, capp): return capp
def XATSCAST(_, args): return args[0]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
def XATSPFLT(pflt): return pflt
def XATSPROJ(proj): return proj
def XATSP0RJ(p0rj): return p0rj
def XATSP1RJ(_, p1rj): return p1rj
def XATSP1CN(_, p1cn): return p1cn
;;
def XATSPCON(pcon, argi): return pcon[argi+1]
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
def XATSTRCD(knd0): return knd0
;;
def XATSTUP0(tpl0): return tpl0
def XATSTUP1(knd0, tpl1): return tpl1
def XATSRCD2(knd0, rcd2): return rcd2
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
def XATSROOT(x): return [0, x]
def XATSLPFT(i, x): return [1+0, x, i]
def XATSLPBX(i, x): return [1+1, x, i]
def XATSLPCN(i, x): return [1+2, x, i+1]
;;
def XATSVAR0(    ): return XATSROOT([None])
def XATSVAR1(init): return XATSROOT([init])
;;
def XATSADDR(addr): return addr ;; HX: no-op
def XATSFLAT(addr): return XATS000_lvget(addr)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
def XATSCTAG(_, t): return t
;;
def XATS000_inteq(x, y): return (x == y)
def XATS000_btfeq(x, y): return (x == y)
def XATS000_chreq(x, y): return (x == y)
;;
def XATS000_streq(x, y): return (x == y)
;;
def XATS000_ctgeq(v, t): return (v[0] == t)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;
;; the end of
;; [ATS3-XANADU/srcgen2/xats2py/srcgen1/xshared/runtime/xats2py_py1emit.py]
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;.
