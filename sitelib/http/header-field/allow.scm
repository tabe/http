(library (http header-field allow)
  (export Allow)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http method))

  ;;; 14.7 Allow

  (define Allow (seq (string->rule "Allow") (char->rule #\:) (num* Method)))

)
