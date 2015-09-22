# Redmine Remote Login Plugin

Плагин позволяет авторизоваться в Redmine через форму, расположеннную на другом сайте, как это сделано на сайте
[Centos-admin.ru](http://centos-admin.ru).

## Настройка плагина

В настройке плагина нужно указать только токен, с использованием которого будет происходить авторизация.

## Настройки на стороне внешнего сайта (Ruby on Rails)

Токен для формы удобней всего генерировать внутри хлепера

```ruby
def authenticity_token
  token = Settings.redmine_remote_login_token
  Base64.encode64 "#{token}-#{request.host}-#{Date.today}"
end
```  

В этом коде нужно заменить строку

```ruby
token = Settings.redmine_remote_login_token
```  

на вашу логику получения токена. Можно хоть напрямую его прописать.

После этого нужно в форму авторизации подставить вызов этого хелпера

```erb

<%= form_tag 'https://factory.southbridge.ru/remote_login',
              authenticity_token: authenticity_token do %>

```

Плагин разработан [Centos-admin.ru](http://centos-admin.ru/).
