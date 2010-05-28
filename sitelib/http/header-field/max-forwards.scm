(library (http header-field max-forwards)
  (export Max-Forwards)
  (import (rnrs (6))
          (http abnf))

  ;;; 14.31 Max-Forwards

  ;; Max-Forwards   = "Max-Forwards" ":" 1*DIGIT
  (define Max-Forwards (seq (string->rule "Max-Forwards") (char->rule #\:) *LWS (rep+ DIGIT)))

)
