
SET IMAGE_NAME=spikewilliams/rails4wd
SET RUBY_DIR=%CD%\ruby
SET RAILSAPP_DIR=%CD%\railsapp
SET PORT=3000

docker run --rm -t -i -p %PORT%:3000 -v %RUBY_DIR%:/root/.rbenv/versions -v %RAILSAPP_DIR%:/railsapp --name rails4wd-access %IMAGE_NAME% /bin/bash
