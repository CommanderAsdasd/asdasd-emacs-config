                                        ; assign paths (in path section of init)
                                        ; location of cmdproxy that works with my emacs installation
(defvar default-shell-file-name-p "C:/emacs/libexec/emacs/26.2/x86_64-w64-mingw32/cmdproxy.exe")

                                        ; and the bash shell that works with this
(defvar bash-shell-file-name-p "C:/Windows/system32/bash.exe")

                                        ; you need a default comspec
(defvar default-comspec-p "C:\\Windows\\system32\\cmd.exe")

                                        ;and a bash comspec
(defvar bash-comspec-p "C:\\Windows\\system32\\wsl.exe")

                                        ;shell-switcher
(defun shell-switch-and-call ()
  (interactive)
  (cond
                                        ; if cmd-shell set to bash
   ((equal  shell-file-name default-shell-file-name-p)
    (progn
      (setenv "COMSPEC" bash-comspec-p)
      (setq shell-file-name bash-shell-file-name-p)
      (setenv "SHELL" shell-file-name)
      (kill-shell-buffers)
      (shell)));end cmd-shell
                                        ;if bash-shell set to windows
   ( (equal shell-file-name bash-shell-file-name-p)
     (progn
       (setenv "COMSPEC" default-comspec-p)
       (setq shell-file-name default-shell-file-name-p)
       (setenv "SHELL" shell-file-name)
       (kill-shell-buffers)
       (shell)));end if bash-shell
                                        ;if other shell set to windows
   (t (progn
        (setq shell-file-name default-shell-file-name-p)
        (setenv "SHELL" shell-file-name)
        (kill-shell-buffers)
        (shell))));end conditional
  );end shell-switcher
                                        ;switch to the process buffer from whereever you are (your script.bat)
(defun sh-switch-to-process-buffer ()
  (interactive)
  (pop-to-buffer (process-buffer (get-process "shell")) t))
                                        ; send line/region to shell
(defun sh-send-line-or-region (&optional step)
  (interactive ())
  (let ((proc (get-process "shell"))
        pbuf min max command)
    (unless proc
      (let ((currbuff (current-buffer)))
        (shell)
        (switch-to-buffer currbuff)
        (setq proc (get-process "shell"))
        ))
    (setq pbuff (process-buffer proc))
    (if (use-region-p)
        (setq min (region-beginning)
              max (region-end))
      (setq min (point-at-bol)
            max (point-at-eol)))
    (setq command (concat (buffer-substring min max) "\n"))
    (with-current-buffer pbuff
      (goto-char (process-mark proc))
      (insert command)
      (move-marker (process-mark proc) (point))
      ) ;;pop-to-buffer does not work with save-current-buffer -- bug?
    (process-send-string  proc command)
    (display-buffer (process-buffer proc) t)
    (when step
      (goto-char max)
      (next-line))
    ));end send line/region

                                        ;you need the function above to use the following which sends region from your text file then jumps over to the output buffer

                                        ;send line or region interactive
(defun sh-send-line-or-region-and-step ()
  (interactive)
  (sh-send-line-or-region t))
(require 'cl)
(setq comint-scroll-to-bottom-on-output t)

                                        ;kill-shell-buffers
(defun is-shell-buffer (buffer)
  (let ((name (buffer-name buffer)))
    (and (= ?* (aref name 0))
         ( string-match "^\\*shell\\*" name))))

(defun kill-shell-buffers ()
  (interactive)
  (loop for buffer being the buffers
        do (and (is-shell-buffer buffer) (kill-buffer buffer))))
                                        ;launch-ubuntu1804 only works if you have wsl installed properly on your system with ubuntu1804
                                        ;it opens in the home directory of your WSL installation, which is where you need it if you're using it to more quickly test go programs
(defun launch-ubuntu1804 ()
  (interactive)
  (w32-shell-execute nil "ubuntu1804" nil)
  );end launch-screen-case

                                        ;or path to wsl.exe
(defvar win-ubuntu-exe-p "...Windows/System32/wsl.exe")

                                        ;this one opens in the directory you call it from
(defun launch-ubuntu1804-win-p ()
  (interactive)
  (w32-shell-execute nil win-ubuntu-exe-p nil)
  );end launch ubuntu1804-win
(defun launch-cmd ()
  (interactive)
  (w32-shell-execute nil "cmd" nil)
  );end launch-command-prompt
(defun launch-powershell ()
  (interactive)
  (w32-shell-execute nil "powershell" nil)
  ); end launch-powershell
(defvar git-bash-shell-file-name-p "...path to...git-bash.exe")

(defun launch-git ()
  (interactive)
  (w32-shell-execute nil git-bash-shell-file-name-p nil )



                                        ;shell-hydra
  (defvar shell-central-title (with-octicon "device-desktop" "Shell Manager"))
                                        ;generate hydra
  (pretty-hydra-define Shell-Central (:title shell-central-title :quit-key "q" :color blue )
                       ("Shells"
                        (
                         ("t" shell-switch-and-call "Toggle Emacs Shell CMD/WSL")
                         ("s" shell-same-window "Open Shell In Window")
                         ("p" powershell "Launch Emacs Powershell")
                         ("e" eshell "Launch Eshell")
                         ("g" launch-git "Launch git")
                         );end theme
                        "Action"
                        (
                         ("l" sh-send-line-or-region-and-step "Send Line/Region To Shell" )
                         ("j" sh-switch-to-process-buffer "Jump To Process Buffer" )
                         ("c" comint-clear-buffer "Clear Shell Buffer")
                         ("w" launch-powershell "Launch Win Powershell" )
                         ("d" launch-cmd "Launch Win CMD Prompt")
                         ("U" launch-ubuntu1804 "Launch Ubuntu")
                         ("u" launch-ubuntu1804-win-p "Launch Ubuntu Mount")
                         );end highlighting

                        "Other"
                        (
                         ("b" comint-previous-input "Previous Command" :color red)
                         ("f" comint-next-input "Next Command" :color red)
                         ("H" comint-dynamic-list-input-ring "Input History")
                         ("r" comint-backward-matching-input "Search Commands Back")
                         ("n" comint-forward-matching-input "Search Commands Forward")
                         ("o" comint-write-output "Write Output To File")
                         ("h" hydra-helm/body "Return To Helm" :color blue )
                         ("<SPC>" nil "Quit" :color blue)
                         );end other
                        );end hydra body
                       );end pretty-hydra-appearance
  (bind-key "<C-m> l" 'Shell-Central/body)
