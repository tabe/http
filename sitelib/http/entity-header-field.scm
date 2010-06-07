(library (http entity-header-field)
  (export entity-header)
  (import (rnrs (6))
          (http abnf)
          (only (http message-header) message-header)
          (only (http header-field allow) Allow)
          (only (http header-field content-encoding) Content-Encoding)
          (only (http header-field content-language) Content-Language)
          (only (http header-field content-length) Content-Length)
          (only (http header-field content-location) Content-Location)
          (only (http header-field content-md5) Content-MD5)
          (only (http header-field content-range) Content-Range)
          (only (http header-field content-type) Content-Type)
          (only (http header-field expires) Expires)
          (only (http header-field last-modified) Last-Modified))

  ;;; 7.1 Entity Header Fields

  ;; extension-header = message-header
  (define extension-header message-header)

  (define entity-header
    (bar Allow                    ; Section 14.7
         Content-Encoding         ; Section 14.11
         Content-Language         ; Section 14.12
         Content-Length           ; Section 14.13
         Content-Location         ; Section 14.14
         Content-MD5              ; Section 14.15
         Content-Range            ; Section 14.16
         Content-Type             ; Section 14.17
         Expires                  ; Section 14.21
         Last-Modified            ; Section 14.29
         extension-header
         ))

)
