(library (http request-line)
  (export Request-Line)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http method)
          (http request-uri)
          (http version))

  ;;; 5.1 Request-Line

  ;; Request-Line   = Method SP Request-URI SP HTTP-Version CRLF
  (define Request-Line (seq Method SP Request-URI SP HTTP-Version CRLF))

)
