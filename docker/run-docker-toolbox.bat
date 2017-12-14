@echo off

setlocal
set "_CurPath=%~dp0"
pushd "%_CurPath%.."
set "_CurPath=%cd%"
popd
:: Replace '\' by '/'
set "CurPath=%_CurPath:\=/%"
:: Remove ':', C:/Users becomes C/Users
set "CurPath=%CurPath::=%"

call "%~dp0docker-id.bat"
echo docker run -d --rm -p 4567:4567 -p 22:22 --name %DockerContainerName% -v %CurPath%:/usr/src/%DockerProject% -w /usr/src/%DockerProject% %DockerUserName%/%DockerImageName%:%DockerImageTag%
docker run -d --rm -p 4567:4567 -p 22:22 --name %DockerContainerName% -v %CurPath%:/usr/src/%DockerProject% -w /usr/src/%DockerProject% %DockerUserName%/%DockerImageName%:%DockerImageTag%

rem Running "bash" command causes the entry point "user/sbin/sshd -D" not run or not run correctly

endlocal
