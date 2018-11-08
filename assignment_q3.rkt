#lang racket

(define binary_search_tree '(((() 1 ()) 2 (() 3 ())) 4 ((() 5 ()) 6 (() 7 ()))))
;(A)
(define (print_tree tree)
  (begin
    (cond
      [(not(null? (car tree)))
       (print_tree (car tree))])
    (display (car (cdr tree)))
    (cond
      [(not(null? (caddr tree)))
         (print_tree (caddr tree))])))

;(B)
(define (check item lst)
  (cond
    [(null? lst) #f]
    [(equal? item (cadr lst)) #t]
    [(< item (cadr lst)) (check item (car lst))]
    [else (check item (caddr lst))]))

;(C)
(define (insert item lst)
  (cond
    [(null? lst) (append lst (list '() item '()))]
    [(equal? item (cadr lst))]
    [(< item (cadr lst))
     (list (insert item (car lst))
           (cadr lst)
              (caddr lst))]
    [else
     (list (car lst)
              (cadr lst)
                 (insert item (caddr lst)))]))

;(D)
(define (insert_lst lst tree)
  (cond
   [(null? lst) tree]
   [else
      (insert_lst (cdr lst)
                   (insert (car lst) tree))]
  ))

;(E)
(define (sort lst)
  (print_tree (insert_lst lst '()))
  )

;(F)
(define (tree_sort lst comparator)
  (print_tree (list_tree lst '() comparator))
  )

(define (list_tree lst tree comparator)
  (cond
    [(null? lst) (append lst (list '() item '()))]
    [(equal? item (cadr lst))]
    [(comparator item (cadr lst))
      (list (list_tree item (car lst) comparator)
              (cadr lst)))
