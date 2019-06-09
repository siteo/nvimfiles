rem Execute with administrator authority

rem Set directory path to variables
set NVIMPATH=C:\%HOMEPATH%\AppData\Local\nvim
set REPOPATH=C:\%HOMEPATH%\nvimfiles

rem Create a directory
mkdir %NVIMPATH%

rem Creates symbolic links
mklink %NVIMPATH%\init.vim %REPOPATH%\init.vim
mklink %NVIMPATH%\ginit.vim %REPOPATH%\ginit.vim
mklink %NVIMPATH%\dein.toml %REPOPATH%\dein.toml
mklink %NVIMPATH%\dein_lazy.toml %REPOPATH%\dein_lazy.toml

rem Creates nvimenv directories
mkdir %HOMEPATH%\nvimenv
mkdir %HOMEPATH%\nvimbackup
mkdir %HOMEPATH%\nvimundo

pause
