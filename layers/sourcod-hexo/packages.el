;;; packages.el --- sourcod-hexo layer packages file for Spacemacs.
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
;; added to `sourcod-hexo-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `sourcod-hexo/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `sourcod-hexo/pre-init-PACKAGE' and/or
;;   `sourcod-hexo/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst sourcod-hexo-packages
  '(hexo)
  )

(defun sourcod-hexo/init-hexo()
  (use-package hexo
    ))

(defun hexo-my-blog ()
  (interactive)
  (hexo "~/workspace/hexo/sourcod-blog/")
  ;;((nil . ((hexo-new-format . org))
  ;;))
)

;;; packages.el ends here
