;;; floatbuf.el --- Floating buffers -*- lexical-binding: t; -*-

;;; Commentary

;;; Floating buffers for quick creation of editing in a new context, while still seeing buffers behind.

;; TODOs
;; - TODO make a floating window
;; - TODO make it opaque (optionally)
;; - TODO control where it shows up
;; default configs should be corners, middle, and then custom location..
;; - define corners or middle, and offset from said location
;; - TODO which buffer to open by default
;;    + one for terminal
;;    + current buffer
;;    + doom welcome ig... (tho current buffer satisifes this use case)



;;; Code:

(defvar floatbuf-frame-params default-frame-alist
  "Frame parameters for floating buffer.")

(defvar floatbuf--width 0.5
  "Width of floating buffer.")

(defvar floatbuf--height 0.6
  "Height of floating buffer.")

(set-frame-parameter floatbuf nil)


;; Opaque
;; Prolly should be in  private conigs... transparent terminal is not default
(push '(alpha . 100) floatbuf-frame-params)

;; Frame property
;; (push '(border-width . 5) floatbuf-frame-params)
;; Width
(push '(width . 0.5) floatbuf-frame-params)
;; Height
(push '(height . 0.6) floatbuf-frame-params)

;; NOTE: using decimals work super well
;; Left/Right
(push '(left . 1.0) floatbuf-frame-params)
;; Top/Bottom
(push '(top . 1.0) floatbuf-frame-params)


;; Present the floatbuf
(setq tester (display-buffer-in-child-frame (current-buffer) `((child-frame-parameters . ,floatbuf-frame-params))))

(defun floatbuf--make-floatbuf (width height buffer)
  "Make floating buffer displaying BUFFER with WIDTH and HEIGHT.
If WIDTH or HEIGHT is in [0, 1.0], will take up a percentage of the parent frame."
  ())

(defun floatbuf--make-floatbuf (buffer)
  "Make floting buffer with BUFFER."
  ())

(window-valid-p tester)

(window-frame tester)

(delete-frame (window-frame tester))
