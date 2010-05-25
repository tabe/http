(library (http header-field content-range)
  (export Content-Range)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http range-unit))

  ;;; 14.16 Content-Range

  (define ASTERISK (char->rule #\*))

  (define first-byte-pos (rep+ DIGIT)) ; from 14.35.1 Byte Ranges

  (define last-byte-pos (rep+ DIGIT)) ; from 14.35.1 Byte Ranges

  (define instant-length (rep+ DIGIT))

  (define byte-range-resp-spec
    (bar (seq first-byte-pos (char->rule #\-) last-byte-pos)
         ASTERISK))

  (define byte-content-range-spec
    (seq bytes-unit SP
         byte-range-resp-spec (char->rule #\/)
         (bar instant-length ASTERISK)))

  (define content-range-spec byte-content-range-spec)

  (define Content-Range
    (seq (string->rule "Content-Range") (char->rule #\:) *LWS content-range-spec))

)
