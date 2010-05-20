(library (http product-token)
  (export product)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule))

  ;;; 3.8 Product Tokens
  (define product-version token)

  (define product (seq token (opt (seq (char->rule #\/) product-version))))

)

