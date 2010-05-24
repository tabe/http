(library (http method)
  (export Method)
  (import (rnrs (6))
          (http abnf)
          (http basic-rule))

  ;;; 5.1.1 Method

  (define-syntax define-method
    (syntax-rules ()
      ((_ name)
       (define name (string->rule (symbol->string 'name))))))

  (define-method OPTIONS)
  (define-method GET)
  (define-method HEAD)
  (define-method POST)
  (define-method PUT)
  (define-method DELETE)
  (define-method TRACE)
  (define-method CONNECT)

  (define extension-method token)

  (define Method
    (bar OPTIONS
         GET
         HEAD
         POST
         PUT
         DELETE
         TRACE
         CONNECT
         extension-method))

)
