(library (http uri basic-rule)
  (export pct-encoded
          unreserved
          sub-delims
          pchar
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

  ;; pchar         = unreserved / pct-encoded / sub-delims / ":" / "@"
  (define pchar (bar unreserved pct-encoded sub-delims (char->rule #\:) (char->rule #\@)))

  ;; reg-name      = *( unreserved / pct-encoded / sub-delims )
  (define reg-name (rep* (bar unreserved pct-encoded sub-delims)))

)
