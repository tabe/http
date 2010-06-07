(library (http header-field proxy-authorization)
  (export Proxy-Authorization)
  (import (rnrs (6))
          (http abnf)
          (only (http authentication basic-rule) credentials))

  ;;; 14.34 Proxy-Authorization

  ;; Proxy-Authorization     = "Proxy-Authorization" ":" credentials
  (define Proxy-Authorization
    (seq (string->rule "Proxy-Authorization") (char->rule #\:) *LWS credentials))

)
