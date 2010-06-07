(library (http response)
  (export Response)
  (import (rnrs (6))
          (http abnf)
          (only (http entity-header-field) entity-header)
          (only (http general-header-field) general-header)
          (only (http response-header-field) response-header)
          (only (http message-body) message-body)
          (only (http status-line) Status-Line))

  ;;; 6 Response

  ;; Response      = Status-Line               ; Section 6.1
  ;;                 *(( general-header        ; Section 4.5
  ;;                  | response-header        ; Section 6.2
  ;;                  | entity-header ) CRLF)  ; Section 7.1
  ;;                  CRLF
  ;;                  [ message-body ]          ; Section 7.2
  (define Response
    (seq Status-Line
         (rep*
          (seq
           (bar general-header
                response-header
                entity-header)
           CRLF))
         CRLF
         (opt message-body)))

)

