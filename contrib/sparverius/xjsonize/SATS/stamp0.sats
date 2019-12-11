#define XATS_targetloc "./../../../../srcgen/xats"
#staload STM = "{$XATS}/SATS/stamp0.sats"

#staload "./json.sats"

fun jsonize_stamp : jsonize_type($STM.stamp)
overload jsonize with jsonize_stamp

fun labify_stamp : labify_type($STM.stamp)
overload labify with labify_stamp
