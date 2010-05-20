(library (http version)
  (export HTTP-Version)
  (import (rnrs (6))
          (http abnf))

 (define HTTP-Version
    (let ((*digit (rep+ DIGIT)))
      (seq (string->rule "HTTP/")
           *digit
           (char->rule #\.)
           *digit)))

)
