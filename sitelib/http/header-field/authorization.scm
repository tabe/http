(library (http header-field authorization)
  (export Authorization)
  (import (rnrs (6))
          (http abnf)
          (only (http authentication basic-rule) credentials))

  ;;; 14.8 Authorization

  ;; Authorization  = "Authorization" ":" credentials
  (define Authorization
    (seq (string->rule "Authorization") (char->rule #\:) *LWS credentials))

)
