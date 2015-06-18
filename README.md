puppet-robo
===============

[![Build
Status](https://secure.travis-ci.org/caseyfw/puppet-robo.png)](http://travis-ci.org/caseyfw/puppet-robo)

This module installs [Robo](http://robo.li/), a task runner
for PHP.

This puppet module uses Will Durand's Composer module as a template. See
https://forge.puppetlabs.com/willdurand/composer


Installation
------------

Using the Puppet Module Tool, install the
[`caseyfw/robo`](http://forge.puppetlabs.com/caseyfw/robo) by
running the following command:

    puppet module install caseyfw/robo

Otherwise, clone this repository and make sure to install the proper
dependencies ([`puppet-wget`](https://github.com/maestrodev/puppet-wget)):

    git clone git://github.com/caseyfw/puppet-robo.git modules/robo

**Important:** the right `puppet-wget` module is
[maestrodev/puppet-wget](https://github.com/maestrodev/puppet-wget). You should
**not** use any other `puppet-wget` module. Example42's module won't work for
instance. So, please, run the following command:

    git clone git://github.com/maestrodev/puppet-wget.git modules/wget


Usage
-----

Include the `robo` class:

    include robo

You can specify the command name you want to get, and the target directory (aka
where to install Robo):

    class { 'robo':
      command_name => 'robo',
      target_dir   => '/usr/local/bin'
    }

You can specify a particular `user` that will be the owner of the Robo
executable:

    class { 'robo':
      user => 'foo',
    }


Running the tests
-----------------

Install the dependencies using [Bundler](http://gembundler.com):

    BUNDLE_GEMFILE=.gemfile bundle install

Run the following command:

    BUNDLE_GEMFILE=.gemfile bundle exec rake spec


License
-------

puppet-robo is released under the MIT License. See the bundled LICENSE file
for details.
