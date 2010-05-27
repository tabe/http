(library (http uri fragment)
  (export fragment)
  (import (rnrs (6))
          (http abnf)
          (only (http uri basic-rule) pchar))

  ;;; 3.5.  Fragment

  ;; fragment    = *( pchar / "/" / "?" )
  (define fragment (rep* (bar pchar (char->rule #\/) (char->rule #\?))))

)
