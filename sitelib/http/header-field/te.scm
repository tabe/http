(library (http header-field te)
  (export TE)
  (import (rnrs (6))
          (http abnf)
          (only (http transfer-coding) transfer-extension)
          (only (http header-field accept) accept-params))

  ;;; 14.39 TE

  ;; t-codings = "trailers" | ( transfer-extension [ accept-params ] )
  (define t-codings
    (bar (string->rule "trailers") (seq transfer-extension (opt accept-params))))

  ;; TE        = "TE" ":" #( t-codings )
  (define TE (seq (string->rule "TE") (char->rule #\:) (num* t-codings)))

)
