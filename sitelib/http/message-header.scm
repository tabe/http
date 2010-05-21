(library (http message-header)
  (export message-header)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule))

  ;;; 4.2 Message Headers

  (define field-content OCTET)

  (define field-name token)

  (define field-value (rep* (bar LWS field-content))) ; LWS must precedes field-content since field-content includes LWS.

  (define message-header (seq field-name (char->rule #\:) (opt field-value)))

)
