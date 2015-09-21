require 'redmine'
require_dependency 'remote_login/account_controller_patch'

Redmine::Plugin.register :remote_login do
  name 'Remote Login plugin'
  description 'This is a plugin for remote login to Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  author 'Centos-admin.ru'
  author_url 'http://centos-admin.ru'
  settings(default: {
               'token' => 'cm9ja2V0LWFkbWluOiAyMDE1LTA5LTIx'
           }, partial: 'settings/remote_login_settings')
end
