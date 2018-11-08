#lang racket

(provide ins_beg)
(provide ins_end)
(provide cout_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)

;(A)
(define (ins_beg el lst)
  (display "ins_beg function \n")
  (cons el lst))

;(B)
(define (ins_end el lst)
  (display "ins_end function \n")
  (append lst (list el)))

;(C)
 (define (cout_top_level lst)
    (cond [(null? lst) 0]
     
    [else (+ 1 (cout_top_level (cdr lst)))]))

;(D)
(define (count_instances item lst)
  (cond
    [(null? lst) 0]
    [(equal? item (car lst))
          (+ 1 (count_instances item (cdr lst)))]
    [else
        (count_instances item (cdr lst))]))

;(E)
(define (count_instances_tr item lst)
  (_helper_count_instances_tr item lst 0))
(define (_helper_count_instances_tr item lst total)
  (cond
    [(null? lst) total]
    [(equal? item (car lst))
        (_helper_count_instances_tr item (cdr lst)
        (+ 1 total))]
    [else
     (_helper_count_instances_tr item (cdr lst) total)]))

;(F)
(define (count_instances_deep el lst)
  (cond ((null? lst) 0)
        ((equal? el (car lst))
         (+ 1 (count_instances_deep el (cdr lst))))
        ((list? (car lst))
             (+ 0 (count_instances_deep el (cdr lst))
             (count_instances_deep el (car lst))))
            (else
                 (count_instances_deep el (cdr lst)))
))