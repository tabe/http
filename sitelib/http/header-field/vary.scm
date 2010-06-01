(library (http header-field vary)
  (export Vary)
  (import (rnrs (6))
          (http abnf)
          (only (http message-header) field-name))

  ;;; 14.44 Vary

  ;; Vary  = "Vary" ":" ( "*" | 1#field-name )
  (define Vary
    (seq (string->rule "Vary") (char->rule #\:) *LWS
         (bar (char->rule #\*) (num+ field-name))))

)
