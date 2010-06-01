(library (http header-field trailer)
  (export Trailer)
  (import (rnrs (6))
          (http abnf)
          (only (http message-header) field-name))

  ;;; 14.40 Trailer

  ;; Trailer  = "Trailer" ":" 1#field-name
  (define Trailer (seq (string->rule "Trailer") (char->rule #\:) (num+ field-name)))

)
