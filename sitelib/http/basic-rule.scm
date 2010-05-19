(library (http basic-rule)
  (export token
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
    (let ((c (stream-pop! s)))
      (if (eof-object? c)
          (failure '())
          (let ((d (char->integer c)))
            (if (and (<= 32 d)
                     (<= d 127)
                     (not (member c separator-chars)))
                (success (list c) c)
                (failure (list c)))))))

  (define token
    (rep 1 #t CHAR-except-CTLs-or-separators))

  (define (comment s failure success)
    (let ((c (stream-pop! s)))
      (cond ((eof-object? c)
             (failure '()))
            ((char=? #\( c)
             ((rep 0 #t (bar quoted-pair ctext comment)) ;; quoted-pair must precede ctext since ctext includes #\\.
              s
              failure
              (lambda (head tree)
                (let ((c2 (stream-pop! s)))
                  (cond ((eof-object? c)
                         (failure head))
                        ((char=? #\) c2)
                         (success `(,c2 ,@head ,c) `(comment ,@tree)))
                        (else
                         (failure (cons c head))))))))
            (else
             (failure (list c))))))

  (define (TEXT-except . chars)
    (lambda (s failure success)
      (let ((c (stream-pop! s)))
        (cond ((eof-object? c)
               (failure '()))
              ((member c chars)
               (failure (list c)))
              ((char=? #\return c)
               (let ((c1 (stream-pop! s)))
                 (cond ((eof-object? c1)
                        (failure (list c)))
                       ((char=? #\linefeed c1)
                        (let ((c2 (stream-pop! s)))
                          (cond ((eof-object? c2)
                                 (failure (list c1 c)))
                                ((or (char=? #\space c2)
                                     (char=? #\tab c2))
                                 (let loop ((x (stream-pop! s)))
                                   (cond ((eof-object? x)
                                          (success (list c2) `(ctext ,c2)))
                                         ((or (char=? #\space x)
                                              (char=? #\tab x))
                                          (loop (stream-pop! s)))
                                         (else
                                          (success (list c2) `(ctext ,c2))))))
                                (else
                                 (failure (list c2 c1 c))))))
                       (else
                        (failure (list c1 c))))))
              ((let ((d (char->integer c)))
                 (and (<= 32 d)
                      (not (= 127 d))))
               (success (list c) `(ctext ,c)))
              (else
               (failure (list c)))))))

  (define ctext (TEXT-except #\( #\)))

  (define qdtext (TEXT-except #\"))

  (define (quoted-pair s failure success)
    (let ((c (stream-pop! s)))
      (cond ((eof-object? c)
             (failure '()))
            ((char=? #\\ c)
             (let* ((c0 (stream-pop! s))
                    (d0 (char->integer c0)))
               (cond ((<= d0 127)
                      (success (list c0 c) `(quoted-pair ,c0)))
                     (else
                      (failure (list c0 c))))))
            (else
             (failure (list c))))))

  (define quoted-string
    (let ((dq (char->rule #\")))
      (seq dq
           (rep 0 #t (bar quoted-pair qdtext)) ;; quoted-pair must precede qdtext since qdtext includes #\\.
           dq)))

)
