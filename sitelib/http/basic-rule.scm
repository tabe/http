(library (http basic-rule)
  (export TEXT-except
          token
          comment
          ctext
          quoted-string
          qdtext
          quoted-pair
          )
  (import (rnrs (6))
          (only (http stream) stream-pop! stream-push!)
          (http abnf))

  (define (CHAR-except-CTLs-or-separators s failure success)
    (let ((b (stream-pop! s)))
      (cond ((eof-object? b)
             (failure '()))
            ((let ((c (integer->char b)))
               (and (<= 32 b)
                    (<= b 127)
                    (not (member c separator-chars))
                    c))
             => (lambda (c) (success (list b) c)))
            (else (failure (list b))))))

  (define token (rep+ CHAR-except-CTLs-or-separators))

  (define (comment s failure success)
    (let ((b (stream-pop! s)))
      (if (eof-object? b)
          (failure '())
          (let ((c (integer->char b)))
            (if (char=? #\( c)
                ((rep* (bar quoted-pair ctext comment)) ;; quoted-pair must precede ctext since ctext includes #\\.
                 s
                 failure
                 (lambda (head tree)
                   (let ((b2 (stream-pop! s)))
                     (cond ((eof-object? b2)
                            (failure head))
                           ((char=? #\) (integer->char b2))
                            (success `(,b2 ,@head ,b) `(comment ,@tree)))
                           (else
                            (failure (cons b head)))))))
                (failure (list b)))))))

  (define (TEXT-except . chars)
    (lambda (s failure success)
      (let ((b (stream-pop! s)))
        (if (eof-object? b)
            (failure '())
            (let ((c (integer->char b)))
              (cond ((member c chars)
                     (failure (list b)))
                    ((char=? #\return c)
                     (let ((b1 (stream-pop! s)))
                       (if (eof-object? b1)
                           (failure (list b))
                           (let ((c1 (integer->char b1)))
                             (cond ((char=? #\linefeed c1)
                                    (let ((b2 (stream-pop! s)))
                                      (if (eof-object? b2)
                                          (failure (list b1 b))
                                          (let ((c2 (integer->char b2)))
                                            (cond ((or (char=? #\space c2)
                                                       (char=? #\tab c2))
                                                   (let loop ((x (stream-pop! s)))
                                                     (if (eof-object? x)
                                                         (success (list b2) `(ctext ,c2))
                                                         (let ((y (integer->char x)))
                                                           (cond ((or (char=? #\space y)
                                                                      (char=? #\tab y))
                                                                  (loop (stream-pop! s)))
                                                                 (else
                                                                  (success (list b2) `(ctext ,c2))))))))
                                                  (else
                                                   (failure (list b2 b1 b))))))))
                                   (else
                                    (failure (list b1 b))))))))
                    ((and (<= 32 b)
                          (not (= 127 b)))
                     (success (list b) `(ctext ,c)))
                    (else
                     (failure (list b)))))))))

  (define ctext (TEXT-except #\( #\)))

  (define qdtext (TEXT-except #\"))

  (define (quoted-pair s failure success)
    (let ((b (stream-pop! s)))
      (if (eof-object? b)
          (failure '())
          (let ((c (integer->char b)))
            (cond ((char=? #\\ c)
                   (let ((b0 (stream-pop! s)))
                     (cond ((<= b0 127)
                            (success (list b0 b) `(quoted-pair ,(integer->char b0))))
                           (else
                            (failure (list b0 b))))))
                  (else
                   (failure (list b))))))))

  (define quoted-string
    (let ((dq (char->rule #\")))
      (seq dq
           (rep* (bar quoted-pair qdtext)) ;; quoted-pair must precede qdtext since qdtext includes #\\.
           dq)))

)
