#impltmp <(*tmp*)> char_make_sint (code: sint): char =
	XATS2JS_char_make_int(code)
    where
    {
      #extern fun XATS2JS_char_make_int(code: sint): char = $extnam()
    }

#impltmp <(*tmp*)> char_make_uint (code: uint): char =
  (XATS2JS_char_make_int(code))
    where
    {
      #extern fun XATS2JS_char_make_int(code: uint): char = $extnam()
    }
