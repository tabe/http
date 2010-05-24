(library (http header-field content-encoding)
  (export Content-Encoding)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http content-coding))

  ;;; 14.11 Content-Encoding

  (define Content-Encoding
    (seq (string->rule "Content-Encoding") (char->rule #\:) (num+ content-coding)))

)
