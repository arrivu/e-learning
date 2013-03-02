Rails.application.config.middleware.use OmniAuth::Builder do
  # The following is for facebook
  # provider :facebook,  "312875045482031", '650ffb56571917b1b0c08200bf85677c', {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}

  # Local Host
  provider :facebook, '586163688080266', '093ab151dc5385a434b0e03815ac851f'
  provider :linkedin, '31azcdigi8tt', "OKd1hmuJoNOg9J2g"
  provider :google_oauth2, '928801233183', '-nMQ0dEfcaBITxzwYHZPQ3v-'

#heroku
  # provider :facebook, '	151537311672530', 'ed4a4725a9ff31f3ead5d201ddcb7476'
  # provider :linkedin, 'gl1h6zyltlem', "wIfucZImlYGqFO3r"
  # provider :google_oauth2, '928801233183-dg701idms6tr6907bk6m2i8boishu4io.apps.googleusercontent.com', 'n61XG48z1DMc6kGiY6zCuiUM'
  # # If you want to also configure for additional login services, they would be configured here.

#   provider :facebook, '312875045482031', '650ffb56571917b1b0c08200bf85677c'
#   provider :linkedin, '31azcdigi8tt', "OKd1hmuJoNOg9J2g"
#   provider :google_oauth2, "521962606368", "n00lVpckSyzNOiRS2pdIDjol"
#   # If you want to also configure for additional login services, they would be configured here.
end