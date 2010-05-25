(library (http header-field content-md5)
  (export Content-MD5)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule))

  ;;; 14.15 Content-MD5

  ;; md5-digest   = <base64 of 128 bit MD5 digest as per RFC 1864>
  (define md5-digest (rep+ (bar ALPHA DIGIT))) ; FIXME

  (define Content-MD5
    (seq (string->rule "Content-MD5") (char->rule #\:) *LWS md5-digest))

)
