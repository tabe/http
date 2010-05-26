(library (http header-field host)
  (export Host)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule))

  ;;; 14.23 Host

  (define host
    (rep+ (bar ALPHA DIGIT (char->rule #\.) (char->rule #\-)))) ; FIXME

  (define port (rep+ DIGIT)) ; FIXME

  (define Host
    (seq (string->rule "Host") (char->rule #\:) *LWS ; implicit *LWS
         host (opt (seq (char->rule #\:) port))))

)
