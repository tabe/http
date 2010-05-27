(library (http uri scheme)
  (export scheme)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule))

  ;;; 3.1.  Scheme

  (define PLUS (char->rule #\+))

  (define MINUS (char->rule #\-))

  (define DOT (char->rule #\.))

  (define scheme
    (seq ALPHA (rep* (bar ALPHA DIGIT PLUS MINUS DOT))))

)
