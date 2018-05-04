#! /bin/bash
echo 'pack'

pwd
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build app.go
tar -zcvf app.tar.gz app
echo 'upload'
scp app.tar.gz  holoread:/home/dev/www/holoread-go
echo 'delete local files'
# rm app
# rm app.tar.gz
export GIN_MODE=debug
echo 'restart'
ssh -t holoread "pwd && cd www/holoread-go && ./restart.sh"
