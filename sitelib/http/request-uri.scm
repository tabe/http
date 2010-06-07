(library (http request-uri)
  (export Request-URI)
  (import (rnrs (6))
          (http abnf)
          (only (http uri) absoluteURI)
          (only (http uri authority) authority)
          (only (http uri path) abs_path))

  ;;; 5.1.2 Request-URI

  ;; Request-URI    = "*" | absoluteURI | abs_path | authority
  (define Request-URI (bar (char->rule #\*) absoluteURI abs_path authority))

)
