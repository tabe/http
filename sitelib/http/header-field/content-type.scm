(library (http header-field content-type)
  (export Content-Type)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http media-type))

  ;;; 14.17 Content-Type

  (define Content-Type
    (seq (string->rule "Content-Type") (char->rule #\:) *LWS media-type))

)
