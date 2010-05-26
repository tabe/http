(library (http header-field from)
  (export From)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule))

  ;;; 14.22 From

  ;; The address SHOULD be machine-usable, as defined by "mailbox"
  ;; in RFC 822 [9] as updated by RFC 1123 [8]
  (define mailbox (rep+ OCTET)) ; FIXME

  (define From (seq (string->rule "From") (char->rule #\:) *LWS mailbox))

)
