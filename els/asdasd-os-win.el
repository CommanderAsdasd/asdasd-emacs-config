;; (use-package w32-browser)
(require 'asdasd-emacs-api)

(defun asdasd-os-win-wsl-p ()
  "is running on WSL"
  (cond ((getenv "WSLENV")
         t)))

(defun asdasd-os-win-set-scale (scale)
  ""
  (interactive (list (alist-get (intern (completing-read "choose" '("max" "min"))) '((max . 0)
                                                                                     (min . 4294967295)))))
  (let ((shell-file-name (if (and (eq system-type 'cygwin)
                                           (fboundp 'cygwin-convert-file-name-from-windows))
				      (cygwin-convert-file-name-from-windows powershell-location-of-exe)
				      powershell-location-of-exe))
        (command "function Set-Scaling {
param($scaling)
$source = @'
[DllImport(\"user32.dll\", EntryPoint = \"SystemParametersInfo\")]
public static extern bool SystemParametersInfo(
                  uint uiAction,
                  uint uiParam,
                  uint pvParam,
                  uint fWinIni);
'@
$apicall = Add-Type -MemberDefinition $source -Name WinAPICall -Namespace SystemParamInfo -PassThru
  $apicall::SystemParametersInfo(0x009F, $scaling, $null, 1) | Out-Null
}

Set-Scaling -scaling %s
")) 
    (start-process-shell-command (compile-time-function-name) (compile-time-function-name) (format command scale)))
  )


(use-package emacs
  :custom (visible-bell 1))

(use-package dos-w32
  :straight nil
  :config
  ;; (w32-register-hot-key [M-tab])
  )



(provide 'asdasd-os-win)
