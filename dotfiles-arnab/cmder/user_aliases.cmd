;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
ls=ls --show-control-chars -F -hN --color=auto --group-directories-first $*
pwd=cd
clear=cls
history=cat -n "%CMDER_ROOT%\config\.history"
unalias=alias /d $1
vi=vim $*
mv=mv -iv $*
cp=cp -iv $*
mkd=mkdir-pv
cmderr=cd /d "%CMDER_ROOT%"
cddc=cd /d C:\
cddu=cd /d %USERPROFILE%
;= cd ~=cddu
cdd=cd /d $*
cddd=cd /d D:\
cddp=cd /d D:\projs
transfer=curl --upload-file ./$1 https://transfer.sh/$1
vea=venv\Scripts\activate.bat
ved=deactivate
ve=sh -c "python -m venv venv" -and venv\Scripts\activate.bat
oua=nvim C:\bin\cmder\config\user_aliases.cmd
rua=C:\bin\cmder\config\user_aliases.cmd
rclr=rclone listremotes
rccp=rclone copy -P $*
rcls=rclone lsf $*
vim=nvim $*
nano=nvim $*
