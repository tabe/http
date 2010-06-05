(library (http header-field proxy-authenticate)
  (export Proxy-Authenticate)
  (import (rnrs (6))
          (http abnf)
          (only (http authentication basic-rule) challenge))

  ;;; 14.33 Proxy-Authenticate

  (define Proxy-Authenticate
    (seq (string->rule "Proxy-Authenticate") (char->rule #\:) (num+ challenge)))

)
