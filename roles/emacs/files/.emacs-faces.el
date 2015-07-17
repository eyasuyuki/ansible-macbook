;; �ǥե���ȤΥե���ȥ��åȤʤ�
(if (or (and window-system (>= emacs-major-version 19))
	(>= emacs-major-version 21))
    (progn

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; �ե����/������ɥ�������������

;;       (if window-system
;; 	  (progn
;; 	    (load "~/.emacs-fontset.el")
;; 	    (setq default-frame-alist
;; 		  (append
;; 		   '((font . "fontset-14") ;; �ǥե���ȥե���ȥ��å�
;; 		     ;(width . 80) (height . 40) ;; ������ɥ�������
;; 		     )
;; 		   default-frame-alist))))

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; font-lock-mode
      ;; ����Ĥ���
      (global-font-lock-mode t)
      ;; font-lock�Ǥ�������٥�
      (setq font-lock-maximum-decoration t) 
      (setq fast-lock nil)
      (setq lazy-lock nil)
      (setq jit-lock t)

      ;; hilit19 ������
      ;; �طʿ������뤤��
      ;;(setq hilit-background-mode 'light)
      ;; �طʿ����Ť���
      (setq hilit-background-mode 'dark)
      ;; hilit19 ���ɤ߹���
      ;;(require 'hilit19)
      
      ;(set-background-color "grey80")         ;; ���뤤�طʿ�(Emacs20)
      ;(set-face-background 'default "grey80") ;; ���뤤�طʿ�
      ;(set-face-foreground 'default "black")  ;; �Ť�ʸ����
      (set-background-color "#333366")         ;; ɸ����طʿ�(Emacs20)
      (set-face-background 'default "#333366") ;; ɸ����طʿ�
      (set-face-foreground 'default "white")   ;; ɸ���ʸ����
      (if (and window-system (>= emacs-major-version 21))
	  (progn
	    (set-face-background 'menu "grey94")        ;; ��˥塼
	    (set-face-background 'tool-bar "grey94")    ;; �ġ���С�
	    (set-face-background 'mode-line "grey94")   ;; �⡼�ɥ饤��
	    (set-face-background 'scroll-bar "grey94")  ;; ��������С�
	    (set-face-foreground 'tooltip "black")  ;; �ġ�����å�
	    (set-face-background 'tooltip "ghostwhite")  ;; �ġ�����å�
            ))
      (set-cursor-color "white")

      (if (not window-system)
          (progn
            ;; ��X�Ķ��Ǥο�����
            (set-face-background 'default "000000")
            (set-face-foreground 'default "ffffff")))
      )
)
