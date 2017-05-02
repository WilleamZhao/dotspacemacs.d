;; Screenshot
(defun sourcod//insert-org-or-md-img-link (prefix imagename)
  (if (equal (file-name-extension (buffer-file-name)) "org")
      (insert (format "[[%s%s]]" prefix imagename))
    (insert (format "![%s](%s%s)" imagename prefix imagename))))

(defun sourcod/capture-screenshot (basename)
  "Take a screenshot into a time stamped unique-named file in the
  same directory as the org-buffer/markdown-buffer and insert a link to this file."
  (interactive "sScreenshot name: ")
  (if (equal basename "")
      (setq basename (format-time-string "%Y%m%d_%H%M%S")))
  (setq fullpath
        ;; (file-name-directory (buffer-file-name)
        (concat
         (expand-file-name "~/ownCloud/pictures/blog/")
         (file-name-base (buffer-file-name))
         "_"
         basename))
  (setq relativepath
        (concat (file-name-base (buffer-file-name))
                "_"
                basename
                ".png"))
  (if (file-exists-p (file-name-directory fullpath))
      (progn
        (setq final-image-full-path (concat fullpath ".png"))
        (call-process "screencapture" nil nil nil "-s" final-image-full-path)
        (if (executable-find "convert")
            (progn
              (setq resize-command-str (format "convert %s -resize 800x600 %s" final-image-full-path final-image-full-path))
              (shell-command-to-string resize-command-str)))
        (sourcod//insert-org-or-md-img-link "http://image.sourcod.com/hexo/" relativepath))
    (progn
      (call-process "screencapture" nil nil nil "-s" (concat basename ".png"))
      (sourcod//insert-org-or-md-img-link "./" (concat basename ".png"))))
(insert "\n"))

(defun sourcod/capture-screenshot-min (basename)
  "Take a screenshot into a time stamped unique-named file in the
  same directory as the org-buffer/markdown-buffer and insert a link to this file."
  (interactive "sScreenshot name: ")
  (if (equal basename "")
      (setq basename (format-time-string "%Y%m%d_%H%M%S")))
  (setq fullpath
        ;; (file-name-directory (buffer-file-name)
        (concat
         (expand-file-name "~/ownCloud/pictures/blog/")
         (file-name-base (buffer-file-name))
         "_"
         basename))
  (setq relativepath
        (concat (file-name-base (buffer-file-name))
                "_"
                basename
                ".png"))
  (if (file-exists-p (file-name-directory fullpath))
      (progn
        (setq final-image-full-path (concat fullpath ".png"))
        (iconify-or-deiconify-frame)
        (call-process "screencapture" nil nil nil "-s" final-image-full-path)
        (if (executable-find "convert")
            (progn
              (setq resize-command-str (format "convert %s -resize 800x600 %s" final-image-full-path final-image-full-path))
              (shell-command-to-string resize-command-str)))
        (sourcod//insert-org-or-md-img-link "http://image.sourcod.com/hexo/" relativepath))
    (progn
      (call-process "screencapture" nil nil nil "-s" (concat basename ".png"))
      (sourcod//insert-org-or-md-img-link "./" (concat basename ".png"))))
(insert "\n"))


