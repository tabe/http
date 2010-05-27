(library (http uri port)
  (export port)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule))

  (define port (rep* DIGIT))

)
