@echo off

SET GIT_BRANCH=
SET CURRENT_ENV=

REM Execute git branch command and redirect stderr to NUL
REM Note that we need to escape the redirectiond and pipe command 
REM to make the script work
FOR /f "tokens=2" %%a in ('git branch 2^> NUL ^| FINDSTR /b "* "') do SET GIT_BRANCH=%%a

:: Detect if the user is currently using anu virtual env
@REM SET CURRENT_ENV=%CONDA_DEFAULT_ENV%
@REM IF [%GIT_BRANCH%] == [] ( GOTO :prompt ) ELSE ( GOTO :custom )

@REM :custom
@REM     IF [%CURRENT_ENV%] == [] (
@REM         SET CUSTOM_PROMPT=^
@REM $E[m$E[32m$E]9;8;%USERNAME%$E\@$E]9;8;%COMPUTERNAME%$E\$S$E[92m$P$E[90m^
@REM $S$E[1;33m$C%GIT_BRANCH%$F$E$_^
@REM $E[90m$G$E[m$S$E]9;12$E\
@REM     ) ELSE (
@REM         SET CUSTOM_PROMPT=^
@REM $E[35m$C%CURRENT_ENV%$F$S^
@REM $E[m$E[32m$E]9;8;%USERNAME%$E\@$E]9;8;%COMPUTERNAME%$E\$S$E[92m$P$E[90m^
@REM $S$E[1;33m$C%GIT_BRANCH%$F$E$_^
@REM $E[90m$G$E[m$S$E]9;12$E\
@REM     )
@REM     prompt %CUSTOM_PROMPT%
@REM     GOTO :eof

@REM :prompt
@REM     IF [%CURRENT_ENV%] == [] (
@REM         SET CUSTOM_PROMPT=^
@REM $E[m$E[32m$E]9;8;%USERNAME%$E\@$E]9;8;%COMPUTERNAME%$E\$S$E[92m$P$E[90m$_^
@REM $E[90m$G$E[m$S$E]9;12$E\
@REM         prompt %CUSTOM_PROMPT%
@REM     ) ELSE (
@REM         SET CUSTOM_PROMPT=^
@REM $E[35m$C%CURRENT_ENV%$F$S^
@REM $E[m$E[32m$E]9;8;%USERNAME%$E\@$E]9;8;%COMPUTERNAME%$E\$S$E[92m$P$E[90m$_^
@REM $E[90m$G$E[m$S$E]9;12$E\
@REM     )
@REM     prompt %CUSTOM_PROMPT%
@REM     GOTO :eof

prompt $_$E[1;30;40m[$E[0;36;40m%username%@%computername%$E[1;30;40m] ^
$E[0;33;40m$M$E[35;40m$d$s$t$h$h$h$h$h$h$_$E[1;33;40m$p$E$S$E[1;92m ^
$C%GIT_BRANCH%$F$E[1;30;40m$g $E[0;37;40m
