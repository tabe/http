(library (http uri query)
  (export query)
  (import (rnrs (6))
          (http abnf)
          (only (http uri basic-rule) pchar))

  ;;; 3.1.  Query

  ;; query       = *( pchar / "/" / "?" )
  (define query (rep* (bar pchar (char->rule #\/) (char->rule #\?))))

)
