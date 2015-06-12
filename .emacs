(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(display-time-mode t)
 '(font-use-system-font t)
 '(org-agenda-files nil)
 '(org-agenda-skip-deadline-if-done t)
 '(org-todo-keywords (quote ((sequence "TODO" "DONE" "DELY" "CANL"))))
 '(scroll-bar-mode nil)
 '(semantic-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Migu 1P" :foundry "unknown" :slant normal :weight bold :height 90 :width normal)))))

(setq org-agenda-files (list "~/MyDocument/org-files/GTD.org"))
(setq org-default-notes-file "~/MyDocument/org-files/GTD.org")
;(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
;(global-set-key "\C-cb" 'org-iswitchb)
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w)" "HOLD(h)" "|" "CANCELLED(c)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(global-linum-mode 1)
(global-set-key [(meta g)] 'goto-line)
(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "<M-tab>") 'other-window)
(global-set-key (kbd "<f9>") 'compile)



;;yasnippet
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0/")
(require 'yasnippet)
(require 'dropdown-list)
(setq yas/prompt-functions 
      '(yas/dropdown-prompt yas/completing-prompt yas/ido-prompt yas/no-prompt))
(yas/global-mode 1)
(yas/minor-mode-on)
(yas/load-directory "~/.emacs.d/elpa/yasnippet-0.8.0/snippets/")

(defalias 'yas/get-snippet-tables 'yas--get-snippet-tables)
(defalias 'yas/table-hash 'yas--table-hash)
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20150408.1132/")
(add-to-list 'load-path "~/.emacs.d/elpa/popup-20150315.612/")
(add-to-list 'load-path "~/.emacs.d/elpa/fuzzy-20150315.619/")
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-c-headers-20140325.835/")
(require 'auto-complete-config)
(require 'auto-complete-c-headers)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20150408.1132/dict")
(ac-config-default)
(setq ac-use-menu-map t)
(define-key ac-mode-map (kbd "M-/") 'auto-complete)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(delq 'ac-source-yasnippet ac-sources)

(setq ac-sources '(
	      ac-source-filename
	      ac-source-functions
	      ac-source-yasnippet
	      ac-source-variables
	      ac-source-symbols
	      ac-source-features
	      ac-source-abbrev
	      ac-source-words-in-same-mode-buffers
	      ac-source-c-headers
	      ac-source-dictionary))

;; ;(add-to-list 'ac-sources 'ac-source-c-headers)
;; ;(add-to-list 'ac-sources 'ac-source-yasnippet)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


(add-to-list 'load-path "~/.emacs.d/elpa/evil-20150511.146/")
(require 'evil)
(evil-mode t)
;(defalias 'evil-insert-state 'evil-emacs-state)
;; 这两句让esc可以退出evil-emacs-state
(evil-define-state emacs
  "Emacs state that can be exited with rhe escape key "
  :tag " <EE> "
  :message " --EMACS WITH ESCAPE-- "
  :input-method t
  )
(defadvice evil-insert-state (around emacs-state-instead-of-insert-state activate) (evil-emacs-state))
(setcdr evil-insert-state-map nil);;这三句让 evil-emacs-state 替换evil-insert-mode.并让esc退出到evil-normal-mode
(define-key evil-insert-state-map (read-kbd-macro evil-toggle-key)  'evil-emacs-state)
(define-key evil-emacs-state-map [escape] 'evil-normal-state)
;(setq evil-insert-state-map (make-sparse-keymap))
;(define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)

;; ;; (Global-set-key [(control tab)] 'senator-completion-menu-popup) ;; use C-c , SPC instead
;; ;; (global-set-key [(control tab)] 'semantic-ia-complete-symbol)
;; ;; (global-set-key [(control tab)] 'semantic-ia-complete-symbol-menu) ;
;; (global-set-key [f12] 'semantic-ia-fast-jump)
;; (global-set-key [M-tab] 'other-window)
;; (global-set-key (kbd "<f5>") 'shell)
;; (global-set-key (kbd "<f9>") 'compile)

;;  ;;代码折叠
;; (setq auto-mode-alist (cons '("\\.c$" . c++-mode) auto-mode-alist))
;; (setq auto-mode-alist (cons '("\\.h$" . c++-mode) auto-mode-alist))

;; (add-hook 'c++-mode-hook '(lambda()
;; 			    (hs-minor-mode 1)
;; 			    (define-key hs-minor-mode-map (kbd "TAB") 'hs-toggle-hiding)
;; 			    (define-key hs-minor-mode-map (kbd "C--") 'hs-hide-all)
;; 			    (define-key hs-minor-mode-map (kbd "C-=") 'hs-show-all)
;; 			    ))

;; (add-hook 'dired-mode-hook (lambda ()
;;    ;;; W -> use emacs-w3m to browse the file of current line
;;    (define-key dired-mode-map (kbd "W") 'my-browse-with-emacs-w3m)
;;    ))
  
;; (defun my-browse-with-emacs-w3m ()
;;    (interactive)
;;    (let ((file (dired-get-file-for-visit)))
;;      (w3m-browse-url file))) 
;; (put 'upcase-region 'disabled nil)



;(require 'ace-jump-mode)
;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
