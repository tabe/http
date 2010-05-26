(library (http header-field expect)
  (export Expect)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule))

  ;;; 14.20 Expect

  (define EQ (char->rule #\=))

  (define expect-params
    (seq (char->rule #\;) *LWS ; implicit *LWS
         token (opt (seq EQ (bar token quoted-string)))))

  (define expectation-extension
    (seq token (opt (seq EQ (bar token quoted-string) (rep* expect-params)))))

  (define expectation (bar (string->rule "100-continue") expectation-extension))

  (define Expect (seq (string->rule "Expect") (char->rule #\:) (num+ expectation)))

)
