;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  FSF Emacs 20/21 $BMQ(B $B%f!<%6@_Dj%U%!%$%k$N%5%s%W%k(B
;;            MATSUBAYASHI 'Shaolin' Kohji (shaolin@vinelinux.org)
;;                      modified by Jun Nishii <jun@vinelinux.org>
;;                      modified by Daisuke SUZUKI <daisuke@vinelinux.org>
;;            $Id: .emacs.el,v 1.35 2004/07/26 08:10:57 daisuke Exp $
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  $B%7%9%F%`$N%"%C%W%0%l!<%I;~$K$3$N%U%!%$%k$r<+F0E*$K99?7$7$?$$>l9g$O(B
;;  $B$3$N%U%!%$%k$rJQ99$;$:$K(B .emacs.my.el $B$K5-=R$7$F$/$@$5$$!#(B

;;;

(setq user-full-name "ENDO Yasuyuki")
(setq user-mail-address "yasuyuki@javaopen.org")
(setenv "CVS_RSH" "ssh")

;; Gauche development environment

(setq scheme-program-name "gosh")

;; gauche-mode
(put 'and-let* 'scheme-indent-function 1)
(put 'begin0 'scheme-indent-function 0)
(put 'call-with-client-socket 'scheme-indent-function 1)
(put 'call-with-input-conversion 'scheme-indent-function 1)

(put 'call-with-input-file 'scheme-indent-function 1)
(put 'call-with-input-process 'scheme-indent-function 1)
(put 'call-with-input-string 'scheme-indent-function 1)
(put 'call-with-iterator 'scheme-indent-function 1)
(put 'call-with-output-conversion 'scheme-indent-function 1)
(put 'call-with-output-file 'scheme-indent-function 1)
(put 'call-with-output-string 'scheme-indent-function 0)
(put 'call-with-temporary-file 'scheme-indent-function 1)
(put 'call-with-values 'scheme-indent-function 1)
(put 'dolist 'scheme-indent-function 1)
(put 'dotimes 'scheme-indent-function 1)
(put 'entry-lambda 'scheme-indent-function 1)
(put 'if-match 'scheme-indent-function 2)
(put 'let*-values 'scheme-indent-function 1)
(put 'let-args 'scheme-indent-function 2)
(put 'let-keywords* 'scheme-indent-function 2)
(put 'let-match 'scheme-indent-function 2)
(put 'let-optionals* 'scheme-indent-function 2)
(put 'let-syntax 'scheme-indent-function 1)
(put 'let-values 'scheme-indent-function 1)
(put 'let/cc 'scheme-indent-function 1)
(put 'let1 'scheme-indent-function 2)
(put 'letrec-syntax 'scheme-indent-function 1)
(put 'make 'scheme-indent-function 1)
(put 'multiple-value-bind 'scheme-indent-function 2)
(put 'parameterize 'scheme-indent-function 1)
(put 'parse-options 'scheme-indent-function 1)
(put 'receive 'scheme-indent-function 2)
(put 'rxmatch-case 'scheme-indent-function 1)
(put 'rxmatch-cond 'scheme-indent-function 0)
(put 'rxmatch-if  'scheme-indent-function 2)
(put 'rxmatch-let 'scheme-indent-function 2)
(put 'syntax-rules 'scheme-indent-function 1)
(put 'unless 'scheme-indent-function 1)
(put 'until 'scheme-indent-function 1)
(put 'when 'scheme-indent-function 1)
(put 'while 'scheme-indent-function 1)
(put 'with-builder 'scheme-indent-function 1)
(put 'with-error-handler 'scheme-indent-function 0)
(put 'with-error-to-port 'scheme-indent-function 1)
(put 'with-input-conversion 'scheme-indent-function 1)
(put 'with-input-from-port 'scheme-indent-function 1)
(put 'with-input-from-process 'scheme-indent-function 1)
(put 'with-input-from-string 'scheme-indent-function 1)
(put 'with-iterator 'scheme-indent-function 1)
(put 'with-module 'scheme-indent-function 1)
(put 'with-output-conversion 'scheme-indent-function 1)
(put 'with-output-to-port 'scheme-indent-function 1)
(put 'with-output-to-process 'scheme-indent-function 1)
(put 'with-output-to-string 'scheme-indent-function 1)
(put 'with-port-locking 'scheme-indent-function 1)
(put 'with-string-io 'scheme-indent-function 1)
(put 'with-time-counter 'scheme-indent-function 1)
(put 'with-signal-handlers 'scheme-indent-function 1)

(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)
(defun match-paren (arg)
        "Go to the other matching parenthesis."
        (interactive "p")
        (cond ((looking-at "\\s\(") (forward-list 1)(backward-char 1))
              ((looking-at "\\s\)") (forward-char 1)(backward-list 1))))
(global-set-key "\M-p" 'match-paren)

(if (fboundp 'global-font-lock-mode) (global-font-lock-mode t))
(if (fboundp 'show-paren-mode) (show-paren-mode 1))
(setq show-paren-style 'mixed)

(setq auto-mode-alist
        (append '(("\\.scm$" . scheme-mode)
                  ("\\.stk$" . scheme-mode)
                  ("\\.stklos$" . scheme-mode))
                auto-mode-alist))

(defun goshr (args)
  "Gauche ref"
  (interactive "p")
  (progn
     (info "gauche-refj.info")
  ))

(defun gosh (args)
  "run gosh"
  (interactive "p")
  (progn
	(split-window-vertically)
	(other-window 1)
	(run-scheme scheme-program-name)
	(other-window 1)
	(enlarge-window 12)
   ))

(defun goshi (args)
  "run gosh with info"
  (interactive "p")
  (progn
	(split-window-horizontally)
	(other-window 1)
	(info "gauche-refj.info")
	(other-window 1)
          (split-window-vertically)
          (other-window 1)
          (run-scheme scheme-program-name)
          (other-window 2)
          (enlarge-window 12)
  ))

(defun gauche-info-index (topic)
  (interactive
   (list (read-string
	  (concat "Gauche help topic : ")
          (current-word))))
  (switch-to-buffer-other-window (get-buffer-create "*info*"))
  (info "/usr/local/share/info/gauche-refe.info.gz")
  (Info-index topic))

(define-key global-map "\C-xj" 'gauche-info-index)

;;; $B=i4|@_Dj%U%!%$%k$N;XDj(B

(setq user-init-file "~/.emacs.el")


;;; $B%^%/%m%5!<%A%Q%9$NDI2C(B
;;; ~/lib/emacs $B0J2<$K%f!<%6MQ$N(B *.el, *.elc $B$rCV$/$3$H$,$G$-$^$9(B
(setq load-path (append '("~/lib/emacs") load-path))

;; Marmalade
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; clojure-mode
(require 'clojure-mode)

;; paredit
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

;; trump
;; tramp
(require 'tramp)

;; css-mode

(autoload 'css-mode "css-mode")
(setq auto-mode-alist (cons '("\\.css$" . css-mode) auto-mode-alist))

;; mic-paren

;;(require 'mic-paren)
;;(paren-activate)
;;(setq paren-match-face 'bold)
;;(setq paren-sexp-mode t)

;;; kahua

(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

(require 'kahua)
(setq auto-mode-alist
      (append '(("\\.scm\\'" . scheme-mode)
		("\\.kahua\\'" . scheme-mode))
	      auto-mode-alist))


;;; ECMAScript

(autoload 'ecmascript-mode "ecmascript-mode" "ECMAScript" t)

(setq auto-mode-alist
      (append '(("\\.js$" . ecmascript-mode))
      	      auto-mode-alist))

;;; Erlang
;; (setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.7.2/emacs/" load-path))
;; (setq erlang-root-dir "/usr/local/lib/erlang")
;; (setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
;; (require 'erlang-start)

;;; $B8@8l4D6-$N;XDj(B

(set-language-environment "Japanese")

;;; $B4A;z%3!<%I$N@_Dj(B

;;(set-default-coding-systems 'euc-jp)
;;(set-buffer-file-coding-system 'euc-jp-unix)
;;(set-terminal-coding-system 'euc-jp)
;;(set-keyboard-coding-system 'euc-jp)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-coding-systems 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
;;(set-clipboard-coding-system 'utf-8)
;;(set-buffer-process-coding-system 'utf-8)
;(setq process-coding-system-alist
;      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
;(add-hook 'scheme-mode-hook
;	  '(lambda ()
;             (set-buffer-file-coding-system 'utf-8)))
(add-hook 'inferior-scheme-mode-hook
          '(lambda ()
             (set-buffer-process-coding-system 'utf-8 'utf-8)))

;;; emacsclient $B%5!<%P$r5/F0(B
(server-start)

;; $B4D6-JQ?t(B EMACS_IME $B$rD4$Y$k!#(B
;; EMACS_IME $B$,$J$1$l$P(B canna $B$r;HMQ$9$k(B

(setq emacs-ime (getenv "EMACS_IME"))
(if (null emacs-ime)
    (setq emacs-ime "canna"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; X $BHG(B Emacs $B$N%U%)%s%H(B/$B%+%i!<@_Dj(B
;; .emacs-faces.el, .emacs-fontset.el $B;2>H(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs-faces.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacs-21 $B$N@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(cond
 ((>= emacs-major-version 21)
 
 ;;; $B%a%K%e!<%P!<$r>C$9(B
 ;(menu-bar-mode nil)
 ;;; $B%D!<%k%P!<$r>C$9(B
 (tool-bar-mode 0)
 ;;; cursor $B$N(B blink $B$r;_$a$k(B
 ;(blink-cursor-mode nil) 
 ;;; $BI=<($N9T4V$r3H$2$k(B
 ;(set-default 'line-spacing 2)
 ;;; active $B$G$J$$(B window $B$N6u(B cursor $B$r=P$5$J$$(B
 (setq cursor-in-non-selected-windows nil)
 ;;; $B%U%)%s%H$N%9%1!<%k$r$7$J$$(B
 (setq scalable-fonts-allowed nil)
 ;;; [Home] Key $B$H(B [End] Key $B$r=>Mh$NF0:n$KLa$9(B
 (define-key global-map [home] 'beginning-of-buffer)
 (define-key global-map [end] 'end-of-buffer)

 ;;; image.el $B$K$*$1$k(B JPEG $B$NH=Dj4p=`$r4K$a$k(B
 ;;(eval-after-load "image"
 ;; '(setq image-type-regexps
 ;;   (cons (cons "^\377\330" 'jpeg) image-type-regexps)))

 ;;; $BI=<($N9T4V$r3H$2$k(B
 (setq line-spacing 2)

 ;;; $BF|K\8l%a%K%e!<%P!<(B
 ;;(if (equal (substring (concat (getenv "LANG") "__") 0 2) "ja")
 ;;    (load "menu-tree"))
))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Egg (Wnn $B%U%m%s%H%(%s%I(B) $B$N@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Wnn6/FreeWnn
;; (if (or (equal emacs-ime "wnn")
;;         (equal emacs-ime "Wnn")
;;         (equal emacs-ime "wnn6")
;;         (equal emacs-ime "Wnn6"))
;;     (progn
;;       (if (>= emacs-major-version 21)

;;       (progn

;;          ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 	 ;;emacs-dl-wnn$B$G$J$$$H$-$N@_Dj(B( emacs-21 + tamago v4)

;; 	 (global-set-key "\C-\\" 'toggle-input-method)
;; 	 (load "egg")
	 
;; 	 ;; InputMethod $B$N@_Dj(B
;; 	 ;; emacs $B5/F0;~(B ASCII
;; 	 ;;(setq default-input-method "japanese-egg-wnn")
;; 	 ;; emacs $B5/F0;~$+$iF|K\8lF~NO(B
;; 	 (set-input-method "japanese-egg-wnn")
	 
;; 	 ;; jserver$B$N;XDj(B
;; 	 ;; jserver $B$N%j%9%H$r<!$NMM$K$7$F;XDj$G$-$^$9(B
;; 	 ;;(setq jserver-list '("vanilla" "espresso"))
;; 	 (setq jserver-list (list (getenv "JSERVER") "localhost"))


;; 	 ;;--------------------------------------------------------
;; 	 ;; tamago v4
;; 	 ;;--------------------------------------------------------
;; 	 ;; $BA4HL(B
	 
;; 	 ;;(setq egg-default-startup-file "eggrc-wnn") ; 95.6.1 by S.Tomura
;; 	 (garbage-collect)
	 
;; 	 ;; "nn" $B$G!V$s!W$rF~NO(B
;; 	 (setq enable-double-n-syntax t)
	 
;; 	 ;; "." $B$G!V(B.$B!W!"(B"," $B$G!V(B,$B!W$rF~NO!#(B
;; 	 (setq use-kuten-for-period nil)
;; 	 (setq use-touten-for-comma nil)
	 
;; 	 )
       
;;        ;; emacs-dl-wnn $B$N>l9g(B (emacs-20)
;;        (progn
;; 	 (autoload 'egg "egg" "Initialize EGG." t)
;; 	 (egg)
;; 	 (global-set-key "\C-\\" 'toggle-egg-mode)
;; 	 (define-key isearch-mode-map "\C-\\" 'isearch-fep-egg)
;; 	 (autoload 'toggle-egg-mode "egg" "Initialize EGG." t)
;; 	 (autoload 'isearch-fep-egg "isearch-ext"
;; 	   "Read string for incremental search by using egg." t)
	 
;; 	 (setq egg-default-startup-file "eggrc-wnn") ; 95.6.1 by S.Tomura
;; 	 (garbage-collect)
	 
;; 	 ;; jserver $B$N%j%9%H$r<!$NMM$K$7$F;XDj$G$-$^$9(B
;; 	 ;;(setq jserver-list '("vanilla" "espresso"))
;; 	 (setq jserver-list (list (getenv "JSERVER") "localhost"))
	 
;; 	 ;; "nn" $B$G!V$s!W$rF~NO(B
;; 	 (setq enable-double-n-syntax t)
	 
;; 	 ;; "." $B$G!V(B.$B!W!"(B"," $B$G!V(B,$B!W$rF~NO!#(B
;; 	 (setq use-kuten-for-period nil)
;; 	 (setq use-touten-for-comma nil)
	 
;; 	 ;; 1234567890%#%"' $B$r!VH>3Q!W$GF~NO(B"
;; 	 (let ((its:*defrule-verbose* nil))
;; 	   (its-define-mode "roma-kana")
;; 	   (dolist (symbol '("1" "2" "3" "4" "5"
;; 			     "6" "7" "8" "9" "0"
;; 			     "#" "%" "\"" "'" ))
;; 	     (its-defrule symbol symbol)))
	 
;; 	 )
;;        )
;;       )
;;   )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Wnn7Egg (Wnn7 $B%U%m%s%H%(%s%I(B) $B$N@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (if (or (equal emacs-ime "wnn7")
;;         (equal emacs-ime "Wnn7"))
;;     (progn
;;       (setq load-path (append '("/usr/share/wnn7/elisp/emacs20") load-path))
;;       (global-set-key "\C-\\" 'toggle-input-method)
;;       ;; canna like toggle keybind
;;       ;;(global-set-key "\C-o" 'toggle-input-method)
;;       (load "wnn7egg-leim")
;;       (set-input-method "japanese-egg-wnn7")
;;       (set-language-info "Japanese" 'input-method "japanese-egg-wnn7")

;;       ;; "nn" $B$G!V$s!W$rF~NO(B
;;       (setq enable-double-n-syntax t)
;;       ;; $B8uJdA*Br%b!<%I(B
;;       (egg-use-input-predict)
;;       (setq egg-predict-realtime nil)
;;       ;; $B%$%s%i%$%s8uJdA*Br%b!<%I(B
;;       (setq egg-predict-mode "inline")
;;       ;; $B%&%$%s%I%&8uJdA*Br%b!<%I(B
;;       ;(setq egg-predict-mode "window")

;;       ;; $B8uJd%j%9%HI=<((B
;;       (define-key wnn7-henkan-mode-map " " 'wnn7-henkan-select-kouho-dai)

;;       ;; 1234567890%#%"'/\| $B$r!VH>3Q!W$GF~NO(B
;;       (let ((its:*defrule-verbose* nil))
;;         (its-define-mode "roma-kana")
;;         (dolist (symbol '("1" "2" "3" "4" "5" 
;;                           "6" "7" "8" "9" "0"
;;                           "#" "%" "\"" "'" "/" "\\" "|"))
;;                 (its-defrule symbol symbol)))
;;     )
;; )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B$+$s$J$N@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (if (or (equal emacs-ime "canna")
;; 	(equal emacs-ime "Canna")
;; 	(equal emacs-ime "canna-tamago"))

;;     (progn
;;     (if (and (or (and (boundp 'CANNA) CANNA)
;; 		 (<= emacs-major-version 20))
;; 	     (not (equal emacs-ime "canna-tamago")))
;; 	(progn
;; 	  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 	  ;; emacs-dl-canna/emcws $B$N>l9g(B
	  
;; 	  (load-library "canna")
	  
;; 	  ;; color-mate $B$r;H$o$J$$$G!"4A;zJQ49$K?'$rIU$1$?$$;~$K(B
;; 	  ;(setq canna-use-color t)
	  
;; 	  ;; $B%U%'%s%9%b!<%I$G$J$/%"%s%@!<%i%$%s$r;H$&(B
;; 	  ;;(setq canna-with-fences nil)
;; 	  ;;(setq canna-underline t)
	  
;; 	  ;; Canna $B%5!<%P$N;XDj(B
;; 	  (if (null (getenv "CANNA_SERVER"))
;; 	      (setq canna-server "unix")
;; 	    (setq canna-server (getenv "CANNA_SERVER")))
;; 	  (canna)
	  
;; 	  ;; Canna $B$r(B Ctrl-\ $B$G5/F0$7$^$9!#%3%a%s%H%"%&%H$9$l$P!"(B
;; 	  ;; Ctrl-\ $B$G(B skk $B$,N)$A>e$,$j$^$9!#(B
;; 	  (global-set-key "\C-\\" 'canna-toggle-japanese-mode)
;; 	  (global-set-key "\C-o" 'canna-toggle-japanese-mode)
	  
;; 	  (global-set-key "\C-_" 'canna-undo)  ;$B%"%s%I%%$N@_Dj!#(B
;; 	  (setq canna-save-undo-text-predicate ;$B%"%s%I%%%P%C%U%!$XF~$l$k>r7o(B
;; 		'(lambda (s) (> (length (car s)) 2)) )
;; 	  (setq canna-undo-hook ;$B%"%s%I%%!\&A!#(B
;; 		'(lambda () (message "$B:FJQ49$7$^$9(B....")                          
;; 		   (canna-do-function canna-func-henkan)) )
	  
;; 	  ;;$B$+$s$J$NJQ49Cf$K(B BS & DEL $B$r;H$&(B
;; 	  (define-key canna-mode-map [backspace] [?\C-h])
;; 	  (define-key canna-mode-map [delete] [?\C-h])
	  
;; 	  ;;$B$+$s$J$NJQ49Cf$K(B C-h $B$r;H$&(B (with term/keyswap)
;; 	  (define-key canna-mode-map [?\177] [?\C-h])
;; 	  ))
  
;;     (if (or (and (not (and (boundp 'CANNA) CANNA))
;; 		 (>= emacs-major-version 21))
;; 	    (equal emacs-ime "canna-tamago"))
;; 	(progn
;; 	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 	   ;; emacs-dl-canna/emcws $B$G$J$$$H$-(B (tamago4)
	   
;; 	   ;; Canna $B%5!<%P$N;XDj(B
;; 	   (if (null (getenv "CANNASERVER"))
;; 	       (setq canna-server "localhost")
;; 	     (setq canna-server (getenv "CANNASERVER")))
	   
;; 	   ;; InputMethod $B$N@_Dj(B
;; 	   (setq default-input-method "japanese-egg-canna")
	   
;; 	   ;; tamago v4 $B6&DL@_Dj(B
	   
;; 	   (setq
;; 	    ;; $B2?2sJQ49$9$k$H!J<+F0E*$K!K<-=q$KH?1G$9$k$+(B
;; 	    wnn-auto-save-dictionaries 1
;; 	    ;; nil $B$K$9$k$H!"(Balphanumeric $B$,H>3QF~NO$K$J$k$i$7$$!#(B
;; 	    its-enable-fullwidth-alphabet nil
;; 	    ;; Backspace $B$G>C$9$H$-$K!"$+$J$rF~NO$7$?%m!<%^;z$KE83+$7$F(B
;; 	    ;; $B%m!<%^;zC10L$G>C$9!)(B
;; 	    its-delete-by-keystroke t
;; 	    ;; $B30$9$HA`:nJ}K!$,JQ$o$k$_$?$$$G$9!#$h$/J,$+$j$^$;$s!#(B
;; 	    egg-mode-preference t
;; 	    ;; "nn" $B$G!V$s!W$rF~NO(B
;; 	    enable-double-n-syntax t
;; 	    ;; "." $B$G!V!%!W!"(B"," $B$G!V!$!W$rF~NO!#(B 
;; 	    use-kuten-for-period nil
;; 	    use-touten-for-comma nil
;; 	    ;; $B8uJd$N:G8e$^$G9T$C$?$i@hF,$KLa$k(B
;; 	    egg-conversion-wrap-select t
;; 	    ;; $B8uJd0lMw$rI=<($9$k$^$G$NJQ492s?t!"(B0$B$GHsI=<((B
;; 	    egg-conversion-auto-candidate-menu 2)
	   
;; 	   ;; F7 $B$G(B toroku-region
;; 	   (global-set-key [f7] 'egg-toroku-region)

;; 	   ;; egg-canna.el
;; 	   (add-hook 'canna-load-hook '(lambda () (load "egg-canna")))
	   
;; 	   ;; Canna $BMQ@_Dj(B (Canna $BIw%-!<@_Dj(B)
;; 	   ;;(load "its")
;; 	   ;;(define-key global-map "\C-o" 'toggle-input-method)
;; 	   ;;(define-key isearch-mode-map "\C-o" 'isearch-toggle-input-method)
;; 	   ;;(define-key its-mode-map "\C-h" 'its-delete-backward-SYL)
;; 	   ;;(define-key its-mode-map "\C-p" 'its-hiragana)
;; 	   ;;(define-key its-mode-map "\C-y" 'its-hiragana)
;; 	   ;;(define-key its-mode-map "\C-n" 'its-katakana)
;; 	   ;;(define-key its-mode-map [up] 'its-hiragana)
;; 	   ;;(define-key its-mode-map [down] 'its-katakana)
;; 	   ;;(cond ((eq window-system 'x)
;; 	   ;;	  (define-key its-mode-map [henkan] 'its-kick-convert-region)
;; 	   ;;	  (define-key its-mode-map [hiragana-katakana] 'its-katakana)
;; 	   ;;	  (define-key its-mode-map [muhenkan] 'its-hiragana)
;; 	   ;;	  (define-key its-mode-map [f6] 'its-hiragana)
;; 	   ;;	  (define-key its-mode-map [f7] 'its-katakana)
;; 	   ;;	  (define-key its-mode-map [f8] 'its-half-width)
;; 	   ;;	  (define-key its-mode-map [backspace] 'its-delete-backward-SYL)
;; 	   ;;	  ;(define-key menudiag-mode-map [backspace] 'menudiag-exit-one-level)
;; 	   ;;	  (define-key its-mode-map [delete] 'its-delete-SYL))
;; 	   ;;	 ((null window-system)
;; 	   ;;	  (define-key its-mode-map "\e[17~" 'its-hiragana)
;; 	   ;;	  (define-key its-mode-map "\e[18~" 'its-katakana)
;; 	   ;;	  (define-key its-mode-map "\e[19~" 'its-half-width)
;; 	   ;;	  (define-key its-mode-map [8] 'its-delete-backward-SYL)
;; 	   ;;	  ;(define-key menudiag-mode-map [8] 'menudiag-exit-one-level)
;; 	   ;;	  (define-key its-mode-map "\e[3~" 'its-delete-SYL)))
;; 	   )
;;       )
;;     )
;;   )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Atok for X $B$N@_Dj(B
;;  IIIMP $B7PM3$G<B9T$7$^$9(B
;; ($BMW(B MULE-UCS, IIIMECF)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (if (equal emacs-ime "atokx")
;;     (progn

;;       (require 'un-define)      
;;       (setq coding-category-utf-8 'utf-8)

;;       (setq iiimcf-server-control-hostlist '("localhost"))
;;       (setq iiimcf-server-control-default-language "ja")
;;       (setq default-input-method 'iiim-server-control)
;;       (require 'iiimcf-sc)

;;       ;; $BJQ49%H%0%k$N@_Dj(B
;;       (define-key global-map "\C-\\" 'toggle-input-method)

;;       ;;$B%b!<%I%i%$%sI=<($r$9$C$-$j$H(B
;;       ;;(setcar default-mode-line-format "")

;;       )
;;   )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Anthy $B$N@_Dj(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (or (equal emacs-ime "anthy")
        (equal emacs-ime "Anthy"))
    (progn
      (require 'anthy)
      ;; $BJQ493+;O%-!<(B
      (define-key global-map "\C-\\" 'anthy-mode)
      (define-key global-map "\C-o" 'anthy-mode)
      (define-key global-map [kanji] 'anthy-mode)
      (define-key global-map [M-kanji] 'anthy-mode)
    )
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SKK-9.6m 
;;   Mule $B>e$N2>L>4A;zJQ49%7%9%F%`(B SKK $B$N@_Dj(B
;;   C-x t $B$G%A%e!<%H%j%"%k$,5/F0$7$^$9(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;; $B;HMQ$9$k<-=q$N@_Dj(B ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; SKK-JISYO.L $B$r%a%b%j>e$KFI$_9~$s$GMxMQ$9$k>l9g(B
;;(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")

;;; SKK-JISYO.M $B$r%a%b%j>e$KFI$_9~$_!"(B
;;; $B8+IU$+$i$J$$>l9g$O(B skkserv $B$r5/F0$7$F(B SKK-JISYO.L $B$+$i8!:w$9$k>l9g(B
;;; (skkexdic $B%Q%C%1!<%8$,I,MW$G$9(B)
;;(setq skk-large-jisyo "/usr/share/skk/SKK-JISYO.M")
;;(setq skk-aux-large-jisyo "/usr/share/skk/SKK-JISYO.L")
;;(setq skk-server-portnum 1178)
;;(setq skk-server-host "localhost")
;;(setq skk-server-prog "/usr/libexec/skkserv")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (global-set-key "\C-x\C-j" 'skk-mode)
;; (global-set-key "\C-xj" 'skk-auto-fill-mode)
;; (global-set-key "\C-xt" 'skk-tutorial)
;; (autoload 'skk-mode "skk" nil t)
;; (autoload 'skk-auto-fill-mode "skk" nil t)
;; (autoload 'skk-tutorial "skk-tut" nil t)
;; (autoload 'skk-isearch-mode-setup "skk-isearch" nil t)
;; (autoload 'skk-isearch-mode-cleanup "skk-isearch" nil t)
;; (add-hook 'isearch-mode-hook
;; 	  (function (lambda ()
;; 		      (and (boundp 'skk-mode) skk-mode
;; 			   (skk-isearch-mode-setup) ))))
;; (add-hook 'isearch-mode-end-hook
;; 	  (function (lambda ()
;; 		      (and (boundp 'skk-mode) skk-mode
;; 			   (skk-isearch-mode-cleanup)
;; 			   (skk-set-cursor-color-properly) ))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; T-Gnus 6.13.3 ($B;29M(B)
;;   NetNews $B%j!<%@!<(B GNUS (SEMI $BBP1~HG(B)
;;   M-x gnus $B$G5/F0$7$^$9(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; News Server $BL>$d%I%a%$%sL>$rE,@Z$K;XDj$7$F$/$@$5$$(B
;(setq gnus-nntp-server "news.hoge.hoge.or.jp")
;(setq gnus-local-domain "hoge.hoge.or.jp")
;(setq gnus-local-organization "HogeHoGe Org.")
;(setq gnus-use-generic-from t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mew 3.3  -  Messaging in the Emacs World
;;   $B%a!<%k%j!<%@!<(B Mew
;;   M-x mew $B$G5/F0$7$^$9(B
;;
;;   $B8D?MMQ$N@_Dj%U%!%$%k$O(B ~/.mew.el $B$rMxMQ$7$F$/$@$5$$!#(B
;;   $B:G?7$N(B .mew.el $B$O(B /usr/share/doc/mew-common-*/vine.dot.mew $B$K$"$j$^$9!#(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

(if (file-exists-p (expand-file-name "~/.mew.el"))
    (load (expand-file-name "~/.mew.el") nil t nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; X-Face-Mule
;;   Mew $B$d(B Wanderlust $B$J$I$G!"(BX-Face $B2hA|$D$-$N%a%C%;!<%8$rI=<($7$^$9(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(if (and window-system (module-installed-p 'bitmap))
;;    (progn
;;      (require 'bitmap)
;;      (require 'x-face-mule)
;;      (mapcar (lambda (fontset)
;;                (set-fontset-font
;;                  fontset 'bitmap
;;                  "-etl-fixed-medium-r-*--16-*-100-100-m-*-bitmap.8x16-0"))
;;              (fontset-list))
;;
;;      ; for Wanderlust
;;      (setq wl-highlight-x-face-function
;;	    'x-face-decode-message-header)
;;
;;      ; for Mew
;;      (setq mew-use-highlight-x-face t)
;;      (setq mew-use-highlight-x-face-function
;;	    (function
;;	     (lambda (beg end)
;;	       (x-face-mule-x-face-decode-message-header beg end))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; irchat-pj-2.4.24.07
;;   IRC ($B%A%c%C%H(B) $B%/%i%$%"%s%H$N@_Dj(B
;;   M-x irchat $B$G5/F0$7$^$9(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'irchat "irchat" nil t)

;;; IRC server $B$N;XDj(B
;;; ($B$$$:$l$+0l$D$r%3%a%s%H%"%&%H$7$^$9(B)
;;(setq irchat-server "irc.tohoku.ac.jp")
;;(setq irchat-server "irc.kyutech.ac.jp")
;;(setq irchat-server "irc.tokyo.wide.ad.jp")
;;(setq irchat-server "irc.kyoto.wide.ad.jp")
;;(setq irchat-server "irc.huie.hokudai.ac.jp")
;;(setq irchat-server "irc.cc.yamaguchi-u.ac.jp")
;;(setq irchat-server "irc.karrn.ad.jp")
;;(setq irchat-server "irc.kyoto.wide.ad.jp")

;;; $B%f!<%6!<L>$H%K%C%/%M!<%`(B
;;; (nick $B$OH>3Q1Q?t$*$h$S(B []{}_\^ $B$+$i$J$k:GBg(B 9 $BJ8;z$NJ8;zNs$G$9(B)
(setq irchat-name "IRC sample user")
(setq irchat-nickname "VineUser")

;;; $B%G%U%)%k%H$G;22C$9$k%A%c%s%M%k$N%j%9%H(B
;;;  $B!J$3$3$K=q$$$?%A%c%s%M%k$K$O(B irchat $B$N5/F0$HF1;~$K;22C$G$-$^$9!K(B
;;(setq irchat-startup-channel-list '("#linuxjp,#vinetest"))
(setq irchat-startup-channel-list '("#vinetest"))

;;; $B%*%W%7%g%s(B
;;;   $B>\:Y$O(B /usr/doc/irchat-pj-2.4.24.07/doc $B0J2<$N%U%!%$%k$r;2>H(B
(setq irchat-reconnect-automagic t)      ; $B@Z$l$?>l9g$K:F@\B3$r;n$_$k(B
;;(setq irchat-channel-buffer-mode t)    ; $B%A%c%M%kJ,3dI=<(%b!<%I(B
;;(setq irchat-display-channel-always t)
;;(setq irchat-default-freeze-local nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YaTeX 1.72
;;   [La]TeX $BF~NO%b!<%I(B
;;   M-x yatex $B$H$9$k$+!"(B.tex $B$G=*$o$k%U%!%$%k$rFI$_9~$`$H5/F0$7$^$9(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;; YaTeX-mode
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(setq dvi2-command "xdvi"
      tex-command "platex"
      dviprint-command-format "dvips %s | lpr"
      YaTeX-kanji-code 3)

;; YaHtml-mode
(setq auto-mode-alist
      (cons (cons "\\.html$" 'yahtml-mode) auto-mode-alist))
(autoload 'yahtml-mode "yahtml" "Yet Another HTML mode" t)
(setq yahtml-www-browser "mozilla")

;; TeX source special $B$N$?$a$N@_Dj(B
;;(require 'xdvi-search) ; $BI,?\(B
;;(custom-set-variables
;; '(server-switch-hook (quote (raise-frame)))) ; $BAk$r>e$K(B
;;(custom-set-faces)
;;(add-hook 'yatex-mode-hook
;;          '(lambda ()
;;             (define-key YaTeX-mode-map "\C-c\C-j" 'xdvi-jump-to-line)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dic (eldic.el)
;;   Mule $B>e$G(B dic $B$rMxMQ$9$k$?$a$N@_Dj$G$9(B
;;   ~/lib/emacs $B$K(B /usr/doc/dic/eldic.el $B$r%3%T!<$7$F(B
;;   dic-shell-file-name $B$NJU$j$rE,@Z$K@_Dj$7$F$/$@$5$$!#(B
;;   C-c C-c C-e $B$G1QOB!"(BC-c C-c C-j $B$GOB1Q$,0z$1$^$9!#(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(global-set-key "\C-c\C-c\C-e" 'lookup-edic)
;;(global-set-key "\C-c\C-c\C-j" 'lookup-jdic)
;;(autoload 'lookup-edic "eldic" nil t)
;;(autoload 'lookup-jdic "eldic" nil t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B%[%$!<%k%^%&%9BP1~(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)
                     
(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Liece
;;  IRC $B%/%i%$%"%s%H$G$9!#(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'liece "liece" nil t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rpm-mode
;;  RPM $B$N(B spec $B%U%!%$%k:n@.MQ%b!<%I(B
;;  ~/lib/emacs $B$K(B /usr/doc/rpm/rpm-mode.el $B$r%3%T!<$7$F0J2<$N@_Dj$r(B
;;  $B9T$C$F$/$@$5$$(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(setq auto-mode-alist (nconc '(("\\.spec" . rpm-mode)) auto-mode-alist))
;(autoload 'rpm-mode "rpm-mode" "Major mode for editing SPEC file of RPM." t) 
;(setq packager "Vine User <vine@hoge.fuga>");$B<+J,$NL>A0(B
;      (setq buildrootroot "/var/tmp");BuildRoot$B$N>l=j(B
;      (setq projectoname "Project Vine");$B%W%m%8%'%/%HL>(B 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B$=$NB>$N@_Dj(B
;;
;; $B$3$l$i$N@_Dj$rJQ99$9$k>l9g$O!"(B~/.emacs.my.el $B$K=q$/$3$H(B
;; $B$r$*A&$a$7$^$9!#(Betcskel $B%Q%C%1!<%8$N%"%C%W%G!<%H;~$K(B 
;; /etc/skel/.emacs.el $B$r$=$N$^$^>e=q$-$G$-$^$9!#(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; C-h $B$H(B Del $B$NF~$lBX$((B
;;; Help $B$,(B Shift + Ctrl + h $B$*$h$S(B Del $B$K3dEv$F$i$l!"(B
;;; $BA00lJ8;z:o=|$,(B Ctrl + h $B$K3dEv$F$i$l$^$9(B
;(load-library "term/keyswap")
;(if (eq window-system 'x)
;    (progn
;      (define-key function-key-map [delete] [8])
;      (put 'delete 'ascii-character 8)))

;;; Ctrl-H $B$rA0(B1$BJ8;z:o=|$KJQ99(B
(define-key global-map "" 'backward-delete-char)

;;; $B%9%/%m!<%k%P!<$r1&B&$KI=<($9$k(B
(set-scroll-bar-mode 'right)

;;; gz$B%U%!%$%k$bJT=8$G$-$k$h$&$K(B
(auto-compression-mode t)

;;; $B0l9T$,(B 80 $B;z0J>e$K$J$C$?;~$K$O<+F02~9T$9$k(B
;(setq fill-column 80)
;(setq text-mode-hook 'turn-on-auto-fill)
;(setq default-major-mode 'text-mode)
(setq auto-fill-mode 0)

;;; $B%9%F!<%?%9%i%$%s$K;~4V$rI=<($9$k(B
(if (>= emacs-major-version 20)
    (progn
      (setq dayname-j-alist
           '(("Sun" . "$BF|(B") ("Mon" . "$B7n(B") ("Tue" . "$B2P(B") ("Wed" . "$B?e(B")
             ("Thu" . "$BLZ(B") ("Fri" . "$B6b(B") ("Sat" . "$BEZ(B")))
      (setq display-time-string-forms
           '((format "%s$BG/(B%s$B7n(B%s$BF|(B(%s) %s:%s %s"
                     year month day
                     (cdr (assoc dayname dayname-j-alist))
                     24-hours minutes
		     load)))
      ))
(display-time)

;;; visible-bell
(setq visible-bell t)

;;; $B9THV9f$rI=<($9$k(B
(line-number-mode t)

;;; mule/emacs -nw $B$G5/F0$7$?;~$K%a%K%e!<%P!<$r>C$9(B
;(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;;; $B0u:~@_Dj(B
;(setq-default lpr-switches '("-Pepson"))
(setq-default lpr-switches '("-2P"))
(setq-default lpr-command "mpage")

;;; ps-print
(setq ps-multibyte-buffer 'non-latin-printer)
(if (>= emacs-major-version 21)
    (progn
      (require 'ps-mule)
      (defalias 'ps-mule-header-string-charsets 'ignore)))

(setq ps-landsape-mode t)
(setq ps-number-of-columns 1)

;;; $B%P%C%U%!$N:G8e$G(Bnewline$B$G?75,9T$rDI2C$9$k$N$r6X;_$9$k(B
(setq next-line-add-newlines nil)

;;; $B2hLL:G2<9T$G(B[$B"-(B]$B$r2!$7$?$H$-$N%9%/%m!<%k?t(B
;(setq scroll-step 1)
 
;;; mark $BNN0h$K?'IU$1(B
(setq transient-mark-mode t)

;;; $B:G=*99?7F|$N<+F0A^F~(B
;;;   $B%U%!%$%k$N@hF,$+$i(B 8 $B9T0JFb$K(B Time-stamp: <> $B$^$?$O(B
;;;   Time-stamp: " " $B$H=q$$$F$"$l$P!"%;!<%V;~$K<+F0E*$KF|IU$,A^F~$5$l$^$9(B
(if (not (memq 'time-stamp write-file-hooks))
    (setq write-file-hooks
          (cons 'time-stamp write-file-hooks)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B%f!<%6MQ=i4|2=%U%!%$%k(B
;; ~/.emacs.my.el $B$K8D?MMQ@_Dj$r=q$1$^$9!#(B
;; $B$3$N%U%!%$%k$rD>@\$$$8$j$?$/$J$$>l9g$O!"8D?M@_Dj$rJ,N%$7$F$/$@$5$$(B

(if (file-exists-p (expand-file-name "~/.emacs.my.el"))
    (load (expand-file-name "~/.emacs.my.el") nil t nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B$3$N%U%!%$%k$K4V0c$$$,$"$C$?>l9g$KA4$F$rL58z$K$7$^$9(B
(put 'eval-expression 'disabled nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((buffer-file-coding-system . junet-unix) (encoding . euc-jp)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
;; Local Variables:
;; mode: emacs-lisp
;; buffer-file-coding-system: junet-unix
;; End:

(put 'set-goal-column 'disabled nil)

(put 'upcase-region 'disabled nil)

(require 'php-mode)
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
    '(lambda ()
	(define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;;
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; http://glassonion.hatenablog.com/entry/2019/05/11/134135

(require 'eglot)
(define-key eglot-mode-map (kbd "M-.") 'xref-find-definitions)
(define-key eglot-mode-map (kbd "M-,") 'pop-tag-mark)
(add-to-list 'eglot-server-programs '(go-mode . ("/Users/yasuyuki/go/bin/gopls")))
(add-hook 'go-mode-hook 'eglot-ensure)

;; company-mode
(require 'company)
(global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq completion-ignore-case t)
(setq company-dabbrev-downcase nil)
(setq company-selection-wrap-around t)

(setq gofmt-command "/Users/yasuyuki/go/bin/goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(require 'go-mode)
;;
(defun my-go-mode-common-init ()
  "Golang mode set up function"
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  ;;
  )

(add-hook 'go-mode-hook 'my-go-mode-common-init)

;; Kotlin

(require 'kotlin-mode)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(put 'downcase-region 'disabled nil)

;; font
(add-to-list 'default-frame-alist '(font . "Ricty Diminished-16"))

;; web-mode
;; web-mode
(require 'web-mode)
;; ³ÈÄ¥»Ò¤ÎÀßÄê
;;(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.riot?$"	. web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx?$"      . web-mode))
;; ¥¤¥ó¥Ç¥ó¥È´Ø·¸
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   4)
  (setq web-mode-css-offset    4)
  (setq web-mode-script-offset 4)
  (setq web-mode-php-offset    4)
  (setq web-mode-java-offset   4)
  (setq web-mode-asp-offset    4)
  (setq indent-tabs-mode t)
  (setq tab-width 4))
;; https://www.ncaq.net/2018/03/01/19/13/42/
(custom-set-variables
 '(web-mode-enable-auto-quoting nil)
 '(web-mode-enable-current-column-highlight t)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-markup-indent-offset 2)
 )

(put 'web-mode-markup-indent-offset 'safe-local-variable 'integerp)
;;(with-eval-after-load 'web-mode (sp-local-pair '(web-mode) "<" ">" :actions :rem))
(add-hook 'web-mode-hook 'web-mode-hook)

;; typescript-mode
(require 'typescript-mode)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

;; yarn.el
;;(require 'yarn)
;;(global-set-key (kbd "M-n i") 'yarn-install)
;;(global-set-key (kbd "M-n n") 'yarn-init)
;;(global-set-key (kbd "M-n a") 'yarn-add)
;;(global-set-key (kbd "M-n r") 'yarn-run)
;;(global-set-key (kbd "M-n p") 'yarn-publish)
;;(global-set-key (kbd "M-n t") 'yarn-test)
;;(global-set-key (kbd "M-n v") 'yarn-version)
;;(global-set-key (kbd "M-n g") 'yarn-upgrade)
;;(global-set-key (kbd "M-n u") 'yarn-update)
