(library (http parameter)
  (export parameter)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule))

  ;;; 3.6 Transfer Codings

  ;; The Internet Assigned Numbers Authority (IANA) acts as a registry for
  ;; transfer-coding value tokens.

  ;;; http://www.iana.org/assignments/http-parameters
  ;;; (last updated 2009-09-02)

  (define attribute token)

  (define value (bar token quoted-string))

  (define parameter
    (seq attribute (char->rule #\=) value))

)
