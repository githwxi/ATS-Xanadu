fun read_file(path: strn): strn =
  XATS2JS_NODE_readFileSync(path)
    where
    {
      #extern fun XATS2JS_NODE_readFileSync(strn): strn = $extnam()
    }
