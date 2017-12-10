@echo off

setlocal
set "_CurPath=%~dp0"
set "CurPath=%_CurPath:\=/%"
set "CurPath=%CurPath:~0,-1%"

call "%_CurPath%docker-id.bat
docker run --rm -p 4567:4567 -p 22:22 --security-opt seccomp:unconfined -v %CurPath%/..:/usr/src/%DockerProject% -w /usr/src/%DockerProject% -it %DockerImageName%:%DockerImageTag% bash

rem Running "bash" command causes the entry point "user/sbin/sshd -D" not run or not run correctly

endlocal
