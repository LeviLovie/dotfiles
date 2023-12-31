;;; proof-indent.el --- Generic indentation for proof assistants

;; This file is part of Proof General.

;; Portions © Copyright 1994-2012  David Aspinall and University of Edinburgh
;; Portions © Copyright 2003, 2012, 2014  Free Software Foundation, Inc.
;; Portions © Copyright 2001-2017  Pierre Courtieu
;; Portions © Copyright 2010, 2016  Erik Martin-Dorel
;; Portions © Copyright 2011-2013, 2016-2017  Hendrik Tews
;; Portions © Copyright 2015-2017  Clément Pit-Claudel

;; Authors:	   Markus Wenzel, David Aspinall

;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:
;; 

;;; Code:
(require 'proof-config)			; config variables
(require 'proof-utils)			; proof-ass
(require 'proof-syntax)			; p-looking-at-safe, p-re-search
(require 'proof-autoloads)		; p-locked-end

(defun proof-indent-indent ()
  "Determine indentation caused by syntax element at current point."
  (cond
   ((proof-looking-at-safe proof-indent-open-regexp)
    proof-indent)
   ((proof-looking-at-safe proof-indent-close-regexp)
    (- proof-indent))
   (t 0)))

(defun proof-indent-offset ()
  "Determine offset of syntax element at current point."
  (cond
   ((proof-looking-at-syntactic-context)
    proof-indent)
   ((proof-looking-at-safe proof-indent-inner-regexp)
    proof-indent)
   ((proof-looking-at-safe proof-indent-enclose-regexp)
    proof-indent-enclose-offset)
   ((proof-looking-at-safe proof-indent-open-regexp)
    proof-indent-open-offset)
   ((proof-looking-at-safe proof-indent-close-regexp)
    proof-indent-close-offset)
   ((proof-looking-at-safe proof-indent-any-regexp) 0)
   ((proof-looking-at-safe "\\s-*$") 0)
   (t proof-indent)))

(defun proof-indent-inner-p ()
  "Check if current point is between actual indentation elements."
  (or
   (proof-looking-at-syntactic-context)
   (proof-looking-at-safe proof-indent-inner-regexp)
   (not
    (or (proof-looking-at-safe proof-indent-any-regexp)
	(proof-looking-at-safe "\\s-*$")))))

(defun proof-indent-goto-prev ()   ; Note: may change point, even in case of failure!
  "Goto to previous syntax element for script indentation, ignoring string/comment contexts."
  (and
   (proof-re-search-backward proof-indent-any-regexp nil t)
   (or (not (proof-looking-at-syntactic-context))
       (proof-indent-goto-prev))))

(defun proof-indent-calculate (indent inner)  ; Note: may change point!
  "Calculate indentation level at point.
INDENT is current indentation level, INNER a flag for inner indentation."
  (let*
      ((current (point))
       (found-prev (proof-indent-goto-prev)))
    (if (not found-prev) (goto-char current))   ; recover position
    (cond
     ((and found-prev (or proof-indent-hang
			  (= (current-indentation) (current-column))))
      (+ indent
	 (current-column)
	 (if (and inner (not (proof-indent-inner-p))) 0 (proof-indent-indent))
	 (- (proof-indent-offset))))
     ((not found-prev) 0)         ;FIXME mmw: improve this case!?
     (t
      (proof-indent-calculate
       (+ indent (if inner 0 (proof-indent-indent))) inner)))))


;;;###autoload
(defun proof-indent-line ()
  "Indent current line of proof script, if indentation enabled."
  (interactive)
  (unless (not (proof-ass script-indent))
	  (if (< (point) (proof-unprocessed-begin))
	      (if (< (current-column) (current-indentation))
		  (skip-chars-forward "\t "))
	    (save-excursion
	      (indent-line-to
	       (max 0 (save-excursion
			(back-to-indentation)
			(proof-indent-calculate
			 (proof-indent-offset) (proof-indent-inner-p))))))
	    (if (< (current-column) (current-indentation))
		(back-to-indentation)))))


(provide 'proof-indent)

;;; proof-indent.el ends here
