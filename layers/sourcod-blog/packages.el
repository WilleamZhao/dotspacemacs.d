;;; packages.el --- sourcod-blog layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Dean Chen <dean-chen@qq.com>
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
;; added to `sourcod-blog-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sourcod-blog/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sourcod-blog/pre-init-PACKAGE' and/or
;;   `sourcod-blog/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst sourcod-blog-packages
  '(blog-admin)
  )

(defun sourcod-blog/init-blog-admin ()
  "Initialize blog-admin"
  (use-package blog-admin
    :defer t
    :commands blog-admin-start
    :init
    ;; Keybinding
    ;; (spacemacs/set-leader-keys "ab" 'blog-admin-start)
    :config
    (progn
      ;; Open post after create new post
      (add-hook 'blog-admin-backend-after-new-post-hook 'find-file)
      ;; Hexo
      (setq blog-admin-backend-path "~/workspace/hexo/sourcod-blog/")
      (setq blog-admin-backend-type 'hexo)
      ;; create new post in drafts by default
      (setq blog-admin-backend-new-post-in-drafts t)
      ;; create same-name directory with new post
      (setq blog-admin-backend-new-post-with-same-name-dir t)
      ;; default assumes _config.yml
      (setq blog-admin-backend-hexo-config-file "_config.yml"))
    )
  )

;;; packages.el ends here
