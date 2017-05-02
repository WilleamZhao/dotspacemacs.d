;;; packages.el --- sourcod-org layer packages file for Spacemacs.
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
;; added to `sourcod-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sourcod-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sourcod-org/pre-init-PACKAGE' and/or
;;   `sourcod-org/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst sourcod-org-packages
  '(
   ;; org-pomodoro
    org2blog
    org-mac-link
    )
  )
;;(defun sourcod-org/init-org-pomodoro()
;;(use-package org-pomodoro)
;;)
(defun sourcod-org/init-org2blog()
  (use-package org2blog
      :init
      (progn
        (require  'metaweblog)
        (require 'org2blog-autoloads)
        (setq org2blog/wp-blog-alist
              '(("sourcod"
                 :url "http://blog.sourcod.com/xmlrpc.php"
                 :username "sourcod"
                 :default-title "My New Title"
                 :default-categories ("未分类")
                 :tags-as-categories nil)))
        (setq org2blog/wp-default-title "My New Title")
        (setq org2blog/wp-use-tags-as-categories t)
        (setq org2blog/wp-confirm-post t)
        (setq org2blog/wp-use-sourcecode-shortcode t)
        (setq org2blog/wp-sourcecode-default-params "")
        (setq org2blog/wp-track-posts '("~/workspace/wordpress" "Posts"))
        (setq org2blog/wp-keep-new-lines t)
        ;; implemented as HTML styling. Your pick!
        (setq org2blog/wp-use-sourcecode-shortcode 't)

        ;; removed light="true"
        (setq org2blog/wp-sourcecode-default-params nil)

        ;; target language needs to be in here

        (setq org2blog/wp-sourcecode-langs
              '("actionscript3" "bash" "coldfusion" "cpp" "csharp" "css" "delphi"
                "erlang" "fsharp" "diff" "groovy" "html" "javascript" "java" "javafx" "matlab"
                "objc" "perl" "php" "text" "powershell" "python" "ruby" "scala" "sql"
                "vb" "xml"
                "sh" "emacs-lisp" "lisp" "lua"))
        (setq xml-rpc-use-coding-system 'utf-8)

        (setq org2blog/wp-buffer-template
              "-----------------------
#+TITLE: %s
#+DATE: %s
#+CATEGORY: 未分类
-----------------------\n")
        ;;#+OPTIONS: %s
        ;;#+CATEGORY: %s
        ;;#+TAGS: %s
        (defun my-format-function (format-string)
          (format format-string
                  org2blog/wp-default-title
                  (format-time-string "<%Y-%m-%d>" (current-time))
                  org2blog/wp-default-categories
                  ))
        (setq org2blog/wp-buffer-format-function 'my-format-function)
        )
      :config
      (progn
        (dolist (prefix '(("mB" . "org2blog")
                          ("mBe" . "export")
                          ("mBd" . "delete")
                          ("mBP" . "post-publist")
                          ("mBo" . "post")
                          ))
          (spacemacs/declare-prefix-for-mode 'org-mode (car prefix) (cdr prefix)))
        (spacemacs/set-leader-keys-for-major-mode 'org-mode
          ;; org2blog
          "Bn"    'org2blog/wp-new-entry
          "Bde"   'org2blog/wp-delete-entry
          "Bdp"   'org2blog/wp-delete-page
          "BPw"   'org2blog/wp-post-buffer-and-publish
          "BPa"   'org2blog/wp-post-buffer-as-page-and-publish
          "BPt"   'org2blog/wp-post-subtree-as-page-and-publish
          "Bob"   'org2blog/wp-post-buffer
          "BoB"   'org2blog/wp-post-buffer-as-page
          "Bot"   'org2blog/wp-post-subtree
          "BoT"   'org2blog/wp-post-subtree-as-page
          "Bl"    'org2blog/wp-login
          "Bc"    'org2blog/wp-logout
          "Bp"    'org2blog/wp-password
          "Bc"    'org2blog/wp-confirm-post
          "Beh"   'org2blog/wp--export-as-html
          "Bep"   'org2blog/wp--export-as-post
          )
        )
      )
  )

(defun sourcod-org/init-org-mac-link ()
  (use-package org-mac-link
    :commands org-mac-grab-link
    :init
    (progn
      (add-hook 'org-mode-hook
                (lambda ()
                  (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link))))
    :defer t))

;;(setq org-clock-modeline-total 'current)
;;(setq org-timer-default-timer 25)
(defun sourcod-org-packages/post-init-org()
    (progn
      (require 'ox-publish)
      ))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Workspace")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
        ("n" "notes" entry (file+headline "~/org/notes.org" "Quick notes")
         "* %?\n  %i\n %U"
         :empty-lines 1)
        ("B" "Blog Ideas" entry (file+headline "~/org/notes.org" "Blog Ideas")
         "* TODO [#B] %?\n  %i\n %U"
         :empty-lines 1)
        ("s" "Code Snippet" entry (file "~/org/snippets.org")
         "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
        ("h" "hitu" entry (file+headline "~/org/gtd.org" "hitu")
         "* TODO [#A] %?\n  %i\n %U"
         :empty-lines 1)
        ("c" "wyxny" entry (file+headline "~/org/gtd.org" "wyxny")
         "* TODO [#B] %?\n  %i\n %U"
         :empty-lines 1)
        ("w" "work" entry (file+headline "~/org/gtd.org" "work")
         "* TODO [#B] %?\n  %i\n %U"
         :empty-lines 1)
        ("l" "links" entry (file+headline "~/org/notes.org" "link notes")
         "* TODO [#C] %?\n  %i\n %a \n %U"
         :empty-lines 1)
        ("j" "Journal Entry"
         entry (file+datetree "~/org/journal.org")
         "* %?"
         :empty-lines 1)
        ("b" "Books" entry (file+headline "~/org/books.org" "book notes")
         "* TODO [#D] %?\n  %i\n %U"
         :empty-lines 1)
        ))

(setq org-agenda-custom-commands
      '(
        ("w" . "任务安排")
        ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
        ("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
        ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
        ("wd" "不重要且不紧急的任务" tags-todo "+PRIORITY=\"D\"")
        ("b" "Blog" tags-todo "BLOG")
        ("p" . "项目安排")
        ("pw" tags-todo "PROJECT+WORK+CATEGORY=\"hitu\"")
        ("pl" tags-todo "PROJECT+DREAM+CATEGORY=\"willeam\"")
        ("W" "Weekly Review"
         ((stuck "") ;; review stuck projects as designated by org-stuck-projects
          (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
          ))))

(setq org-agenda-files (list "~/org/gtd.org"
                             "~/org/notes.org"
                             "~/org/books.org"
                             "~/org/journal.org"
                             ))

;; 发布
;;(require 'org-publish)

(setq org-publish-project-alist
      '(("org-notes"
         :base-directory "~/org/blog"
         :publishing-directory "~/org/blog/publish"
         :section-numbers nil
         :recursive t
         :publishing-function org-html-publish-to-html
         ;;org-html-publish-to-html
         :headline-levels 4
         :table-of-contents nil
         :style "<link rel=\"stylesheet\" href=\"css/style.css\"  type=\"text/css\"/>"
         :html-head "<link rel=\"stylesheet\" href=\"css/style.css\"  type=\"text/css\"/>"
         :author "willeam"
         :email "zhaochunjie@sourcod.com"
         :auto-sitemap t
         ;;:sitemap-filename "sitemap.org"
         ;;:sitemap-title "我的wiki"
         ;;:sitemap-sort-files anti-chronologically
         ;;:sitemap-file-entry-format "%t" ; %d to output date, we don't need date here
         )
        ("org-static"
         :base-directory "~/org/blog"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf|doc"
         :publishing-directory "~/org/blog/publish"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org" :components ("org-notes" "org-static"))

        ("org-51xny-notes"
         :base-directory "~/org/blog"
         :publishing-directory "~/org/blog/publish"
         :section-numbers nil
         :recursive t
         :publishing-function org-html-publish-to-html
         ;;org-html-publish-to-html
         :headline-levels 4
         :table-of-contents nil
         :style "<link rel=\"stylesheet\" href=\"css/style.css\"  type=\"text/css\"/>"
         :html-head "<link rel=\"stylesheet\" href=\"css/style.css\"  type=\"text/css\"/>"
         :author "willeam"
         :email "zhaochunjie@sourcod.com"
         :auto-sitemap t
         ;;:sitemap-filename "sitemap.org"
         ;;:sitemap-title "我的wiki"
         ;;:sitemap-sort-files anti-chronologically
         ;;:sitemap-file-entry-format "%t" ; %d to output date, we don't need date here
         )
        ("org-51xny-static"
         :base-directory "~/org/blog"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf|doc"
         :publishing-directory "~/org/blog/publish"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org-51xny" :components ("org-51xny-notes" "org-51xny-static"))
        )
      )



(advice-add 'url-http-create-request :override
            'url-http-create-request-debug)
(defun url-http-create-request-debug (&optional ref-url)
  "Create an HTTP request for <code>url-http-target-url', referred to by REF-URL."
  (let* ((extra-headers)
         (request nil)
         (no-cache (cdr-safe (assoc "Pragma" url-http-extra-headers)))
         (using-proxy url-http-proxy)
         (proxy-auth (if (or (cdr-safe (assoc "Proxy-Authorization"
                                              url-http-extra-headers))
                             (not using-proxy))
                         nil
                       (let ((url-basic-auth-storage
                              'url-http-proxy-basic-auth-storage))
                         (url-get-authentication url-http-proxy nil 'any nil))))
         (real-fname (url-filename url-http-target-url))
         (host (url-http--encode-string (url-host url-http-target-url)))
         (auth (if (cdr-safe (assoc "Authorization" url-http-extra-headers))
                   nil
                 (url-get-authentication (or
                                          (and (boundp 'proxy-info)
                                               proxy-info)
                                          url-http-target-url) nil 'any nil))))
    (if (equal "" real-fname)
        (setq real-fname "/"))
    (setq no-cache (and no-cache (string-match "no-cache" no-cache)))
    (if auth
        (setq auth (concat "Authorization: " auth "\r\n")))
    (if proxy-auth
        (setq proxy-auth (concat "Proxy-Authorization: " proxy-auth "\r\n")))

    ;; Protection against stupid values in the referrer
    (if (and ref-url (stringp ref-url) (or (string= ref-url "file:nil")
                                           (string= ref-url "")))
        (setq ref-url nil))

    ;; We do not want to expose the referrer if the user is paranoid.
    (if (or (memq url-privacy-level '(low high paranoid))
            (and (listp url-privacy-level)
                 (memq 'lastloc url-privacy-level)))
        (setq ref-url nil))

    ;; url-http-extra-headers contains an assoc-list of
    ;; header/value pairs that we need to put into the request.
    (setq extra-headers (mapconcat
                         (lambda (x)
                           (concat (car x) ": " (cdr x)))
                         url-http-extra-headers "\r\n"))
    (if (not (equal extra-headers ""))
        (setq extra-headers (concat extra-headers "\r\n")))

    ;; This was done with a call to </code>format'.  Concatenating parts has
    ;; the advantage of keeping the parts of each header together and
    ;; allows us to elide null lines directly, at the cost of making
    ;; the layout less clear.
    (setq request
          (concat
             ;; The request
             (or url-http-method "GET") " "
             (url-http--encode-string
              (if using-proxy (url-recreate-url url-http-target-url) real-fname))
             " HTTP/" url-http-version "\r\n"
             ;; Version of MIME we speak
             "MIME-Version: 1.0\r\n"
             ;; (maybe) Try to keep the connection open
             "Connection: " (if (or using-proxy
                                    (not url-http-attempt-keepalives))
                                "close" "keep-alive") "\r\n"
                                ;; HTTP extensions we support
             (if url-extensions-header
                 (format
                  "Extension: %s\r\n" url-extensions-header))
             ;; Who we want to talk to
             (if (/= (url-port url-http-target-url)
                     (url-scheme-get-property
                      (url-type url-http-target-url) 'default-port))
                 (format
                  "Host: %s:%d\r\n" host (url-port url-http-target-url))
               (format "Host: %s\r\n" host))
             ;; Who its from
             (if url-personal-mail-address
                 (concat
                  "From: " url-personal-mail-address "\r\n"))
             ;; Encodings we understand
             (if (or url-mime-encoding-string
                     ;; MS-Windows loads zlib dynamically, so recheck
                     ;; in case they made it available since
                     ;; initialization in url-vars.el.
                     (and (eq 'system-type 'windows-nt)
                          (fboundp 'zlib-available-p)
                          (zlib-available-p)
                          (setq url-mime-encoding-string "gzip")))
                 (concat
                  "Accept-encoding: " url-mime-encoding-string "\r\n"))
             (if url-mime-charset-string
                 (concat
                  "Accept-charset: "
                  (url-http--encode-string url-mime-charset-string)
                  "\r\n"))
             ;; Languages we understand
             (if url-mime-language-string
                 (concat
                  "Accept-language: " url-mime-language-string "\r\n"))
             ;; Types we understand
             "Accept: " (or url-mime-accept-string "*/*") "\r\n"
             ;; User agent
             (url-http-user-agent-string)
             ;; Proxy Authorization
             proxy-auth
             ;; Authorization
             auth
             ;; Cookies
             (when (url-use-cookies url-http-target-url)
               (url-http--encode-string
                (url-cookie-generate-header-lines
                 host real-fname
                 (equal "https" (url-type url-http-target-url)))))
             ;; If-modified-since
             (if (and (not no-cache)
                      (member url-http-method '("GET" nil)))
                 (let ((tm (url-is-cached url-http-target-url)))
                   (if tm
                       (concat "If-modified-since: "
                               (url-get-normalized-date tm) "\r\n"))))
             ;; Whence we came
             (if ref-url (concat
                          "Referer: " ref-url "\r\n"))
             extra-headers
             ;; Length of data
             (if url-http-data
                 (concat
                  "Content-length: " (number-to-string
                                      (length url-http-data))
                  "\r\n"))
             ;; End request
             "\r\n"
             ;; Any data
             url-http-data))
    ;; Bug#23750
    ;;(unless (= (string-bytes request)
    ;;           (length request))
    ;;  (message "   text byte %d vs %d length" (string-bytes request) (length request)))
      ;;(message "===============================")
      ;;(error "Multibyte text in HTTP request: %s" request))
    (url-http-debug "Request is: \n%s" request)
    request))
;;; packages.el ends here
