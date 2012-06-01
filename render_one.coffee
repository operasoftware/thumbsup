page = require('webpage').create()
system = require 'system'

[url, dst, width, height, ua] = system.args[1..]

page.userAgent = ua
page.viewportSize = {width: width, height: height}
console.log("DEBUG: Attempting to fetch #{ url }")
page.open url, (status) ->
    if status is 'success'
        console.log("INFO: Saved #{ url } screenshot as #{ dst }")
        window.setTimeout (-> page.render dst; phantom.exit(0)), 200
    else
        console.log('ERROR: Unable to load the address!')
        phantom.exit(1)
