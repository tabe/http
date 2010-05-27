(library (http header-field location)
  (export Location)
  (import (rnrs (6))
          (http abnf)
          (rename (http uri) (absolute-URI absoluteURI)))

  ;;; 14.22 Location

  (define Location (seq (string->rule "Location") (char->rule #\:) *LWS absoluteURI))

)
