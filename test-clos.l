;CLASS SHAPE
(defclass shape ()
  ((x :accessor shape-x :initarg :x)
   (y :accessor shape-y :initarg :y)))

(defmethod move-to ((figure shape) new-x new-y)
  (setf (shape-x figure) new-x)
  (setf (shape-y figure) new-y))

(defmethod r-move-to ((figure shape) delta-x delta-y)
   (setf (shape-x figure) (+ delta-x (shape-x figure)))
   (setf (shape-y figure) (+ delta-y (shape-y figure))))
(defmethod draw ((figure shape)))


;CLASS RECTANGLE

(defclass rectangle (shape)
  ((width :accessor rectangle-width :initarg :width)
   (height :accessor rectangle-height :initarg :height)))

(defmethod draw ((figure rectangle))
  (format t "~&Drawing a Rectangle at:(~a,~a), width ~a, height ~a~%"
    (shape-x figure)
    (shape-y figure)
    (rectangle-width figure)
    (rectangle-height figure)))

(defmethod set-width ((figure rectangle) new-width)
  (setf (rectangle-width figure) new-width))

(defmethod set-height ((figure rectangle) new-height)
  (setf (rectangle-height figure) new-height))


;CLASS CIRCLE 
(defclass circle (shape)
  ((radius :accessor circle-radius :initarg :radius)))

(defmethod draw ((figure circle))
  (format t "~&Drawing a Circle at:(~a,~a), radius ~a~%"
    (shape-x figure)
    (shape-y figure)
    (circle-radius figure)))

(defmethod set-radius ((figure circle) new-radius)
  (setf (circle-radius figure) new-radius))

;CLASS SQUARE
(defclass square(rectangle)
((size :accessor get-size :initarg :size)))

(defmethod draw ((figure square))
  (format t "~&Drawing a SQUARE at:(~a,~a), radius ~a~%"
    (shape-x figure)
    (shape-y figure)
    (get-size figure))
)
(defmethod draw :after ((figure shape))
  (format t "Je suis le draw after~%")
)


(defmethod draw :before ((figure shape))
  (format t "Je suis le draw before~%")
)

;(defmethod draw :around ((figure shape))
;  (format t "Je suis le draw around~%")
;)

(defmethod set-size ((figure square) new-radius)
  (setf (get-size figure) new-radius))

(defclass recircle(square circle)
(()))

(defgeneric draww(shape)
(:method-combination progn))

(defmethod draww progn ((square square))
 (format t "je suis un carre~%")
)

(defmethod draww progn ((circle circle))
 (format t "je suis un cercle~%")
)

;(defmethod draww progn ((rectangle rectangle))
; (format t "je suis un rectangle~%")
;)

; Test the code

(defun polymorph()
 (let ((scribble) (a-rectangle)))

  (setf scribble
      (list ;(make-instance 'rectangle :x 10 :y 20 :width 5 :height 6)
            ;(make-instance 'circle :x 15 :y 25 :radius 8)
            ;(make-instance 'square :x 66 :y 66 :size 12)
            (make-instance 'recircle :x 66 :y 66 :size 12 :radius 10)))

(dolist (a-shape scribble)
 (draww a-shape)
 (draw a-shape)
 (r-move-to a-shape 100 100)
 (draw a-shape))

(setf a-rectangle (make-instance 'rectangle :x 0 :y 0 :width 15 :height 15))

(set-width a-rectangle 30)
(draw a-rectangle)
)

(polymorph)
