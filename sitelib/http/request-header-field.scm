(library (http request-header-field)
  (export request-header)
  (import (rnrs (6))
          (http abnf)
          (only (http header-field accept) Accept)
          (only (http header-field accept-charset) Accept-Charset)
          (only (http header-field accept-encoding) Accept-Encoding)
          (only (http header-field accept-language) Accept-Language)
          (only (http header-field authorization) Authorization)
          (only (http header-field expect) Expect)
          (only (http header-field from) From)
          (only (http header-field host) Host)
          (only (http header-field if-match) If-Match)
          (only (http header-field if-modified-since) If-Modified-Since)
          (only (http header-field if-none-match) If-None-Match)
          (only (http header-field if-range) If-Range)
          (only (http header-field if-unmodified-since) If-Unmodified-Since)
          (only (http header-field max-forwards) Max-Forwards)
          (only (http header-field proxy-authorization) Proxy-Authorization)
          (only (http header-field range) Range)
          (only (http header-field referer) Referer)
          (only (http header-field te) TE)
          (only (http header-field user-agent) User-Agent))

  ;;; 5.3 Request Header Fields

  (define request-header
    (bar Accept                   ; Section 14.1
         Accept-Charset           ; Section 14.2
         Accept-Encoding          ; Section 14.3
         Accept-Language          ; Section 14.4
         Authorization            ; Section 14.8
         Expect                   ; Section 14.20
         From                     ; Section 14.22
         Host                     ; Section 14.23
         If-Match                 ; Section 14.24
         If-Modified-Since        ; Section 14.25
         If-None-Match            ; Section 14.26
         If-Range                 ; Section 14.27
         If-Unmodified-Since      ; Section 14.28
         Max-Forwards             ; Section 14.31
         Proxy-Authorization      ; Section 14.34
         Range                    ; Section 14.35
         Referer                  ; Section 14.36
         TE                       ; Section 14.39
         User-Agent               ; Section 14.43
         ))

)
