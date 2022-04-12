(*
#include
"prelude/xparam.hats"
#staload
"prelude/basics.sats"
#staload
"prelude/fixity.sats"
#staload
"prelude/excptn.sats"
#staload
"prelude/xsetup.sats"
#staload
"prelude/SATS/gord.sats"
#staload
"prelude/SATS/gint.sats"
*)


fun fact(x: int): int =
if x <= 0 then 1 else x * fact(x-1)
