call settings.cmd

docker run -d -p %PORT%:3000 -v %RUBY_DIR%:/root/.rbenv/versions -v %RAILSAPP_DIR%:/railsapp --name %CONTAINER_NAME% %IMAGE_NAME% tail -f /dev/null
