(library (http header-field content-language)
  (export Content-Language)
  (import (rnrs (6))
          (http abnf)
          (http language-tag))

  ;;; 14.12 Content-Language

  (define Content-Language
    (seq (string->rule "Content-Language") (char->rule #\:) (num+ language-tag)))

)
