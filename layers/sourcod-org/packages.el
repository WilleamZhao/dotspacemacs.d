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
                 :default-categories ("menu")
                 :tags-as-categories nil)))
        (setq org2blog/wp-default-title "My New Title")
        (setq org2blog/wp-use-tags-as-categories t)
        (setq org2blog/wp-confirm-post t)
        (setq org2blog/wp-use-sourcecode-shortcode t)
        (setq org2blog/wp-sourcecode-default-params "")
        (setq org2blog/wp-track-posts '("~/blog/blogs.org" "Posts"))
        (setq org2blog/wp-sourcecode-langs
              '("actionscript3" "bash" "coldfusion" "cpp" "csharp" "css" "delphi"
                "erlang" "fsharp" "diff" "groovy" "javascript" "java" "javafx" "matlab"
                "objc" "perl" "php" "text" "powershell" "python" "ruby" "scala" "sql"
                "vb" "xml" "sh" "elisp" "lisp" "lua"))
        (setq org2blog/wp-keep-new-lines t)
        (setq xml-rpc-use-coding-system 'utf-8))
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
        ))
  )
;;(setq org-clock-modeline-total 'current)
;;(setq org-timer-default-timer 25)
(defun sourcod-org-packages/post-init-org()
    (progn
      (require 'ox-publish)
      ))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org-notes/gtd.org" "Workspace")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)
        ("n" "notes" entry (file+headline "~/org-notes/notes.org" "Quick notes")
         "* %?\n  %i\n %U"
         :empty-lines 1)
        ("b" "Blog Ideas" entry (file+headline "~/org-notes/notes.org" "Blog Ideas")
         "* TODO [#B] %?\n  %i\n %U"
         :empty-lines 1)
        ("s" "Code Snippet" entry
         (file "~/org-notes/snippets.org")
         "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
        ("w" "work" entry (file+headline "~/org-notes/gtd.org" "Cocos2D-X")
         "* TODO [#A] %?\n  %i\n %U"
         :empty-lines 1)
        ("c" "Chrome" entry (file+headline "~/org-notes/notes.org" "Quick notes")
         "* TODO [#C] %?\n %(sourcod/retrieve-chrome-current-tab-url)\n %i\n %U"
         :empty-lines 1)
        ("l" "links" entry (file+headline "~/org-notes/notes.org" "Quick notes")
         "* TODO [#C] %?\n  %i\n %a \n %U"
         :empty-lines 1)
        ("j" "Journal Entry"
         entry (file+datetree "~/org-notes/journal.org")
         "* %?"
         :empty-lines 1)))

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

;; 发布
;;(require 'org-publish)

(setq org-publish-project-alist
      '(("org-notes"
         :base-directory "~/org/"
         :publishing-directory "~/org/publish"
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
         :base-directory "~/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf|doc"
         :publishing-directory "~/org/publish"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org" :components ("org-notes" "org-static"))
        ))

;;; packages.el ends here
