(library (http header-field upgrade)
  (export Upgrade)
  (import (rnrs (6))
          (http abnf)
          (only (http product-token) product))

  ;;; 14.42 Upgrade

  ;; Upgrade        = "Upgrade" ":" 1#product
  (define Upgrade (seq (string->rule "Upgrade") (char->rule #\:) (num+ product)))

)
