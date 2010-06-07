(library (http general-header-field)
  (export general-header)
  (import (rnrs (6))
          (http abnf)
          (only (http header-field cache-control) Cache-Control)
          (only (http header-field connection) Connection)
          (only (http header-field date) Date)
          (only (http header-field pragma) Pragma)
          (only (http header-field trailer) Trailer)
          (only (http header-field transfer-encoding) Transfer-Encoding)
          (only (http header-field upgrade) Upgrade)
          (only (http header-field via) Via)
          (only (http header-field warning) Warning))

  (define general-header
    (bar Cache-Control
         Connection
         Date
         Pragma
         Trailer
         Transfer-Encoding
         Upgrade
         Via
         Warning))

)
