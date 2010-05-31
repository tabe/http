(library (http header-field retry-after)
  (export Retry-After)
  (import (rnrs (6))
          (http abnf)
          (only (http date-time) HTTP-date delta-seconds))

  ;;; 14.37 Retry-After

  ;; Retry-After  = "Retry-After" ":" ( HTTP-date | delta-seconds )
  (define Retry-After
    (seq (string->rule "Retry-After") (char->rule #\:) *LWS (bar HTTP-date delta-seconds)))

)
