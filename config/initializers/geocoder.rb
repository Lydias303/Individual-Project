Geocoder.configure(

:lookup => :bing,

:api_key => Figaro.env.bing_api_key,

:use_https => true,

:timeout=> 20
  )


# Geocoder.configure(
#
#   :api_key=> "AIzaSyCen0qZ8OEjFdrDjh4ZEgayYh81gPgyc-c",
#

#
#   :lookup=>:google,
#
#   # :ip_lookup=>:telize,
#
#   :language=>:en,
#
#   :http_headers=>{},
#
  # :use_https=> true
  # )
#
#   :http_proxy=> nil,
#
#   :https_proxy=> nil,
#
#   :cache=>nil,
#
#   :cache_prefix=>"geocoder:",
#   #
#   # :units=>:km,
#   #
#   # :distances=>:linear
#
# )
