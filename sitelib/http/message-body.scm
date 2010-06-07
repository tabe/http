(library (http message-body)
  (export message-body)
  (import (rnrs (6))
          (http abnf)
          (only (http entity-body) entity-body))

  ;;; 4.3 Message Body

  ;; message-body = entity-body
  ;;              | <entity-body encoded as per Transfer-Encoding>
  (define message-body entity-body) ; FIXME

)
