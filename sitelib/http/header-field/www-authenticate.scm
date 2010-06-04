(library (http header-field www-authenticate)
  (export WWW-Authenticate)
  (import (rnrs (6))
          (http abnf)
          (only (http authentication basic-rule) challenge))

  ;;; 14.47 WWW-Authenticate

  (define WWW-Authenticate
    (seq (string->rule "WWW-Authenticate") (char->rule #\:) (num+ challenge)))

)
