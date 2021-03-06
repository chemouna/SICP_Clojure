#lang racket

(require racket/trace)

(provide type-tag contents attach-tag)

(define (type-tag datum)
  (cond ((pair? datum) (car datum))
        (else (error "Bad tagged datum: TYPE-TAG" datum))))

(define (contents datum)
  (cond ((pair? datum) (cdr datum))
        (else (error "Bad tagged datum: CONTENTS" datum))))

(define (attach-tag . args)
  (cond ((= (length args) 1) (car args))
        ((= (length args) 2) (cons (car args) (cadr args)))
        (else (error "Bad arguments: ATTACH-TAG" args))))

(trace type-tag)
(trace contents)
(trace attach-tag)
