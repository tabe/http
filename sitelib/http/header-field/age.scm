(library (http header-field age)
  (export Age)
  (import (rnrs (6))
          (http abnf)
          (http date-time))

  ;;; 14.6 Age

  (define age-value delta-seconds)

  (define Age
    (seq (string->rule "Age") (char->rule #\:) *LWS age-value))

)
