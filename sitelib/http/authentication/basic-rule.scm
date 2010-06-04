(library (http authentication basic-rule)
  (export challenge)
  (import (rnrs (6))
          (http abnf)
          (only (http basic-rule) quoted-string token))

  ;; auth-scheme    = token
  (define auth-scheme token)

  ;; auth-param     = token "=" ( token | quoted-string )
  (define auth-param (seq token (char->rule #\=) (bar token quoted-string)))

  ;; challenge   = auth-scheme 1*SP 1#auth-param
  (define challenge (seq auth-scheme (rep+ SP) (num+ auth-param)))

)
