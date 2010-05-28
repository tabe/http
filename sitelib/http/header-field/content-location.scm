(library (http header-field content-location)
  (export Content-Location)
  (import (rnrs (6))
          (http abnf)
          (only (http uri) absoluteURI relativeURI))

  ;;; 14.14 Content-Location

  ;; Content-Location = "Content-Location" ":"
  ;;                   ( absoluteURI | relativeURI )
  (define Content-Location
    (seq
     (string->rule "Content-Location")
     (char->rule #\:)
     *LWS
     (bar absoluteURI relativeURI)))

)
