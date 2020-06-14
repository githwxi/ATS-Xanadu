absvtype vt

#extern
fun
<a:type>
foo1(x: a): a
#extern
fun
<a:type>
foo2(x: a): a

#symload
foo with foo1 of 10
#symload
foo with foo2 of 20

impltmp
{a:type}
foo2<(a)>(x) = (x : a)

////
impltmp
{a:t0}
foo<a,a>(x) = x
////
impltmp
{a:vt}
foo<a,a>(x) = x

////
absvtype vt
vtypedef vts = list_vt(vt)
////
fun
foo(xs: list(int)) = length<int>(xs)