(library (http header-field content-length)
  (export Content-Length)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule))

  ;;; 14.13 Content-Length

  (define Content-Length
    (seq (string->rule "Content-Length") (char->rule #\:) *LWS (rep+ DIGIT)))

)
