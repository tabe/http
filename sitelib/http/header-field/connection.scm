(library (http header-field connection)
  (export Connection)
  (import (rnrs (6))
          (http abnf)
          (only (http basic-rule) token))

  ;;; 14.10 Connection

  (define connection-token token)

  (define Connection
    (seq (string->rule "Connection") (char->rule #\:) (num+ connection-token)))

)
