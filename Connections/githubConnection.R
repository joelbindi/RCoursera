# library(httr)
# 
# # 1. Find OAuth settings for github:
# #    http://developer.github.com/v3/oauth/
# oauth_endpoints("github")
# 
# # 2. To make your own application, register at at
# #    https://github.com/settings/applications. Use any URL for the homepage URL
# #    (http://github.com is fine) and  http://localhost:1410 as the callback url
# #
# #    Replace your key and secret below.
# myapp <- oauth_app("github",
#                    key = "54ffdbb67729875c2fe6",
#                    secret = "7db6d06b2f2223493009ca76fc68e64bb45e4cb7")
# 
# # 3. Get OAuth credentials
# github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
# 
# # 4. Use API
# gtoken <- config(token = github_token)
# req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
# stop_for_status(req)
# content(req)
# 
# # OR:
# req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos1"))
# stop_for_status(req)
# content(req)


#AUTHOR https://github.com/benjamin-chan/GettingAndCleaningData/blob/master/Quiz2/quiz2.Rmd
library(httr)
require(httpuv)
require(jsonlite)


# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url


myapp <- oauth_app("quiz2", "54ffdbb67729875c2fe6", secret="7db6d06b2f2223493009ca76fc68e64bb45e4cb7")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
output <- content(req)
list(output[[4]]$name, output[[4]]$created_at)
