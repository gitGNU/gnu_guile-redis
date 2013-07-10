;;; (redis commands strings) --- redis module for Guile.

;; Copyright (C) 2013 Aleix Conchillo Flaque <aconchillo@gmail.com>
;;
;; This file is part of guile-redis.
;;
;; guile-redis is free software; you can redistribute it and/or
;; modify it under the terms of the GNU Lesser General Public
;; License as published by the Free Software Foundation; either
;; version 3 of the License, or (at your option) any later version.
;;
;; guile-redis is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; Lesser General Public License for more details.
;;
;; You should have received a copy of the GNU Lesser General Public
;; License along with guile-redis; if not, write to the Free Software
;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
;; 02110-1301 USA

;;; Commentary:

;; Redis module for Guile

;;; Code:

(define-module (redis commands strings)
  #:use-module (redis utils)
  #:use-module (redis commands define)
  #:export (append
            bitcount bitop
            decr decrby
            get getbit getrange getset
            incr incrby incrbyfloat
            mget mset msetnx))

(define (append key value)
  (make-command "APPEND" read-status key value))

(define* (bitcount key #:optional (start 0) (end 0))
  (make-command "BITCOUNT" read-status key start end))

(define* (bitop operation destkey key #:rest keys)
  (make-command "BITOP" read-status operation destkey key keys))

(define (decr key)
  (make-command "DECR" read-status key))

(define (decrby key decrement)
  (make-command "DECR" read-status key decrement))

(define (get key)
  (make-command "GET" read-status key))

(define (getbit key offset)
  (make-command "GETBIT" read-status key offset))

(define (getrange key start end)
  (make-command "GETRANGE" read-status key start end))

(define (getset key value)
  (make-command "GETVALUE" read-status key value))

(define (incr key)
  (make-command "INCR" read-status key))

(define (incrby key increment)
  (make-command "INCRBY" read-status key increment))

(define (incrbyfloat key increment)
  (make-command "INCRBYFLOAT" read-status key increment))

(define* (mget key #:rest keys)
  (make-command "MGET" read-status key keys))

(define* (mset key value #:rest pairs)
  (make-command "MSET" read-status key value pairs))

(define* (msetnx key value #:rest pairs)
  (make-command "MSETNX" read-status key value pairs))

(define* (psetex key milliseconds value)
  (make-command "PSETEX" read-status key milliseconds value))