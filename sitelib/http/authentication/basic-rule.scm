(library (http authentication basic-rule)
  (export challenge
          credentials)
  (import (rnrs (6))
          (http abnf)
          (only (http basic-rule) quoted-string token))

  ;; auth-scheme    = token
  (define auth-scheme token)

  ;; auth-param     = token "=" ( token | quoted-string )
  (define auth-param (seq token (char->rule #\=) (bar token quoted-string)))

  ;; challenge   = auth-scheme 1*SP 1#auth-param
  (define challenge (seq auth-scheme (rep+ SP) (num+ auth-param)))

  ;; from RFC 2617 Errata:
  ;; credentials = auth-scheme ( token | quoted-string | #auth-param )
  (define credentials (seq auth-scheme *LWS (bar token quoted-string (num* auth-param))))

)
