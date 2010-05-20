(library (http language-tag)
  (export language-tag)
  (import (rnrs (6))
          (http abnf))

  ;;; 3.10 Language Tags
  (define *18ALPHA (rep 1 8 ALPHA))

  (define primary-tag *18ALPHA)

  (define subtag *18ALPHA)

  (define language-tag (seq primary-tag (rep* (seq (char->rule #\-) subtag))))
  
)

