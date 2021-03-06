;;; packages.el --- sourcod-email layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: willeam <willeam@hitu-willeam>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `sourcod-email-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sourcod-email/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sourcod-email/pre-init-PACKAGE' and/or
;;   `sourcod-email/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst sourcod-email-packages
  '(
    mu4e
    gnus
    )
  )

;;; Set up some common mu4e variables
(defun sourcod-email/init-mu4e()
  (use-package mu4e)
  )
(defun sourcod-email/init-gnus()
  (use-package gnus)
  )



(setq mu4e-maildir "~/mail"
      ;;mu4e-drafts-folder "/Drafts"
      ;;mu4e-sent-folder   "/Sent Messages"
      ;;mu4e-refile-folder "/Archive"
      ;;mu4e-trash-folder "/Deleted Messages"
      mu4e-get-mail-command "fetchmail"
      mu4e-update-interval nil
      mu4e-compose-signature-auto-include nil
      mu4e-view-show-images t
      mu4e-view-show-addresses t)
    ;;; Mail directory shortcuts
(setq mu4e-maildir-shortcuts
      '(("/INBOX" . ?i)
        ("/Sent Messages" . ?s)
        ("/Junk" . ?j)
        ("/Deleted Messages" . ?d)
        ))

(setq mu4e-get-mail-command "fetchmail")

;; something about ourselves
;;(setq user-mail-address "dean-chen@qq.com"
;;user-full-name  "Dean Chen"
;;mu4e-compose-signature
;;(concat
;;"Dean Chen\n"
;;"Email: dean-chen@qq.com\n"
;;"Blog: blog.csdn.net/csfreebird\n"
;;"\n")
;;mu4e-compose-signature-auto-include t
;;)

;;send mail
;;(require 'smtpmail)
;;(setq message-send-mail-function 'smtpmail-send-it
;;smtpmail-stream-type 'starttls
;;smtpmail-default-smtp-server "smtp.qq.com"
;;smtpmail-smtp-server "smtp.qq.com"
;;smtpmail-smtp-service 587)

(setq mu4e-view-show-images t)

;; save attachment to my desktop (this can also be a function)
(setq mu4e-attachment-dir "~/mail")

;; sync email from imap server
(setq mu4e-get-mail-command "fetchmail"
      mu4e-update-interval 300)
;; notifcation
(setq mu4e-enable-notifications t)
;;(mu4e-alert-enable-mode-line-display)


;;; packages.el ends here
(setq user-mail-address "zhaochunjie@sourcod.com"
      user-full-name "zhaochunjie")

(setq gnus-select-method
      '(nnimap "aliyun"
               (nnimap-address "imap.mxhichina.com")  ; it could also be imap.googlemail.com if that's your server.
               (nnimap-server-port "imaps")
               (nnimap-stream ssl)))

(setq smtpmail-smtp-server "imap.mxhichina.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")


;; set email reader
(setq gnus-secondary-select-methods '((nnml "")))

;; set pop server
(setq mail-sources
      '((pop :server "pop3.mxhichina.com"   ;; 在这里设置 pop3 服务器
             :user "zhaochunjie@sourcod.com"     ;; 用户名
             :port 995
             :password "sourcodp@ssw0rd"   ;; 密码
             :stream ssl)))

;; set smtp
(setq smtpmail-auth-credentials
      '(("smtp.mxhichina.com"                ;; SMTP 服务器
         25                                   ;; 端口号
         "zhaochunjie@sourcod.com"                 ;; 用户名
         "sourcodp@ssw0rd")))       ;; 密码


(setq smtpmail-default-smtp-server "smtp.mxhichina.com")
(setq smtpmail-smtp-server "smtp.mxhichina.com")
(setq message-send-mail-function 'smtpmail-send-it)
