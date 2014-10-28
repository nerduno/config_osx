(add-to-list 'load-path "~/.emacs.d/lisp/")

; aa 2012.07.23: the following code installs/requires the el-get emacs package
; manager.
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))
(el-get 'sync)

; aa 2012.07.23: El-get package manager notes:
; to see packets installed by el-get-package-list (and search for installed)
; had to install auto-complete before ein.

;; aa 2012.07.23: Added the following as part of el-get install auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
(ac-config-default)
(setq ein:use-auto-complete 't)

;; aa 2012.08.20: Make truncated lines the default.
(set-default 'truncate-lines t)

;; aa 2013.02.13: enable opening recent files with c-x c-r
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


; aa 2012.07.23: replaced the following by installing EIN using el-get-install ein.
;;;;  PRIOR EIN INSTALLATION

; aa2012.07.20: installed autocomplete as EIN requirement
; downloaded tar and ran make install DIR=/Users/andalman/.emacs.d/lisp/auto-complete
; actually had to upgrade to beta version (in which popup is a separate project)
; 1. in /Code/EmacsProjects/git clone https://github.com/m2ym/auto-complete.git
; 2. download popup.el in /Code/EmacsProjects/autocomplete/
; 3. open emacs without init file open -a emacs --args -q
; 4. M-x load-file; enter /Code/EmacsProjects/autocompelte/etc/install.el; enter directory /Users/andalman/.emacs.d/lisp/auto-complete
;;(add-to-list 'load-path "/Users/andalman/.emacs.d/lisp/auto-complete/")
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "/Users/andalman/.emacs.d/lisp/auto-complete/ac-dict")
;;(ac-config-default)

; aa2012.07.20: installed markdown mode
; downloaded .el file to ~/.emacs.d/lisp and added:
;;(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t) 
;;(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

; aa2012.07.20: installed websocket as EIN requirement
; downloaded websocket.el into ~/.emacs.d/lisp and added require line:
;;(require 'websocket)

;aa2012.07.20: installed nxhtml of which MuMaMo is a part; MuMaMo is required for EIN
;rather than requiring a .el file.  nxhtml requires you run a script at startup:
;needed to update to beta version 2.09 to make EIN work...
;;(load "/Users/andalman/.emacs.d/nxhtml/autostart.el")

;aa2012.07.20: installed ein by:
;cd ~/.emacs.d/lisp
;git clone https://github.com/tkf/emacs-ipython-notebook.git
;adding the following lines:
; then compiled all .el file using : M-x byte-recompile-directory RET ~/.emacs.d
;;(add-to-list 'load-path "/Users/andalman/.emacs.d/lisp/emacs-ipython-notebook/lisp/")
;;(require 'ein)
;;;; END PRIOR EIN INSTALLATION


;;;; BELOW IS COMMENTED CODE FROM FAILED ATTEMPT TO USE 
;;;; http://pedrokroger.net/2010/07/configuring-emacs-as-a-python-ide-2/

;(add-to-list 'load-path "~/.emacs.d/lisp/python-mode.el-6.0.10/") 
;(setq py-install-directory "~/.emacs.d/lisp/python-mode.el-6.0.10/")
;(require 'python-mode)

;(setq ipython-command "/Users/andalman/Documents/Code/_virtualenvs/FishStimuli/bin/ipython")
;(require 'ipython)

;(require 'anything)
;(require 'anything-ipython)
;(when (require 'anything-show-completion nil t)
;   (use-anything-show-completion 'anything-ipython-complete
;                                 '(length initial-pattern)))

;(require 'comint)
;(define-key comint-mode-map (kbd "M-") 'comint-next-input)
;(define-key comint-mode-map (kbd "M-") 'comint-previous-input)
;(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
;(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)
