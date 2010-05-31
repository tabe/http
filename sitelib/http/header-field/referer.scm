(library (http header-field referer)
  (export Referer)
  (import (rnrs (6))
          (http abnf)
          (only (http uri) absoluteURI relativeURI))

  ;;; 14.36 Referer

  ;; Referer        = "Referer" ":" ( absoluteURI | relativeURI )
  (define Referer
    (seq (string->rule "Referer") (char->rule #\:) *LWS (bar absoluteURI relativeURI)))

)
