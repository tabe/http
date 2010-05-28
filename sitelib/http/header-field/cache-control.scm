(library (http header-field cache-control)
  (export Cache-Control)
  (import (rnrs (6))
          (http abnf)
          (only (http basic-rule) quoted-string token)
          (http date-time)
          (http message-header))

  ;;; 14.9 Cache-Control

  (define EQ (char->rule #\=))

  (define cache-extension
    (seq token (opt (seq EQ (bar token quoted-string)))))

  (define cache-request-directive
    (bar
     (string->rule "no-cache")
     (string->rule "no-store")
     (seq (string->rule "max-age") EQ delta-seconds)
     (seq (string->rule "max-stale") (opt (seq EQ delta-seconds)))
     (seq (string->rule "min-fresh") EQ delta-seconds)
     (string->rule "no-transform")
     (string->rule "only-if-cached")
     cache-extension))

  (define cache-response-directive
    (bar
     (string->rule "public")
     (seq
      (string->rule "private")
      (opt
       (seq EQ DQ (num+ field-name) DQ)))
     (seq
      (string->rule "no-cache")
      (opt
       (seq EQ DQ (num+ field-name) DQ)))
     (string->rule "no-store")
     (string->rule "no-transform")
     (string->rule "must-revalidate")
     (string->rule "proxy-revalidate")
     (seq (string->rule "max-age") EQ delta-seconds)
     (seq (string->rule "s-maxage") EQ delta-seconds)
     cache-extension))

  (define cache-directive
    (bar cache-request-directive
         cache-response-directive))

  (define Cache-Control
    (seq (string->rule "Cache-Control") (char->rule #\:) (num+ cache-directive)))

)
