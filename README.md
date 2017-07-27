# Kit Omniauth Strategy

This is a Omniauth strategy for [Kit](https://kitcrm.com/)

More info at https://kitcrm.com/developers

## Usage

### Ruby on Rails

Place the following code in `config/initializers/omniauth.rb`  file

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :kit,
    'your API key',
    'your API secret',
    scope: 'public message stats',
    client_options: {
      headers: {
        'Accept'       => 'application/json',
        'Content-Type' => 'application/json',
      }
    }
end

```

## TODO

- Add tests

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pemberton-rank/omniauth-kit-oauth2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Omniauth::Kit::Oauth2 project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/omniauth-kit-oauth2/blob/master/CODE_OF_CONDUCT.md).

Copyright (c) 2017 Pemberton Rank Ltd
