(library (http status-line)
  (export Status-Line)
  (import (rnrs (6))
          (http abnf)
          (only (http status-code) Status-Code Reason-Phrase)
          (only (http version) HTTP-Version))

  ;;; 6.1 Status-Line

  ;; Status-Line = HTTP-Version SP Status-Code SP Reason-Phrase CRLF
  (define Status-Line (seq HTTP-Version SP Status-Code SP Reason-Phrase CRLF))

)
