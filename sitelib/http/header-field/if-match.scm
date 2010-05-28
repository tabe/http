(library (http header-field if-match)
  (export If-Match)
  (import (rnrs (6))
          (http abnf)
          (http entity-tag))

  ;;; 14.24 If-Match

  (define If-Match
    (seq (string->rule "If-Match") (char->rule #\:) *LWS ; implicit *LWS
         (bar (char->rule #\*) (num+ entity-tag))))

)
