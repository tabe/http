(library (http uri basic-rule)
  (export pct-encoded
          unreserved
          sub-delims
          reg-name)
  (import (rnrs (6))
          (http abnf))

  ;; pct-encoded   = "%" HEXDIG HEXDIG
  (define pct-encoded (seq (char->rule #\%) HEX HEX))

  ;; unreserved    = ALPHA / DIGIT / "-" / "." / "_" / "~"
  (define unreserved
    (bar ALPHA DIGIT (char->rule #\-) (char->rule #\.) (char->rule #\_) (char->rule #\~)))

  ;; sub-delims    = "!" / "$" / "&" / "'" / "(" / ")"
  ;;               / "*" / "+" / "," / ";" / "="
  (define sub-delims
    (let ((chars '(#\! #\$ #\& #\' #\( #\)
                   #\* #\+ #\, #\; #\=)))
      (apply bar (map char->rule chars))))

  ;; reg-name      = *( unreserved / pct-encoded / sub-delims )
  (define reg-name (rep* (bar unreserved pct-encoded sub-delims)))

)
