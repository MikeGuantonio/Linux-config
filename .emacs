;;;Load these extensions when emacs starts
(add-to-list 'load-path "~/.elisp/")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
  (setq tramp-default-method "ssh")
  
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )



(show-paren-mode 1)
(setq show-paren-delay 0)
(cua-mode t)
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


(add-hook 'c++-mode-hook
  '(lambda ()
     (c-set-style "stroustrup")
     (setq indent-tabs-mode nil)))

;; User defined modes
;; Ruby Mode Enhanced
(add-hook 'ruby-mode-hook
      (lambda()
        (add-hook 'local-write-file-hooks
                  '(lambda()
                     (save-excursion
                       (untabify (point-min) (point-max))
                       (delete-trailing-whitespace)
                       )))
        (set (make-local-variable 'indent-tabs-mode) 'nil)
        (set (make-local-variable 'tab-width) 2)
        (imenu-add-to-menubar "IMENU")
        (define-key ruby-mode-map "\C-m" 'newline-and-indent) ;Not sure if this line is 100% right!
        (require 'ruby-electric)
        (ruby-electric-mode t)
        ))

;;; rhtml mode
(require 'rhtml-mode)
; put rhtml templates into rhtml-mode
(setq auto-mode-alist  (cons '("\\.erb$" . rhtml-mode) auto-mode-alist))
; put any rjs scripts into ruby-mode, as they are basically ruby
(setq auto-mode-alist  (cons '("\\.rjs$" . ruby-mode) auto-mode-alist))

(require 'ruby-tools)

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)