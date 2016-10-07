#rails4windocker 0.1
##Ruby on Rails on Docker on Windows

This creates a Ruby on Rails development environment that is shared between your Windows 10 desktop and a Docker container running CentOS. Use the bash command-line to administer Rails in a stable Linux environment, while accessing your code through Windows Explorer and the text editor of your choice.

This is a development and testing environment. Don't run it in production - its not secure.


To use:

First, get Docker for Windows running.

  https://docs.docker.com/docker-for-windows/

Now run the following from a cmd shell:

  To build the container

    buildimage.bat

  To run the container on Docker for Windows

    runimage.bat

  If that worked, you are now in a bash shell on a Docker container.

  To install a ruby version 2.2.2 in this environment:

    r4wd_init 2.2.2

  Ruby 2.2.2 will be installed to the ~/.rbenv/versions/2.2.2 directory on the container, and also in the "ruby" directory under the current Windows directory. You can install as many different Ruby versions as you want.

  Right now .bash_profile isn't getting run automatically for some reason, so you may need to do this to get your PATH squared away:

    source ~/.bash_profile

  To let the Linux environment know you want to use ruby version to 2.2.2:

    rbenv global 2.2.2

  To install rails:

    gem install rails

  To create a rails app. This will be available on Windows under the current directory's "railsapp" subdirectory.

    cd /railsapp
    rails new testapp

  Run it:

    rails server -b 0.0.0.0
    #Yes, you need to specify the loopback address
