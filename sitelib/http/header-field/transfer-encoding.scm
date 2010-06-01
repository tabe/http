(library (http header-field transfer-encoding)
  (export Transfer-Encoding)
  (import (rnrs (6))
          (http abnf)
          (only (http transfer-coding) transfer-coding))

  ;;; 14.41 Transfer-Encoding

  ;; Transfer-Encoding       = "Transfer-Encoding" ":" 1#transfer-coding
  (define Transfer-Encoding
    (seq (string->rule "Transfer-Encoding") (char->rule #\:) (num+ transfer-coding)))

)
