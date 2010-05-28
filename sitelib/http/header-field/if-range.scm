(library (http header-field if-range)
  (export If-Range)
  (import (rnrs (6))
          (http abnf)
          (http date-time)
          (http entity-tag))

  ;;; 14.27 If-Range

  (define If-Range
    (seq (string->rule "If-Range") (char->rule #\:) *LWS ; implicit *LWS
         (bar entity-tag HTTP-date)))

)
