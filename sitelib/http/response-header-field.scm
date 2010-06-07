(library (http response-header-field)
  (export response-header)
  (import (rnrs (6))
          (http abnf)
          (only (http header-field accept-ranges) Accept-Ranges)
          (only (http header-field age) Age)
          (only (http header-field etag) ETag)
          (only (http header-field location) Location)
          (only (http header-field proxy-authenticate) Proxy-Authenticate)
          (only (http header-field retry-after) Retry-After)
          (only (http header-field server) Server)
          (only (http header-field vary) Vary)
          (only (http header-field www-authenticate) WWW-Authenticate))

  ;;; 6.2 Response Header Fields

  (define response-header
    (bar Accept-Ranges           ; Section 14.5
         Age                     ; Section 14.6
         ETag                    ; Section 14.19
         Location                ; Section 14.30
         Proxy-Authenticate      ; Section 14.33
         Retry-After             ; Section 14.37
         Server                  ; Section 14.38
         Vary                    ; Section 14.44
         WWW-Authenticate        ; Section 14.47
         ))

)
