(library (http header-field accept-ranges)
  (export Accept-Ranges)
  (import (rnrs (6))
          (http abnf)
          (http range-unit))

  ;;; 14.5 Accept-Ranges

  (define acceptable-ranges
    (bar (num+ range-unit) (string->rule "none")))

  (define Accept-Ranges
    (seq (string->rule "Accept-Ranges")
         (char->rule #\:)
         acceptable-ranges))

)
