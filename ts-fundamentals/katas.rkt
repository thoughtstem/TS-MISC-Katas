#lang racket

(provide katas
         code-values-all
         image->code-katas
         hello-world
         simple-pictures)

(require ts-kata-util/katas/main
         "./katas/image-to-code.rkt"
         "./katas/simple-pictures.rkt")

(define-kata code-of-awesomeness-1
  (recite
   #:in "OVERCOME THE UNKNOWN"
   #:out (list "A) To boldly go where no one's gone before."
               "B) To infinity and beyond!"
               "C) CHARGE!")))

(define-kata code-of-awesomeness-2
  (recite
   #:in "BE A BUG HUNTER"
   #:out (list "A) Bug found? Don’t frown!"
               "B) SMUSH!"
               "C) Gotta catch 'em all!")))

(define-kata code-of-awesomeness-3
  (recite
   #:in "ENERGIZE THE TEAM"
   #:out (list "A) Coders Assemble!"
               "B) Teamwork makes the dream work."
               "C) Be the lightning!")))

(define proto-fundamentals
  (lang->kata-collection 'fundamentals))

(define-kata-collection fundamentals-shapes
  (translate #:id "Another Shape"
             #:in "Make a star that is gold and size 60 pixels."
             #:out (~a "#lang racket\n\n"
                       "(require 2htdp/image)\n\n"
                       "(star 60 'solid 'gold)"))
  (translate #:id "Favorite Color"
             #:in "Make a triangle of your favorite color and size 100."
             #:out (~a "#lang racket\n\n"
                       "(require 2htdp/image)\n\n"
                       (substring (~v '(triangle 100 'solid 'skyblue)) 1)))
  (translate #:id "Not Solid?"
             #:in "Write five copies of the line below, filling in the blank with a word
                    that DOESN'T work!\n(circle 50 '_______ 'red)"
             #:out (~a "#lang racket\n\n"
                       "(require 2htdp/image)\n\n"
                       (substring (~v '(circle 30 'blue 'red)) 1) "\n"
                       (substring (~v '(circle 30 'dotted 'red)) 1) "\n"
                       (substring (~v '(circle 30 'line 'red)) 1)))
  (translate #:id "Outline Shape"
             #:in "Make a triangle of size 150 with a purple outline."
             #:out (~a "#lang racket\n\n"
                       "(require 2htdp/image)\n\n"
                       (substring (~v '(triangle 150 'outline 'purple)) 1))))

(define-kata-collection fundamentals
  (fill-in-stimuli proto-fundamentals

                   'hello-world
                   (read "Make a circle that is red and size 40.")
 
                   'target
                   (read "Make a target using circles of different sizes and overlay.")))

(define-kata target
  (second (kata-collection-katas fundamentals)))

(define-kata hello-world
  (first (kata-collection-katas fundamentals)))

(define-kata-collection code-values-all
  code-of-awesomeness-1
  code-of-awesomeness-2
  code-of-awesomeness-3)

(define-kata-collection katas
  hello-world
  fundamentals-shapes
  image->code-katas
  target
  simple-pictures)


