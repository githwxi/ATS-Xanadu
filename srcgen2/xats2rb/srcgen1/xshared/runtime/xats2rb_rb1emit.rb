########################################################################
## Runtime helpers used by Ruby code emitted by xats2rb.
########################################################################

XATSVOID = nil unless defined?(XATSVOID)
XATSTOP0 = nil unless defined?(XATSTOP0)

def XATSCNUL; 0; end
def XATSCHR1; 0; end
def XATSINT0(x); x; end
def XATSINT1(x); x; end
def XATSBTF0(x); x; end
def XATSBOOL(x); x; end
def XATSCHR0(s); s[0].ord; end
def XATSCHR2(s); s[0].ord; end
def XATSCHR3(s)
  c = s[1].ord
  return c if c < 48 || c > 55

  i = 2
  value = c - 48
  while i < s.length && s[i] != "'"
    value = 8 * value + s[i].ord - 48
    i += 1
  end
  value
end
def XATSFLT0(x); x; end
def XATSFLT1(x); x; end
def XATSSTR0(x); x; end
def XATSSTRN(x); x; end
def XATSSFLT(x); x.to_f; end
def XATSDFLT(x); x.to_f; end

def XATSDAPP(x); x; end
def XATSCAPP(_con, args); args; end
def XATSCAST(_con, args); args[0]; end
def XATSPFLT(x); x; end
def XATSPROJ(x); x; end
def XATSP0RJ(x); x; end
def XATSP1RJ(_x, y); y; end
def XATSP1CN(_x, y); y; end
def XATSPCON(con, i); con[i + 1]; end
def XATSTRCD(x); x; end
def XATSTUP0(x); x; end
def XATSTUP1(_k, x); x; end
def XATSRCD2(_k, x); x; end

def XATSROOT(x); [0, x]; end
def XATSLPFT(i, x); [1, x, i]; end
def XATSLPBX(i, x); [2, x, i]; end
def XATSLPCN(i, x); [3, x, i + 1]; end
def XATSVAR0; XATSROOT([nil]); end
def XATSVAR1(x); XATSROOT([x]); end
def XATSADDR(x); x; end
def XATSFLAT(x); XATS000_lvget(x); end
def XATSCTAG(_x, tag); tag; end

def XATS000_inteq(x, y); x == y; end
def XATS000_btfeq(x, y); x == y; end
def XATS000_chreq(x, y); x == y; end
def XATS000_streq(x, y); x == y; end
def XATS000_ctgeq(x, tag); x[0] == tag; end

def XATS2RB_optn_nil; [0]; end
def XATS2RB_optn_cons(x); [1, x]; end
def XATS2RB_list_nil; [0]; end
def XATS2RB_list_cons(x, xs); [1, x, xs]; end
def XATS2RB_optn_vt_nil; [0]; end
def XATS2RB_optn_vt_cons(x); [1, x]; end
def XATS2RB_list_vt_nil; [0]; end
def XATS2RB_list_vt_cons(x, xs); [1, x, xs]; end

def XATS000_casef; raise 'XATS000_casef'; end
def XATS000_cfail; raise 'XATS000_cfail'; end
def XATS000_patck(ok); raise 'XATS000_patck' unless ok; nil; end
def XATS000_fold(_x); nil; end
def XATS000_free(_x); nil; end
def XATS000_dp2tr(x); XATS000_lvget(x); end

def XATS000_l0azy(f); [0, f]; end
def XATS000_dl0az(x)
  return x[1] if x[0] > 0

  x[0] = 1
  x[1] = x[1].call
end
def XATS000_l1azy(f); f; end
def XATS000_dl1az(f); f.call(1); end
def XATS000_assgn(lvalue, value); XATS000_lvset(lvalue, value); end

def XATS000_lvget(lvalue)
  case lvalue[0]
  when 0 then lvalue[1][0]
  when 1 then XATS000_lvget(lvalue[1])[lvalue[2]]
  when 2, 3 then lvalue[1][lvalue[2]]
  end
end
def XATS000_lvset(lvalue, value)
  case lvalue[0]
  when 0
    lvalue[1][0] = value
  when 1
    XATS000_lvset(lvalue[1], XATS000_ftset(XATS000_lvget(lvalue[1]), lvalue[2], value))
  when 2, 3
    lvalue[1][lvalue[2]] = value
  end
  nil
end
def XATS000_ftset(tuple, index, value)
  copy = tuple.dup
  copy[index] = value
  copy
end
class X2RBExcptn < StandardError
  attr_reader :args

  def initialize(args)
    @args = args
    super('XATS exception')
  end
end
def XATS000_raise(value); raise X2RBExcptn.new(value); end

########################################################################
