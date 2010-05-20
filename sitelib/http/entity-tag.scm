(library (http entity-tag)
  (export entity-tag)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule))

  ;;; 3.11 Entity Tags
  (define weak (string->rule "W/"))

  (define opaque-tag quoted-string)

  (define entity-tag (seq (opt weak) opaque-tag))

)

