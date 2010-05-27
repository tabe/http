(library (http uri port)
  (export port)
  (import (rnrs (6))
          (http abnf))

  ;;; 3.2.3.  Port

  (define port (rep* DIGIT))

)
