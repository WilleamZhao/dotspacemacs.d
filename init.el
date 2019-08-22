;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; (plantuml :variables plantuml-jar-path "~/.spacemacs.d/plantuml.jar")
     php
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     osx

     ;; coding 时间统计
     (wakatime :variables
               wakatime-api-key  "47278ced-f745-4e75-8cda-194f0ee43565"
               ;; use the actual wakatime path
               wakatime-cli-path "/usr/local/bin/wakatime")

     (javascript :variables
                 javascript-disable-tern-port-files nil)
     yaml
     html
     helm
     auto-completion
     better-defaults
     emacs-lisp
     github
     search-engine
     (git :variables
          git-magit-status-fullscreen t
          magit-push-always-verify nil
          magit-save-repository-buffers 'dontask
          magit-revert-buffers 'silent
          magit-refs-show-commit-count 'all
          magit-revision-show-gravatars nil)

     (markdown :variables markdown-live-preview-engine 'vmd)

     org
     (colors :variables
             colors-enable-nyan-cat-progress-bar nil)

     themes-megapack

     games
     restclient
     chrome
     ;; search-engine

     (erc :variables
          erc-server-list
          '(("irc.freenode.net"
             :port "6697"
             :ssl t
             :nick "sourcod"
             :password "sourcodp@ssw0rd")
            ("irc.myworkirc.net"
             :port "1234"
             :nick "sourcod"
             :password "sourcodp@ssw0rd")
            ("chat.freenode.net"
             :port "6697"
             :nick "sourcod"
             :password "sourcodp@ssw0rd")

            ))

     ;; spaceline-compile
     ;; blog-admin
     (chinese :variables
              chinese-default-input-method 'wubi
              chinese-enable-youdao-dict t
              )

     gtags
     nginx
     (shell :variables
            shell-default-shell 'eshell
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     ;; sourcod-org
     ;;sourcod-email
     mu4e
     ;; gnus
     sourcod-hexo
     sourcod-blog
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      cnfonts
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7)
                                ;;(agenda . 8)
                                ;;(todos . 9)
                                )
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         darkokai
                         tango-dark
                         gruvbox
                         leuven
                         zenburn
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 20
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 70
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 70
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;;dotspacemacs-configuration-layer-path ~/.spacemacs
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq configuration-layer--elpa-archives
        '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
          ("org-cn"   . "http://elpa.emacs-china.org/org/")
          ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

  (set-language-environment "UTF-8")
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-clipboard-coding-system 'utf-8)
  (set-buffer-file-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (modify-coding-system-alist 'process "*" 'utf-8)

  ;; magit
  (setq-default git-magit-status-fullscreen t)
  (setq-default git-enable-magit-svn-plugin t)
  ;; (setq-default dotspacemacs-themes '(solarized-light leuven zenburn))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; chrome
  (add-hook 'edit-server-start-hook 'markdown-mode)
  (add-hook 'edit-server-done-hook (lambda () (shell-command "open -a \"Google Chrome\"")))
  (add-to-list 'edit-server-new-frame-alist '(width  . 140))
  (add-to-list 'edit-server-new-frame-alist '(height . 60))
  (setq edit-server-url-major-mode-alist
              '(("github\\.com" . org-mode)))
  ;; Search Engine
  ;;(setq browse-url-browser-function 'browse-url-generic
    ;;    engine/browser-function 'browse-url-generic
      ;;  browse-url-generic-program "google-chrome")

  ;; neotree
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (setq neo-show-hidden-files nil)
  (setq neo-smart-open t)
  (global-set-key [f2] 'neotree-toggle)

  (defun neotree-ffip-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (ffip-project-root))
          (file-name (buffer-file-name)))
      (if project-dir
          (progn
            (neotree-dir project-dir)
            (neotree-find file-name))
        (message "Could not find git project root."))))

  ;; time-mode
  (setq display-time-24hr-format t
        ;; display-time-format "%d | %H:%M"
        ;; display-time-day-and-date t
        ;; display-time-interval 60
        display-time-default-load-average nil)
  (display-time-mode)



  ;; projectile
  ;; Shorter modeline
  (setq-default projectile-mode-line-prefix " Proj")
  (global-set-key (kbd "C-c C-p") 'projectile-switch-project)

  ;; magit
  (setq magit-repository-directories '("~/.spacemacs.d/repos/magit/"))
  (global-git-commit-mode t)

  (custom-set-faces
   '(mode-line ((t (:foreground "#fff" :background "#444" :box nil))))
   '(mode-line-inactive ((t (:foreground "#d0d0d0" :background "#666666" :box nil)))))
  (setq powerline-color1 "grey22")
  (setq powerline-color2 "grey40")


  ;; 设置bullet list
  (setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))

  ;; 调试好久的颜色，效果超赞！ todo keywords 增加背景色
  (setf org-todo-keyword-faces '(("TODO" . (:foreground "white" :background "#95A5A6"   :weight bold))
                                 ("HAND" . (:foreground "white" :background "#2E8B57"  :weight bold))
                                 ("DONE" . (:foreground "white" :background "#3498DB" :weight bold))))

  ;; 等宽字体
  ;;解决org表格里面中英文对齐的问题
  ;;(when (configuration-layer/layer-usedp 'chinese)
  ;;(when (and (spacemacs/system-is-mac) window-system)
  ;;(spacemacs//set-monospaced-font "Source Code Pro" "Hiragino Sans GB" 14 16)))

  ;; org
  ;; 多状态工作流程
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "MAYBE(m)" "|" "DONE(d!/!)" "ABORT(a@/!)")
                (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
                (sequence "WAITING(w@/!)" "DELEGATED(e!)" "HOLD(h)" "|" "CANCELLED(c@/!)")))
        org-todo-repeat-to-state "NEXT")

  ;; 改变状态触发标签变化
  (setq org-todo-state-tags-triggers
        (quote (("CANCELLED" ("HOLD") ("WAITING") ("CANCELLED" . t))
                ("WAITING" ("HOLD") ("CANCELLED") ("WAITING" . t))
                ("HOLD" ("WAITING") ("CANCELLED") ("HOLD" . t))
                (done ("WAITING") ("HOLD"))
                ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))
  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "red" :weight bold)

                ("NEXT" :foreground "blue" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("HOLD" :foreground "magenta" :weight bold)
                ("CANCELLED" :foreground "forest green" :weight bold)
                ("MAYBE" :foreground "grey" :weight bold)

                ("MEETING" :foreground "forest green" :weight bold)
                ("PHONE" :foreground "forest green" :weight bold)
                ("PROJECT" :inherit font-lock-string-face)

                )))

  (defconst leuven-org-completed-date-regexp
    (concat " \\("
            "CLOSED: \\[%Y-%m-%d"
            "\\|"
            "- State \"\\(DONE\\|CANX\\)\" * from .* \\[%Y-%m-%d"
            "\\|"
            "- State .* ->  *\"\\(DONE\\|CANX\\)\" * \\[%Y-%m-%d"
            "\\) ")
    "Matches any completion time stamp.")
  (setq-default
   ;; inhibit-startup-screen t;隐藏启动显示画面
   calendar-date-style 'iso
   ;; calendar-day-abbrev-array ["七" "一" "二" "三" "四" "五" "六"]
   ;; calendar-day-name-array ["七" "一" "二" "三" "四" "五" "六"]
   ;; calendar-month-name-array ["一月" "二月" "三月" "四月" "五月" "六月" "七月" "八月" "九月" "十月" "十一月" "十二月"]
   calendar-week-start-day 1

   org-agenda-deadline-leaders (quote ("最后期限:  " "%3d 天后到期: " "%2d 天前: "))
   org-agenda-inhibit-startup t
   org-agenda-scheduled-leaders (quote ("计划任务:" "计划任务(第%2d次激活): "))
   org-agenda-window-setup (quote current-window)
   ;; org-clock-string "计时:"
   ;; org-closed-string "已关闭:"
   ;; org-deadline-string "最后期限:"
   ;; org-scheduled-string "计划任务:"
   ;; org-time-stamp-formats  '("<%Y-%m-%d 周%u>" . "<%Y-%m-%d 周%u %H:%M>")
   org-agenda-show-all-dates t
   org-agenda-skip-deadline-if-done t
   org-agenda-skip-scheduled-if-done t
   org-reverse-note-order t ;;org.el
   org-link-file-path-type  'relative
   org-log-done 'time
   ;; code执行免应答（Eval code without confirm）
   org-confirm-babel-evaluate nil
   org-image-actual-width '(600)
   org-emphasis-regexp-components
   ;; markup 记号前后允许中文
   ;; https://emacs-china.org/t/org-mode/597/11
   ;; Org 里中文/斜体/、*粗体*、_下划线_、+删除+、~代码~、=常量=。
   (list (concat " \t('\"{"            "[:nonascii:]")
         (concat "- \t.,:!?;'\")}\\["  "[:nonascii:]")
         " \t\r\n,\"'"
         "."
         1)
   )

  (setq org-pomodoro-keep-killed-pomodoro-time t)
  ;; (define-key org-agenda-mode-map (kdb "P" 'org-pomodoro))
  (setq org-agenda-prefix-format
        '((agenda  . " %i %-10:c%?-12t% s")
          (timeline  . "  % s")
          (todo  . " %i %-12:c")
          (tags  . " %i %-12:c")
          (search . " %i %-12:c"))
        )

  ;; 优先级范围和默认任务的优先级
  (setq org-highest-priority ?A)
  (setq org-lowest-priority  ?D)
  (setq org-default-priority ?B)


  ;; 优先级醒目外观
  (setq org-priority-faces
        '((?A . (:weight bold))
          (?B . (:weight bold))
          (?C . (:weight bold))
          (?D . (:weight bold))
          ))

  ;; tags
  ;; @代表动作/情景
  (setq org-tag-alist '(
                        ;; 小写动作/大写项目
                        ;; 工作
                        ("@Office" . ?o)
                        ;; 将来/也许
                        ("@Maybe" . ?m)
                        ;; 会议/开会
                        ("@Meeting" . ?M)
                        ;; 任何时候
                        ("@Anywhere" .?A)
                        ;; 电话
                        ("@Phone" . ?p)
                        ;; 电脑前/用电脑
                        ("@Computer". ?c)
                        ;; 出差
                        ("@Errands" . ?e)
                        ;; 家里
                        ("@Home" . ?h)
                        ;; 购物
                        ("@Shopping" . ?s)
                        ))

  (setq org-path "/Users/sourcod/workspace/org/")
  (setq org-note-path  (concat org-path "notes/"))


  (setq org-default-notes-file (concat org-path "notes.org"))

  ;; billing
  (defun get-year-and-month ()
    (list (format-time-string "%Y年") (format-time-string "%m月")))


  (defun find-month-tree ()
    (let* ((path (get-year-and-month))
           (level 1)
           end)
      (unless (derived-mode-p 'org-mode)
        (error "Target buffer \"%s\" should be in Org mode" (current-buffer)))
      (goto-char (point-min))             ;移动到 buffer 的开始位置
      ;; 先定位表示年份的 headline，再定位表示月份的 headline
      (dolist (heading path)
        (let ((re (format org-complex-heading-regexp-format
                          (regexp-quote heading)))
              (cnt 0))
          (if (re-search-forward re end t)
              (goto-char (point-at-bol))  ;如果找到了 headline 就移动到对应的位置
            (progn                        ;否则就新建一个 headline
              (or (bolp) (insert "\n"))
              (if (/= (point) (point-min)) (org-end-of-subtree t t))
              (insert (make-string level ?*) " " heading "\n"))))
        (setq level (1+ level))
        (setq end (save-excursion (org-end-of-subtree t t))))
      (org-end-of-subtree)))

  ;; protocol
  (require 'org-protocol)

  ;; dynamic href
  (setq org-capture-templates
        `(("c" "Contacts" table-line (file ,(concat org-path "contact.org"))
           "| %U | %^{姓名} | %^{主手机号} | %^{次手机号} | %^{邮箱} | %^{公司} | %^{标签} | %^{备注} | %^{生日} |")
          ("t" "Inbox" entry (file+headline ,(concat org-path "gtd/inbox.org") "Inbox")
           "* TODO [#B] %?\n  %i\n"
           :empty-lines 1
           )
          ;; 临时笔记
          ("n" "notes")
          ("nc" "名言警句" entry (file+headline ,(concat org-path "notes.org") "catchphrase")
           "* %?\n  %i\n %U"
           :empty-lines 1
           )
          ("nn" "Quick notes" entry (file+headline ,(concat org-path "notes.org") "Quick notes")
           "* %?\n  %i\n %U"
           :empty-lines 1
           )

          ;; 会议笔记
          ("nm" "Meeting" entry (file+headline ,(concat org-path "notes.org") "Meeting")
           "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)

          ;; 记账
          ("i" "记账" table-line (file+datetree+prompt ,(concat org-path "billing.org"))
           "| %U | %^{类别} | %^{描述} | %^{金额} | " :kill-buffer t
           :empty-lines 1
           )

          ("ni" "idea" entry (file+headline ,(concat org-path "notes.org") "idea")
           "*  %?\n  %i\n %U"
           :empty-lines 1
           )

          ;; blog
          ("B" "create blog" plain (file ,(concat org-path "blog/" (format-time-string "%Y-%m-%d.org")))
           ,(concat "#+TITLE: %^{标题}\n"
                    "#+TAGS: %^{标签}\n"
                    "#+SETUPFILE: index.org\n"
                    "#+EMAIL: zhaochunjie@sourcod.com\n"
                    "#+AUTHOR: willeam\n"
                    "#+HTML: <div class=outline-2 id=\"meta\">\n"
                    "| Author | {{{author}}} ({{{email}}})    |\n"
                    "| Date   | {{{time(%Y-%m-%d %H:%ML%S)}}} |\n"
                    "#+HTML: </div>\n"
                    "#+options: ^:{}\n"
                    "#+options: \\n:t\n"
                    "#+TOC: headlines 3\n")
           )

          ;; 代码片段
          ("s" "Code Snippet" entry (file ,(concat org-path "snippets.org"))
           "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
          ;; 工作
          ("w" "work" entry (file+headline ,(concat org-path "inbox.org") "work")
           "* TODO [#B] %?\n  %i\n %U"
           :empty-lines 1)
          ;; 连接收藏夹
          ("l" "links" entry (file ,(concat org-path "link.org"))
           "* TODO [#C] %?\n  %i\n %a \n %U"
           :empty-lines 1)
          ;; 日记
          ("j" "Journal Entry"
           entry (file+datetree ,(concat org-path "journal.org"))
           "* %U | 标题 -> %^{标题} | 天气 -> %^{天气} | 心情 -> %^{心情}\n%?"
           :empty-lines 1
           )
          ;; 书
          ("b" "Books" entry (file+headline ,(concat org-path "books.org") "book notes")
           "* TODO [#D] %?\n  %i\n %U"
           :empty-lines 1)

          ;; protocol

          ;; projects
          ;; ("p" "projects")
          ;; ;; 天蓝科技
          ;; ("pt" "天蓝科技")
          ;; ("pt1" "zdqdp" entry (file+olp ,(concat org-path "project.org") "天蓝科技" "自动抢订票")
          ;;  "* TODO [#D] %?")

          ;; ("pz" "自己")
          ;; ("pz1" "WXBootstrap" entry (file+olp ,(concat org-path "project.org") "my" "WXBootstrap")
          ;;  "* TODO [#D] %?")


          ;; ("pw" "外部")
          ;; ("pw2" "富胜科技" entry (file+olp ,(concat org-path "project.org") "富胜科技") "* TODO [D] %?")

          ;; ("pw1" "古联")
          ;; ;; gulian
          ;; ("pw11" "gulian-app" entry (file+olp ,(concat org-path "project.org") "gulian" "app")
          ;;  "* TODO [#D] %?")
          ;; ;; gulian
          ;; ("pw12" "gulian-wx" entry (file+olp ,(concat org-path "project.org") "gulian" "wx")
          ;;  "* TODO [#D] %?")


          ("P" "Password" entry (file ,(concat org-path "password.org.cpt"))
           "* %U - %^{title} %^G\n\n  - 用户名: %^{用户名}\n  - 密码: %(get-or-create-password)"
           :empty-lines 1
           :kill-buffer t
           )
          )

        )

;;; Archiving 归档
  ;; C-c C-x C-a
  (setq org-archive-mark-done nil)

  (setq org-archive-location
        (concat org-path "gtd/finished.org::* From %s")
        )

  ;; 发布
  ;;(require 'org-publish)

  (setq org-publish-project-alist
        '(("org-notes"
           :base-directory "~/workspace/org/blog"
           :publishing-directory "~/workspace/org/blog/publish"
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
           :base-directory "~/workspace/org/blog"
           :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf|doc"
           :publishing-directory "~/workspace/org/blog/publish"
           :recursive t
           :publishing-function org-publish-attachment
           )
          ("org" :components ("org-notes" "org-static"))

          ;;
          ;;("org-51xny-notes"
          ;; :base-directory "~/workspace/org/blog"
          ;; :publishing-directory "~/workspace/org/blog/publish"
          ;; :section-numbers nil
          ;; :recursive t
          ;; :publishing-function org-html-publish-to-html
          ;; ;;org-html-publish-to-html
          ;; :headline-levels 4
          ;; :table-of-contents nil
          ;; :style "<link rel=\"stylesheet\" href=\"css/style.css\"  type=\"text/css\"/>"
          ;; :html-head "<link rel=\"stylesheet\" href=\"css/style.css\"  type=\"text/css\"/>"
          ;; :author "willeam"
          ;; :email "zhaochunjie@sourcod.com"
          ;; :auto-sitemap t
          ;; ;;:sitemap-filename "sitemap.org"
          ;; ;;:sitemap-title "我的wiki"
          ;; ;;:sitemap-sort-files anti-chronologically
          ;; ;;:sitemap-file-entry-format "%t" ; %d to output date, we don't need date here
          ;; )
          ;;("org-51xny-static"
          ;; :base-directory "~/workspace/org/blog"
          ;; :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf|doc"
          ;; :publishing-directory "~/workspace/org/blog/publish"
          ;; :recursive t
          ;; :publishing-function org-publish-attachment
          ;; )
          ;;("org-51xny" :components ("org-51xny-notes" "org-51xny-static"))
          )
        )

  ;; org-crypt
  ;;(require-package 'org-crypt)
  (require 'org-crypt)

  ;; 當被加密的部份要存入硬碟時，自動加密回去
  (org-crypt-use-before-save-magic)

  ;; 設定要加密的 tag 標籤為 secret
  (setq org-crypt-tag-matcher "secret")

  ;; 避免 secret 這個 tag 被子項目繼承 造成重複加密
  ;; (但是子項目還是會被加密喔)
  (setq org-tags-exclude-from-inheritance (quote ("secret")))

  ;; 用於加密的 GPG 金鑰
  ;; 可以設定任何 ID 或是設成 nil 來使用對稱式加密 (symmetric encryption)
  (setq org-crypt-key "393B76F8FD82DC7B7A5E79AB3251A10218FB9FDB")
  ;;(setq org-crypt-key "nil")


  ;; js文件格式设置
  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)

  (boundp 'column-number-indicator-zero-based)
  ;; (setq powerline-default-separator 'slant)
  (setq powerline-default-separator 'arrow)

  ;;mu4e
  (setq mu4e-maildir "~/mail"
        mu4e-drafts-folder "/Drafts"
        mu4e-sent-folder   "/Sent Messages"
        mu4e-refile-folder "/Archive"
        mu4e-trash-folder "/Deleted Messages"
        mu4e-get-mail-command "mbsync -a"
        mu4e-update-interval nil
        mu4e-compose-signature-auto-include nil
        mu4e-view-show-images t
        mu4e-view-show-addresses t)
    ;;; Mail directory shortcuts
  (setq powerline-image-apple-rgb t)

  (setq mu4e-maildir-shortcuts
        '(("/INBOX" . ?i)
          ("/Sent Messages" . ?s)
          ("/Junk" . ?j)
          ("/Deleted Messages" . ?d)
          ))

  (setq mu4e-get-mail-command "fetchmail")

  ;; something about ourselves
  (setq user-mail-address "zhaochunjie.love@163.com"
        user-full-name  "willeamZhao"
        mu4e-compose-signature
        (concat
         "willeamZhao\n"
         "Email: zhaochunjie@sourcod.com\n"
         "Blog: blog.sourcod.com\n"
         "\n")
        mu4e-compose-signature-auto-include t
        )

  ;;send mail
  (require 'smtpmail)
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-stream-type 'starttls
        smtpmail-default-smtp-server "smtp.qq.com"
        smtpmail-smtp-server "smtp.qq.com"
        smtpmail-smtp-service 587)

  (setq mu4e-view-show-images t)

  ;; save attachment to my desktop (this can also be a function)
  (setq mu4e-attachment-dir "~/Downloads")

  ;; sync email from imap server
  (setq mu4e-get-mail-command "offlineimap"
        mu4e-update-interval 300)
  ;; notifcation
  (setq mu4e-enable-notifications t)
  ;;(mu4e-alert-enable-mode-line-display)

  ;; gnus
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

  ;; use apsell as ispell backend
  (setq-default ispell-program-name "aspell")
  ;; use American English as ispell default dictionary
  (ispell-change-dictionary "american" t)

  ;; (require ’pyim)
  ;; (require ’pyim-basedict)
  ;; (pyim-basedict-enable)
  ;; (setq default-input-method "pyim")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "ec5f697561eaf87b1d3b087dd28e61a2fc9860e4c862ea8e6b0b77bd4967d0ba" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#383838" t)
 '(highlight-changes-colors (quote ("#ff8eff" "#ab7eff")))
 '(highlight-tail-colors
   (quote
    (("#424748" . 0)
     ("#63de5d" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#424748" . 100))))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (cnfonts chinese-word-at-point mmt restclient-helm ob-restclient ob-http ham-mode html-to-markdown fringe-helper git-gutter+ git-gutter pos-tip flycheck company-restclient restclient know-your-http-well names ctable pinyinlib wakatime-mode define-word zenburn-theme zen-and-art-theme youdao-dictionary yaml-mode xterm-color ws-butler winum white-sand-theme which-key web-mode web-beautify volatile-highlights vmd-mode vi-tilde-fringe uuidgen use-package unfill underwater-theme ujelly-theme typit twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sudoku sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs rebecca-theme rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme purple-haze-theme pug-mode professional-theme popwin planet-theme phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy paradox pangu-spacing pacmacs osx-trash osx-dictionary orgit organic-green-theme org2blog org-projectile org-present org-pomodoro org-mime org-mac-link org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme nginx-mode neotree naquadah-theme mwim mustang-theme multi-term mu4e-maildirs-extension mu4e-alert move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow magit-gh-pulls madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode linum-relative link-hint light-soap-theme launchctl json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hexo heroku-theme hemisu-theme helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gmail-message-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md ggtags gandalf-theme fuzzy flyspell-correct-helm flymd flycheck-pos-tip flx-ido flatui-theme flatland-theme find-by-pinyin-dired fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks engine-mode emmet-mode elisp-slime-nav edit-server dumb-jump drupal-mode dracula-theme django-theme diminish diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-web company-tern company-statistics column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode coffee-mode clues-theme clean-aindent-mode chinese-wbim cherry-blossom-theme busybee-theme bubbleberry-theme blog-admin birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-pinyin ace-link ace-jump-helm-line ac-ispell 2048-game)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#E6DB74")
 '(pos-tip-foreground-color "#242728")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(wakatime-python-bin nil)
 '(weechat-color-list
   (unspecified "#242728" "#424748" "#F70057" "#ff0066" "#86C30D" "#63de5d" "#BEB244" "#E6DB74" "#40CAE4" "#06d8ff" "#FF61FF" "#ff8eff" "#00b2ac" "#53f2dc" "#f8fbfc" "#ffffff")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "nil" :slant normal :weight normal :height 130 :width normal))))
 '(mode-line ((t (:foreground "#fff" :background "#444" :box nil))))
 '(mode-line-inactive ((t (:foreground "#d0d0d0" :background "#666666" :box nil)))))
