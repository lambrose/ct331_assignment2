#lang racket

(require (file "assignment_q2.rkt"))
 
(define (runTests)
  (begin
    (display "\n")
    (display "\n")
    (display "Running tests...\n")
    ;begin calling test functions
    (printf "A: ~a\n\n" (ins_beg 'a '(b c d)))
    (printf "B: ~a\n\n" (ins_end 'a '(b c d)))
    (printf "C: ~a\n\n" (cout_top_level '(a b c d)))
    (printf "D: ~a\n\n" (count_instances 'a '(a b c d a b c d)))
    (printf "E: ~a\n\n" (count_instances_tr 'a '(a b c d a b c d a b c d)))
    (printf "F: ~a\n\n" (count_instances_deep 'a '(a b c d (a b c d) a b c d)))
    
    ;end calling test functions
    (display "Tests complete!\n")))

;Begin test functions
(define (test_ins_beg1)
  (eq? (ins_beg 1 '(2 3 4)) '(1 2 3 4)))

;End test functions

;Run the tests
(runTests)