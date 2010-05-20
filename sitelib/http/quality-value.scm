(library (http quality-value)
  (export qvalue)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule))

  ;;; 3.9 Quality Values
  (define qvalue
    (let ((zero (char->rule #\0))
          (one (char->rule #\1))
          (dot (char->rule #\.)))
      (bar (seq zero (opt (seq dot (rep 0 3 DIGIT))))
           (seq one (opt (seq dot (rep 0 3 zero)))))))

)

