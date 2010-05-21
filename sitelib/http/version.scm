(library (http version)
  (export HTTP-Version)
  (import (rnrs (6))
          (http abnf))

  ;;; 3.1 HTTP Version

  (define HTTP-Version
    (let ((*digit (rep+ DIGIT)))
      (seq (string->rule "HTTP/")
           *digit
           (char->rule #\.)
           *digit)))

)
