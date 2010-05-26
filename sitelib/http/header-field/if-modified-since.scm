(library (http header-field if-modified-since)
  (export If-Modified-Since)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http date-time))

  ;;; 14.25 If-Modified-Since

  (define If-Modified-Since
    (seq (string->rule "If-Modified-Since") (char->rule #\:) *LWS HTTP-date))

)
