(library (http header-field server)
  (export Server)
  (import (rnrs (6))
          (http abnf)
          (only (http basic-rule) comment)
          (only (http product-token) product))

  ;;; 14.38 Server

  ;; Server         = "Server" ":" 1*( product | comment )
  (define Server
    (seq (string->rule "Server") (char->rule #\:) (rep+ (seq *LWS (bar product comment)))))

)
