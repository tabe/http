(library (http header-field basic-rule)
  (export pseudonym)
  (import (rnrs (6))
          (http abnf)
          (only (http basic-rule) token))

  ;; pseudonym         = token
  (define pseudonym token)

)
