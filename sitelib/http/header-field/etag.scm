(library (http header-field etag)
  (export ETag)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http entity-tag))

  ;;; 14.19 ETag

  (define ETag (seq (string->rule "ETag") (char->rule #\:) *LWS entity-tag))

)
