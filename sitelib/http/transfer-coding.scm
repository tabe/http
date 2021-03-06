(library (http transfer-coding)
  (export transfer-coding
          transfer-extension
          Chunked-Body)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule)
          (http parameter))

  ;;; 3.6 Transfer Codings

  (define transfer-extension
    (seq token
         (rep* (seq (char->rule #\;) parameter))))

  (define transfer-coding
    (bar (string->rule "chunked")
         transfer-extension))

  ;;; 3.6.1 Chunked Transfer Coding
  (define chunk-size
    (rep+ HEX))

  (define chunk-ext-name token)

  (define chunk-ext-val (bar token quoted-string))

  (define (chunk-data n) (rep= n OCTET))

  (define chunk-extension
    (rep* (seq (char->rule #\;) chunk-ext-name (opt (seq (char->rule #\=) chunk-ext-val)))))

  (define (chunk s failure success)
    (chunk-size
     s
     failure
     (lambda (h t)
       (cond ((string->number (list->string t))
              => (lambda (n)
                   (if (zero? n)
                       (failure h)
                       ((seq (opt chunk-extension) CRLF (chunk-data n) CRLF)
                        s
                        (lambda (head) (failure (append head h)))
                        (lambda (head tree) (success (append head h) (cons t tree)))))))
             (else (failure h))))))

  (define last-chunk
    (seq (rep+ (char->rule #\0)) (opt chunk-extension) CRLF))

  ;; FIXME
  (define entity-header
    (rep+ OCTET))

  (define trailer
    (rep* (seq entity-header CRLF)))

  (define Chunked-Body
    (seq (rep* chunk)
         last-chunk
         trailer
         CRLF))

)
