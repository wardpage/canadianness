noflo = require 'noflo'

# a helper to match all on a string
matchAll = (string, regexp) ->
  matches = []
  string.replace regexp, ->
    arr = [].slice.call arguments, 0
    extras = arr.splice -2
    arr.index = extras[0]
    arr.input = extras[1]
    matches.push arr
    return
  if matches.length then matches else []

# since regexing will give the `index` and the `input`, we only want the match
actualMatches = (matches) ->
  # because we want to send out an empty array if there are no matches
  return [[]] if matches.length is 0
  matches.map (match) -> match[0]

exports.getComponent = ->
  c = new noflo.Component
    description: 'Find all of the instances of `word` in `content` and send them out in a stream'
    inPorts:
      word:
        datatype: 'string' # could be array|string, which would be `all`
        description: 'the word we are looking for instances of'
        control: true
        required: true
      content:
        datatype: 'string'
        description: 'the content which we look for the word in'
        required: true
      surrounding: # could use a regex but this is a specific case
        datatype: 'boolean'
        description: 'whether to get surrounding characters, symbols before and after until space'
        default: false # if nothing is sent to it, this is the default when `get`ting from it
        control: true
    outPorts:
      matches:
        datatype: 'string'
        description: 'the resulting findings as a stream of data packets'
        required: true

  # we are only using data,
  # so we do not need any brackets sent to the inPorts, pass them along
  #
  # control ports do not have brackets,
  # so we don't need to do anything special with them
  c.forwardBrackets =
    content: 'matches'
  c.process (input, output) ->
    # if it is not data, remove it from the buffer
    return input.buffer.get().pop() if input.ip.type isnt 'data'
    # make sure we have data in the required inPorts
    return unless input.has 'word', 'content', (ip) -> ip.type is 'data'

    # since we are sending out multiple `data` IPs
    # we want to wrap them in brackets
    output.send matches: new noflo.IP 'openBracket', content

    # get the data from our in ports
    word = input.getData 'word'
    content = input.getData 'content'

    # do our word processing
    r = /([.?!]*eh[.?!]*)/gi
    matches = matchAll content, r
    matches = actualMatches matches

    # for each of our matches, send them out
    for match in matches
      # if you just send content, it will automatically put it in a data ip
      # so this is the same as `output.send matches: new noflo.IP 'data', match`
      output.send matches: match

    # this is the same as doing `output.send` and then `output.done`
    output.sendDone matches: new noflo.IP 'closeBracket', content
