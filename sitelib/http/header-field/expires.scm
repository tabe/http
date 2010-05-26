(library (http header-field expires)
  (export Expires)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http date-time))

  ;;; 14.21 Expires

  (define Expires (seq (string->rule "Expires") (char->rule #\:) *LWS HTTP-date))

)
