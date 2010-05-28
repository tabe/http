(library (http header-field range)
  (export Range)
  (import (except (rnrs (6)) -)
          (http abnf)
          (only (http range-unit) bytes-unit))

  ;;; 14.35 Range

  (define - (char->rule #\-))

  ;; first-byte-pos  = 1*DIGIT
  (define first-byte-pos (rep+ DIGIT))

  ;; last-byte-pos   = 1*DIGIT
  (define last-byte-pos (rep+ DIGIT))

  ;; byte-range-spec = first-byte-pos "-" [last-byte-pos]
  (define byte-range-spec (seq first-byte-pos - (opt last-byte-pos)))

  ;; suffix-length = 1*DIGIT
  (define suffix-length (rep+ DIGIT))

  ;; suffix-byte-range-spec = "-" suffix-length
  (define suffix-byte-range-spec (seq - suffix-length))

  ;; byte-range-set  = 1#( byte-range-spec | suffix-byte-range-spec )
  (define byte-range-set (num+ (bar byte-range-spec suffix-byte-range-spec)))

  ;; byte-ranges-specifier = bytes-unit "=" byte-range-set
  (define byte-ranges-specifier (seq bytes-unit (char->rule #\=) byte-range-set))

  ;; ranges-specifier = byte-ranges-specifier
  (define ranges-specifier byte-ranges-specifier)

  ;; Range = "Range" ":" ranges-specifier
  (define Range (seq (string->rule "Range") (char->rule #\:) *LWS ranges-specifier))

)
