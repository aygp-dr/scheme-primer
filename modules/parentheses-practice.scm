;; Parentheses Practice Module

(define parentheses-practice
  (lambda (menu-item-name)
    (display "=== Parentheses Practice ===")
    (newline)
    (newline)
    (display "In Scheme, parentheses are not just for grouping - they indicate function application!")
    (newline)
    (display "Every opening parenthesis '(' must have a matching closing parenthesis ')'.")
    (newline)
    (newline)
    (parentheses-practice-menu)))

(define parentheses-practice-menu
  (lambda ()
    (display "Choose an exercise:")
    (newline)
    (display "(0) Return to main menu")
    (newline)
    (display "(1) Count parentheses")
    (newline)
    (display "(2) Balance parentheses")
    (newline)
    (display "(3) Fix missing parentheses")
    (newline)
    (display "(4) Identify valid expressions")
    (newline)
    (let ((choice (read)))
      (cond
        ((equal? choice 0) (main-menu))
        ((equal? choice 1) (count-parentheses-exercise))
        ((equal? choice 2) (balance-parentheses-exercise))
        ((equal? choice 3) (fix-parentheses-exercise))
        ((equal? choice 4) (identify-valid-expressions))
        (else
         (display "Invalid choice. Please try again.")
         (newline)
         (parentheses-practice-menu))))))

(define count-parentheses-exercise
  (lambda ()
    (display "=== Count Parentheses ===")
    (newline)
    (display "Count how many opening and closing parentheses are in each expression:")
    (newline)
    (newline)
    
    (define exercises
      '(("(+ 1 2)" . (1 . 1))
        ("(* (+ 1 2) 3)" . (2 . 2))
        ("(if (> x 0) (+ x 1) (- x 1))" . (4 . 4))
        ("(lambda (x) (* x x))" . (3 . 3))
        ("(let ((x 5) (y 10)) (+ x y))" . (5 . 5))))
    
    (define check-answer
      (lambda (expr expected-open expected-close)
        (display "Expression: ")
        (display expr)
        (newline)
        (display "How many opening parentheses? ")
        (let ((user-open (read)))
          (display "How many closing parentheses? ")
          (let ((user-close (read)))
            (cond
              ((and (equal? user-open expected-open)
                    (equal? user-close expected-close))
               (display "Correct! Well done!")
               (newline))
              (else
               (display "Not quite. The answer is ")
               (display expected-open)
               (display " opening and ")
               (display expected-close)
               (display " closing parentheses.")
               (newline)))
            (newline)))))
    
    (for-each
     (lambda (exercise)
       (check-answer (car exercise) (cadr exercise) (cddr exercise)))
     exercises)
    
    (display "Exercise complete! Press Enter to continue...")
    (newline)
    (read)
    (parentheses-practice-menu)))

(define balance-parentheses-exercise
  (lambda ()
    (display "=== Balance Parentheses ===")
    (newline)
    (display "Determine if these expressions have balanced parentheses:")
    (newline)
    (display "Type 'yes' for balanced, 'no' for unbalanced.")
    (newline)
    (newline)
    
    (define exercises
      '(("(+ 1 2)" . yes)
        ("(+ 1 2))" . no)
        ("((lambda (x) x) 5)" . yes)
        ("(define (f x) (* x x)" . no)
        ("(cond ((> x 0) 'positive) (else 'non-positive))" . yes)
        ("(let ((x 5)) (+ x 1))" . yes)
        ("(car (cdr (cdr '(1 2 3 4))))" . yes)
        ("(if (null? lst) '() (cons (car lst) (filter-odd (cdr lst)))" . no)))
    
    (define score 0)
    
    (for-each
     (lambda (exercise)
       (display "Expression: ")
       (display (car exercise))
       (newline)
       (display "Balanced? ")
       (let ((answer (read)))
         (cond
           ((equal? answer (cdr exercise))
            (display "Correct!")
            (set! score (+ score 1)))
           (else
            (display "Incorrect. The answer is ")
            (display (cdr exercise))))
         (newline)
         (newline)))
     exercises)
    
    (display "You got ")
    (display score)
    (display " out of ")
    (display (length exercises))
    (display " correct!")
    (newline)
    (display "Press Enter to continue...")
    (newline)
    (read)
    (parentheses-practice-menu)))

(define fix-parentheses-exercise
  (lambda ()
    (display "=== Fix Missing Parentheses ===")
    (newline)
    (display "Add the missing parentheses to make these valid Scheme expressions.")
    (newline)
    (display "Type the corrected expression:")
    (newline)
    (newline)
    
    (define exercises
      '(("+ 1 2" . "(+ 1 2)")
        ("define x 5" . "(define x 5)")
        ("lambda x) (* x x" . "(lambda (x) (* x x))")
        ("if > x 0) 'positive 'non-positive" . "(if (> x 0) 'positive 'non-positive)")
        ("let (x 5)) (+ x 1)" . "(let ((x 5)) (+ x 1))")))
    
    (for-each
     (lambda (exercise)
       (display "Fix this: ")
       (display (car exercise))
       (newline)
       (display "Your answer: ")
       (let ((answer (read)))
         (cond
           ((equal? answer (string->symbol (cdr exercise)))
            (display "Good try! The standard answer is: ")
            (display (cdr exercise)))
           (else
            (display "The standard answer is: ")
            (display (cdr exercise))))
         (newline)
         (newline)))
     exercises)
    
    (display "Exercise complete! Press Enter to continue...")
    (newline)
    (read)
    (parentheses-practice-menu)))

(define identify-valid-expressions
  (lambda ()
    (display "=== Identify Valid Expressions ===")
    (newline)
    (display "Which of these are valid Scheme expressions?")
    (newline)
    (display "Type 'valid' or 'invalid' for each:")
    (newline)
    (newline)
    
    (define exercises
      '(("()" . valid)
        ("(+ 1 2)" . valid)
        ("(1 2 3)" . invalid)
        ("('a 'b 'c)" . invalid)
        ("(list 1 2 3)" . valid)
        ("(define (f x) x)" . valid)
        ("(define f(x) x)" . invalid)
        ("((lambda (x) x) 5)" . valid)
        ("(lambda x x)" . invalid)
        ("(if #t 1 2)" . valid)))
    
    (define score 0)
    
    (for-each
     (lambda (exercise)
       (display "Expression: ")
       (display (car exercise))
       (newline)
       (display "Valid or invalid? ")
       (let ((answer (read)))
         (cond
           ((equal? answer (cdr exercise))
            (display "Correct!")
            (set! score (+ score 1)))
           (else
            (display "Incorrect. This expression is ")
            (display (cdr exercise))))
         (newline)
         (when (equal? (cdr exercise) 'invalid)
           (display "Explanation: ")
           (cond
             ((equal? (car exercise) "(1 2 3)")
              (display "Numbers cannot be applied as functions."))
             ((equal? (car exercise) "('a 'b 'c)")
              (display "Quoted symbols cannot be applied as functions."))
             ((equal? (car exercise) "(define f(x) x)")
              (display "Function parameters need to be in a separate list."))
             ((equal? (car exercise) "(lambda x x)")
              (display "Lambda parameters must be in a list."))
             (else (display "This violates Scheme syntax rules.")))
           (newline))
         (newline)))
     exercises)
    
    (display "You got ")
    (display score)
    (display " out of ")
    (display (length exercises))
    (display " correct!")
    (newline)
    (display "Press Enter to continue...")
    (newline)
    (read)
    (parentheses-practice-menu)))