(library (http uri authority)
  (export authority)
  (import (rnrs (6))
          (http abnf)
          (http uri basic-rule)
          (http uri host)
          (http uri port))

  ;;; 3.2.  Authority

  (define COLON (char->rule #\:))

  (define userinfo
    (rep*
     (bar unreserved
          pct-encoded
          sub-delims
          COLON)))

  (define authority
    (seq (opt (seq userinfo (char->rule #\@)))
         host
         (opt (seq COLON port))))

)
