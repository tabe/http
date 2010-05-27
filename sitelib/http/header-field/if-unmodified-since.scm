(library (http header-field if-unmodified-since)
  (export If-Unmodified-Since)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http date-time))

  ;;; 14.28 If-Unmodified-Since

  (define If-Unmodified-Since
    (seq (string->rule "If-Unmodified-Since") (char->rule #\:) *LWS HTTP-date))

)
