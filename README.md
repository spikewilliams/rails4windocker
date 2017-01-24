#rails4windocker: Ruby on Rails on Docker for Windows

This creates a Ruby on Rails development environment that is shared between your Windows 10 desktop and a Docker container running CentOS. Use the bash command-line to administer Rails in a stable Linux environment, while accessing your code through Windows Explorer and the text editor of your choice.

This is a development and testing environment. Don't run it in production - its not secure.


Instructions:

First, get Docker for Windows installed and running. Good luck. - https://docs.docker.com/docker-for-windows/

You will need to go into Docker for Windows Settings to ensure that your current drive is shared.

Now run the following from a cmd shell.

  To build the container:

    buildimage.bat

  To run the container on Docker for Windows:

    runimage.bat

  If that worked, you are now in a bash shell on a Docker container.

  To install a ruby version 2.3.1 in this environment:

    r4wd_init 2.3.1

  Ruby 2.3.1 will be installed to the ~/.rbenv/versions/2.3.1 directory on the container, and also in the "ruby" directory under the current Windows directory. You can install as many different Ruby versions as you want.

  If .bashrc isn't run automatically for some reason, you may need to do this to get your PATH squared away:

    source ~/.bashrc

  To let the Linux environment know you want to use ruby version to 2.3.1:

    rbenv global 2.3.1

  To install rails:

    gem install rails

  To create a rails app. This will be available on Windows under the current directory's "railsapp" subdirectory.

    cd /railsapp
    rails new testapp

  Run it:

    rails server -b 0.0.0.0 -e environment

  Now open a browser in Windows to connect to 127.0.0.1:3000. You should see the default Rails welcome page.

Things to know:

* The CentOS install running in the Docker should have enough features to run some basic gems, but if you need more tools installed under that environment, use "yum install <tool>" at the bash prompt.
* Keep in mind that your environment will forget these tools if the Docker image is reset.
* So, any yum installs that you want installed permanently should be added to the Dockerfile, then the docker image should be rebuilt using buildimage.bat.
* If you need to connect addional shells to a running docker instance, use:

    docker exec -i -t rails4wd-access /bin/bash --login