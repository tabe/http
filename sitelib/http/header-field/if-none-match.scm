(library (http header-field if-none-match)
  (export If-None-Match)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http entity-tag))

  ;;; 14.26 If-None-Match

  (define If-None-Match
    (seq (string->rule "If-None-Match") (char->rule #\:) *LWS ; implicit *LWS
         (bar (char->rule #\*) (num+ entity-tag))))

)
