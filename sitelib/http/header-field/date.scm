(library (http header-field date)
  (export Date)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http date-time))

  ;;; 14.18 Date

  (define Date (seq (string->rule "Date") (char->rule #\:) *LWS HTTP-date))

)

