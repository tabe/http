(library (http entity-body)
  (export entity-body)
  (import (rnrs (6))
          (http abnf))

  ;;; 7.2 Entity Body

  ;; entity-body    = *OCTET
  (define entity-body (rep* OCTET))

)
