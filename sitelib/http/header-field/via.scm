(library (http header-field via)
  (export Via)
  (import (rnrs (6))
          (http abnf)
          (http stream)
          (only (http basic-rule) comment token)
          (only (http header-field basic-rule) pseudonym)
          (only (http uri host) host)
          (only (http uri port) port))

  ;;; 14.45 Via

  ;; protocol-name     = token
  (define protocol-name token)

  ;; protocol-version  = token
  (define protocol-version token)

  ;; received-protocol = [ protocol-name "/" ] protocol-version
  (define received-protocol
    (seq (opt (seq protocol-name (char->rule #\/))) protocol-version))

  ;; the original host can be terminate with #\,(comma), which
  ;; may be used as a delimiter.
  (define (host-with-no-terminating-comma s failure success)
    (host
     s
     failure
     (lambda (head tree)
       (cond ((null? head) (success head tree))
             ((= 44 (car head)) ; #\,
              (stream-push! s 44)
              (success (cdr head)
                       (reverse (cdr (reverse tree)))))
             (else (success head tree))))))

  ;; received-by       = ( host [ ":" port ] ) | pseudonym
  (define received-by
    (bar (seq host-with-no-terminating-comma (opt (seq (char->rule #\:) port)))
         pseudonym))

  ;; Via =  "Via" ":" 1#( received-protocol received-by [ comment ] )
  (define Via
    (seq (string->rule "Via") (char->rule #\:)
         (num+ (seq received-protocol *LWS received-by (opt (seq *LWS comment))))))

)
