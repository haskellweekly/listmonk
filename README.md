# Listmonk

This repository is responsible for deploying [Haskell Weekly][1]'s [listmonk][2] instance to [Fly][3].
Most people will be more interested in the [haskellweekly/haskellweekly][4] repository.

[1]: https://haskellweekly.news
[2]: https://listmonk.app
[3]: https://fly.io
[4]: https://github.com/haskellweekly/haskellweekly

## Initial setup

1. Create a new user role
  - `/admin/users/roles/users`
  - Name doesn't matter
  - Needs `lists:get_all` and `campaigns:*` permissions
2. Create a new user
  - `/admin/users`
  - Make sure it's an API user and that it's enabled
  - The username and name don't matter, but you'll need the username to configure Haskell Weekly
  - Use the role you just created
  - The list role can be "none", which is the default
3. Store the user's API access token
4. Create a new list
  - `/admin/lists`
  - Name doesn't matter
  - Type is private
  - Opt in is double
  - No tags or description
  - Not archived
5. Store the list's ID and UUID
6. Configure general settings
  - `/admin/settings`
  - These: site name, root URL, default from email, admin notification e-mails
  - Be sure to hit "save"
7. Enable CAPTCHA under security settings
8. Configure SMTP
  - <https://us-east-1.console.aws.amazon.com/ses/home?region=us-east-1#/smtp>
  - Username is an access key ID and password is the secret access key
  - Send a test email when you're done to make sure it works
9. Configure bounce processing
  - <https://listmonk.app/docs/bounces/#amazon-simple-email-service-ses>
