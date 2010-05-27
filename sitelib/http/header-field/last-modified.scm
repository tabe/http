(library (http header-field last-modified)
  (export Last-Modified)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http date-time))

  ;;; 14.29 Last-Modified

  (define Last-Modified
    (seq (string->rule "Last-Modified") (char->rule #\:) *LWS HTTP-date))

)
