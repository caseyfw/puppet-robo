require 'spec_helper'

describe 'robo', :type => :class do
  let(:title) { 'robo' }

  it { should contain_wget__fetch('robo-install') \
    .with_source('http://robo.li/robo.phar') \
    .with_execuser('root') \
    .with_destination('/usr/local/bin/robo')
  }

  it { should contain_exec('robo-fix-permissions') \
    .with_command('chmod a+x robo') \
    .with_user('root') \
    .with_cwd('/usr/local/bin')
  }

  describe 'with a given target_dir' do
    let(:params) {{ :target_dir => '/usr/bin' }}

    it { should contain_wget__fetch('robo-install') \
      .with_source('http://robo.li/robo.phar') \
      .with_execuser('root') \
      .with_destination('/usr/bin/robo')
    }

    it { should contain_exec('robo-fix-permissions') \
      .with_command('chmod a+x robo') \
      .with_user('root') \
      .with_cwd('/usr/bin')
    }
  end

  describe 'with a given command_name' do
    let(:params) {{ :command_name => 'r' }}

    it { should contain_wget__fetch('robo-install') \
      .with_source('http://robo.li/robo.phar') \
      .with_execuser('root') \
      .with_destination('/usr/local/bin/r')
    }

    it { should contain_exec('robo-fix-permissions') \
      .with_command('chmod a+x r') \
      .with_user('root') \
      .with_cwd('/usr/local/bin')
    }
  end

  describe 'with a given user' do
    let(:params) {{ :user => 'casey' }}

    it { should contain_wget__fetch('robo-install') \
      .with_source('http://robo.li/robo.phar') \
      .with_execuser('casey') \
      .with_destination('/usr/local/bin/robo')
    }

    it { should contain_exec('robo-fix-permissions') \
      .with_command('chmod a+x robo') \
      .with_user('casey') \
      .with_cwd('/usr/local/bin')
    }
  end
end
