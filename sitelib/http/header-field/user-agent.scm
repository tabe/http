(library (http header-field user-agent)
  (export User-Agent)
  (import (rnrs (6))
          (http abnf)
          (only (http basic-rule) comment)
          (only (http product-token) product))

  ;;; 14.43 User-Agent

  ;; User-Agent     = "User-Agent" ":" 1*( product | comment )
  (define User-Agent
    (seq (string->rule "User-Agent") (char->rule #\:) (rep* (seq *LWS (bar product comment)))))

)
