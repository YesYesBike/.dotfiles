#!/usr/bin/guile
!#

;(define (gcd a b)
;  (define (gcdd a b)
;    (if (= b 0)
;      a
;      (gcdd b (remainder a b))))
;  (if (> a b)
;    (gcdd a b)
;    (gcdd b a)))

(define (prime? n)
  (define (smallest-divisor n)
    (define (div-iter n i)
      (cond ((> (* i i) n) n)
            ((= (remainder n i) 0) i)
            (else (div-iter n (+ i 1)))))
    (div-iter n 2))
  (if (= n 1)
    #f
    (= (smallest-divisor n)
       n)))

;(define (sigma func next a b)
;  (define (iter func next a b ret)
;	(if (> a b)
;	  ret
;	  (iter func
;			next
;			(next a)
;			b
;			(+ ret
;			   (func a)))))
;  (iter func next a b 0))

; Excercise 1.29
;(define (simpson func a b n)
;  (if (not (even? n))
;    (error "NOT EVEN"))
;  (define h
;    (/ (- b a) n))
;  (define (simp-iter func sum k)
;    (define (simp-sum k)
;      (func (+ a
;               (* k h))))
;    (cond ((= k n) (+ sum
;                      (simp-sum k)))
;          ((odd? k) (simp-iter func
;                               (+ sum
;                                  (* 4 (simp-sum k)))
;                               (+ k 1)))
;          (else (simp-iter func
;                           (+ sum
;                              (* 2 (simp-sum k)))
;                           (+ k 1)))))
;  (* (/ h 3)    ; 3.0
;     (+ (func a)
;        (simp-iter func 0 1))))

; Excercise 1.31
;(define (prod func next a b)
;  (define (prod-iter func next a b ret)
;    (if (> a b)
;      ret
;      (prod-iter func
;                 next
;                 (next a)
;                 b
;                 (* ret
;                    (func a)))))
;  (prod-iter func next a b 1))

;(define (pie n)
;  (define (func n)
;    (define (double n) (* n n))
;    (/ (* 4 n (+ n 1))
;       (double (+ (* n 2) 1))))
;  (define (inc n) (+ n 1))
;  (* 4.0
;     (prod func inc 1 n)))

; Excercise 1.32
;(define (accumulate combiner null-value func next a b)
;  (define (iter func next a b ret)
;    (if (> a b)
;      ret
;      (iter func
;            next
;            (next a)
;            b
;            (combiner ret
;                      (func a)))))
;  (iter func next a b null-value))

; Excercise 1.33
;(define (filtered-accumulate filter combiner null-value func next a b)
;  (define (iter func next a b ret)
;    (if (> a b)
;      ret
;      (if (filter a)
;        (iter func
;              next
;              (next a)
;              b
;              (combiner ret
;                        (func a)))
;        (iter func
;              next
;              (next a)
;              b
;              ret))))
;  (iter func next a b null-value))

;(define (fixed-point f x)
;  (define (close? a b)
;    (< (abs (- a b))
;       0.00001))
;  (define (iter f x)
;    (let ((next (f x)))
;      (if (close? x next)
;        next
;        (iter f next))))
;  (iter f x))
;
;(define (avg-damp f)
;  (lambda (x)
;    (/ (+ x (f x)) 2)))
;
;(define (deriv f)
;  (let ((dx 0.00001))
;    (lambda (x)
;      (/ (- (f (+ x dx))
;            (f x))
;         dx))))
;
;(define (newton-trans g)
;  (lambda (x)
;    (- x
;       (/ (g x)
;          ((deriv g) x)))))
;
;(define (newton-method g guess)
;  (fixed-point (newton-trans g) guess))

(define (filter predicate lis)
  (cond ((null? lis) '())
        ((predicate (car lis))
         (cons (car lis)
               (filter predicate (cdr lis))))
        (else (filter predicate (cdr lis)))))

(define (accumulate op init lis)
  (if (null? lis)
    init
    (op (car lis)
        (accumulate op init (cdr lis)))))

(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low (enumerate-interval (+ 1 low) high))))

(define (enumerate-tree lis)
  (cond ((null? lis) '())
        ((not (pair? lis)) (list lis))
        (else (append (enumerate-tree (car lis))
                      (enumerate-tree (cdr lis))))))

;(define (horner-eval x coeff-seq)
;  (accumulate (lambda (this-coeff higher-terms)
;                (+ this-coeff
;                   (* x higher-terms)))
;              0
;              coeff-seq))

(define (accumulate-n op init lis)
  (if (null? (car lis))
    '()
    (cons (accumulate op init (map car lis))
          (accumulate-n op init (map cdr lis)))))

(define (fold-left op init lis)
  (define (iter ret lis)
    (if (null? lis)
      ret
      (iter (op ret (car lis))
            (cdr lis))))
  (iter init lis))

(define (flatmap proc lis)
  (accumulate append
              '()
              (map proc lis)))
