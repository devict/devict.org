Rails.application.middleware.use OmniAuth::Builder do
    provider :twitter, 'soACn7JBJX4hgD8DnCltLg', 'iUALjJr5pgizorBJ3HoII0wN6iLyozmiSdis3QPIHA'
    provider :github, 'aba62c5941e052569974', '09990402d3f1df0513ad2ab949c56530539a7df9'
    provider :google_oauth2, '23210957625.apps.googleusercontent.com', 'RfKXzuPMxH3RiqrbsJ9ljAKx'
end
