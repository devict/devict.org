# Be sure to restart your server when you modify this file.

UpfrontwichitaCom::Application.config.session_store :cookie_store, key: '_upfrontwichita.com_session'

UpfrontwichitaCom::Application.config.session = {
  :key          => '_omniauthpure_session',     # name of cookie that stores the data
  :domain       => nil,                         # you can share between subdomains here: '.communityguides.eu'
  :expire_after => 1.month,                     # expire cookie
  :secure       => false,                       # fore https if true
  :httponly     => true,                        # a measure against XSS attacks, prevent client side scripts from accessing the cookie

  :secret      => '8cfa74fe6ae8c72e41ff1dba560379aa1576b77a550e46d101249ee2489ea7c8f07272bc468c2d2d2d0a1587671a6354f950d07bd55a7a384c0ffe93c8d0348'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# UpfrontwichitaCom::Application.config.session_store :active_record_store
