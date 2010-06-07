(library (http request)
  (export Request)
  (import (rnrs (6))
          (http abnf)
          (only (http entity-header-field) entity-header)
          (only (http general-header-field) general-header)
          (only (http request-header-field) request-header)
          (only (http message-body) message-body)
          (only (http request-line) Request-Line))

  ;;; 5 Request

  ;; Request       = Request-Line              ; Section 5.1
  ;;                 *(( general-header        ; Section 4.5
  ;;                  | request-header         ; Section 5.3
  ;;                  | entity-header ) CRLF)  ; Section 7.1
  ;;                 CRLF
  ;;                 [ message-body ]          ; Section 4.3
  (define Request
    (seq Request-Line
         (rep*
          (seq
           (bar general-header
                request-header
                entity-header)
           CRLF))
         CRLF
         (opt message-body)))

)
