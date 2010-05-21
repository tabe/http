(library (http media-type)
  (export type
          subtype
          media-type)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http parameter))

  ;;; 3.7 Media Types

  (define type token)

  (define subtype token)

  (define media-type
    (seq type (char->rule #\/) subtype (rep* (seq (char->rule #\;) parameter))))

  ;; Media-type values are registered with the Internet Assigned Number
  ;; Authority (IANA [19]). The media type registration process is
  ;; outlined in RFC 1590 [17]. Use of non-registered media types is
  ;; discouraged.

  ;;; http://www.iana.org/assignments/media-types/

  ;;; 3.7.1 Canonicalization and Text Defaults
  ;;; 3.7.2 Multipart Types

)
