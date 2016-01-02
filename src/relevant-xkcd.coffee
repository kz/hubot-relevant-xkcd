# Description
#   Find a relevant XKCD for a phrase
#
# Configuration:
#   None
#
# Commands:
#   hubot relevant xkcd <phrase>
#
#
# Notes:
#   None
#
# Author:
#   Kelvin Zhang <me@iamkelv.in>

module.exports = (robot) ->
  robot.respond /relevant xkcd\s+(.+)/i, (msg) ->
    phrase = "#{msg.match[1]}"

    # Get a relevant XKCD by phrase
    msg.http("https://relevantxkcd.appspot.com/process?action=xkcd&query=#phrase")
    .get() (err, res, body) ->
      if res.statusCode != 200
        msg.send 'An error has occurred. Is https://relevantxkcd.appspot.com/ up?'
      else
        # Extract appropriate data from response
        responseData = body.match(/(0.\d+) 0 (\d+) .*/i)
        percentageCertainty = responseData[1]
        comicNumber = "#{responseData[2]}"

        # Get the comic details from XKCD
        msg.http("http://xkcd.com/#{comicNumber}/info.0.json")
        .get() (err, res, body) ->
          if res.statusCode == 404
            msg.send 'Comic #{num} not found.'
          else
            object = JSON.parse(body)
            msg.send object.title, object.img, object.alt


