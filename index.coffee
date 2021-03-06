noflo = require 'noflo'
trace = require('noflo-runtime-base').trace

unless noflo.isBrowser()
  baseDir = __dirname
else
  baseDir = '/canadianness'

spellingData = [{"Canadian":["calibre"],"British":["calibre"],"American":["caliber"],"Notes":""},{"Canadian":["caliper"],"British":["caliper"],"American":["caliper","calliper"],"Notes":""},{"Canadian":["cancellation"],"British":["cancellation"],"American":["cancelation"],"Notes":""},{"Canadian":["cancelled/cancelling"],"British":["cancelled/cancelling"],"American":["canceled/canceling"],"Notes":""},{"Canadian":["candour","candor"],"British":["candour"],"American":["candor"],"Notes":""},{"Canadian":["capitalize"],"British":["capitalise","capitalize"],"American":["capitalize"],"Notes":""},{"Canadian":["caramelize"],"British":["caramelise","caramelize"],"American":["caramelize"],"Notes":""},{"Canadian":["carburetor"],"British":["carburettor"],"American":["carburetor"],"Notes":""},{"Canadian":["catalogue"],"British":["catalogue"],"American":["catalog","catalogue"],"Notes":""},{"Canadian":["catalyze"],"British":["catalyse"],"American":["catalyze"],"Notes":""},{"Canadian":["categorization"],"British":["categorisation","categorization"],"American":["categorization"],"Notes":""},{"Canadian":["categorize"],"British":["categorise","categorize"],"American":["categorize"],"Notes":""},{"Canadian":["cauldron"],"British":["cauldron"],"American":["cauldron","caldron"],"Notes":""},{"Canadian":["cauterize"],"British":["cauterise","cauterize"],"American":["cauterize"],"Notes":""},{"Canadian":["centimetre"],"British":["centimetre"],"American":["centimeter"],"Notes":""},{"Canadian":["centre"],"British":["centre"],"American":["center"],"Notes":""},{"Canadian":["cesarean","caesarian"],"British":["caesarean"],"American":["cesarean","caesarean"],"Notes":""},{"Canadian":["cesium"],"British":["caesium"],"American":["cesium"],"Notes":""},{"Canadian":["characterize"],"British":["characterise","characterize"],"American":["characterize"],"Notes":""},{"Canadian":["checkered","chequered"],"British":["chequered"],"American":["checkered"],"Notes":""},{"Canadian":["cheque"],"British":["cheque"],"American":["check"],"Notes":"noun, meaning 'form of payment'; otherwise check"},{"Canadian":["chili"],"British":["chilli","chili"],"American":["chili","chile"],"Notes":""},{"Canadian":["cigarette"],"British":["cigarette"],"American":["cigarette","cigaret"],"Notes":""},{"Canadian":["cipher"],"British":["cipher","cypher"],"American":["cipher"],"Notes":""},{"Canadian":["civilization"],"British":["civilisation","civilization"],"American":["civilization"],"Notes":""},{"Canadian":["civilize"],"British":["civilise","civilize"],"American":["civilize"],"Notes":""},{"Canadian":["clamour","clamor"],"British":["clamour"],"American":["clamor"],"Notes":""},{"Canadian":["clangour","clangor"],"British":["clangour"],"American":["clangor"],"Notes":""},{"Canadian":["co-author","coauthor"],"British":["co-author"],"American":["coauthor"],"Notes":""},{"Canadian":["colonize"],"British":["colonise","colonize"],"American":["colonize"],"Notes":""},{"Canadian":["colour"],"British":["colour"],"American":["color"],"Notes":""},{"Canadian":["commercialize"],"British":["commercialise","commercialize"],"American":["commercialize"],"Notes":""},{"Canadian":["computerize"],"British":["computerise","computerize"],"American":["computerize"],"Notes":""},{"Canadian":["connection"],"British":["connection","connexion"],"American":["connection"],"Notes":""},{"Canadian":["conjuror","conjurer"],"British":["conjuror","conjurer"],"American":["conjuror","conjurer"],"Notes":"both spellings equally acceptable"},{"Canadian":["co-opt","coopt"],"British":["co-opt"],"American":["coopt"],"Notes":""},{"Canadian":["councillor","councilor"],"British":["councillor"],"American":["councilor"],"Notes":""},{"Canadian":["counselled/counselling"],"British":["counselled/counselling"],"American":["counseled/counseling"],"Notes":""},{"Canadian":["counsellor"],"British":["counsellor"],"American":["counselor"],"Notes":""},{"Canadian":["counter-attack"],"British":["counter-attack"],"American":["counterattack"],"Notes":""},{"Canadian":["cozy","cosy"],"British":["cosy"],"American":["cozy"],"Notes":""},{"Canadian":["criticize"],"British":["criticise"],"American":["criticize"],"Notes":""},{"Canadian":["crueller/cruellest"],"British":["crueller/cruellest"],"American":["crueler/cruelest"],"Notes":""},{"Canadian":["crystalline"],"British":["crystalline"],"American":["crystaline"],"Notes":""},{"Canadian":["crystallize"],"British":["crystallise","crystallize"],"American":["crystalize","crystallize"],"Notes":""},{"Canadian":["curb"],"British":["curb","kerb"],"American":["curb"],"Notes":"kerb only used for noun meaning 'edge of road' in UK; other meanings curb"},{"Canadian":["customize"],"British":["customise","customize"],"American":["customize"],"Notes":""},{"Canadian":[""],"British":[""],"American":[""],"Notes":""},{"Canadian":["abridgement","abridgment"],"British":["abridgement"],"American":["abridgment"],"Notes":""},{"Canadian":["acknowledgement","acknowledgment"],"British":["acknowledgement"],"American":["acknowledgment","acknowledgement"],"Notes":""},{"Canadian":["advertise"],"British":["advertise"],"American":["advertise","advertize"],"Notes":""},{"Canadian":["aegis","egis"],"British":["aegis"],"American":["egis"],"Notes":""},{"Canadian":["aeon","eon"],"British":["aeon"],"American":["eon"],"Notes":""},{"Canadian":["aesthetic","esthetic"],"British":["aesthetic"],"American":["esthetic","aesthetic"],"Notes":""},{"Canadian":["aging","ageing"],"British":["ageing","aging"],"American":["aging"],"Notes":""},{"Canadian":["airplane"],"British":["aeroplane"],"American":["airplane"],"Notes":""},{"Canadian":["aluminum"],"British":["aluminium"],"American":["aluminum"],"Notes":""},{"Canadian":["amid","amidst"],"British":["amid","amidst"],"American":["amid"],"Notes":""},{"Canadian":["amoeba"],"British":["amoeba"],"American":["ameba"],"Notes":""},{"Canadian":["among","amongst"],"British":["among","amongst"],"American":["among"],"Notes":""},{"Canadian":["amortization"],"British":["amortisation","amortization"],"American":["amortization"],"Notes":""},{"Canadian":["amortize"],"British":["amortise","amortize"],"American":["amortize"],"Notes":""},{"Canadian":["amphitheatre"],"British":["amphitheatre"],"American":["amphitheater"],"Notes":""},{"Canadian":["anaesthesia","anesthesia"],"British":["anaesthesia"],"American":["anesthesia"],"Notes":""},{"Canadian":["analogue","analog"],"British":["analogue"],"American":["analogue","analog"],"Notes":"analog when used as a technical term (i.e. not digital)"},{"Canadian":["analyze","analyse"],"British":["analyse"],"American":["analyze"],"Notes":""},{"Canadian":["anemia","anaemia"],"British":["anaemia"],"American":["anemia"],"Notes":""},{"Canadian":["anemic","anaemic"],"British":["anaemic"],"American":["anemic"],"Notes":""},{"Canadian":["annex"],"British":["annexe","annex"],"American":["annex"],"Notes":"noun meaning 'something added'; verb is always annex"},{"Canadian":["apologize"],"British":["apologise","apologize"],"American":["apologize"],"Notes":""},{"Canadian":["appal","appall"],"British":["appal"],"American":["appall"],"Notes":"appalled/appalling in all countries"},{"Canadian":["appetizer"],"British":["appetiser","appetizer"],"American":["appetizer"],"Notes":""},{"Canadian":["arbour","arbor"],"British":["arbour"],"American":["arbor"],"Notes":""},{"Canadian":["archaeology","archeology"],"British":["archaeology"],"American":["archeology","archaeology"],"Notes":""},{"Canadian":["ardour","ardor"],"British":["ardour"],"American":["ardor"],"Notes":""},{"Canadian":["artifact"],"British":["artefact"],"American":["artifact"],"Notes":""},{"Canadian":["armour","armor"],"British":["armour"],"American":["armor"],"Notes":""},{"Canadian":["authorize"],"British":["authorise","authorize"],"American":["authorize"],"Notes":""},{"Canadian":["axe"],"British":["axe"],"American":["ax"],"Notes":""},{"Canadian":[""],"British":[""],"American":[""],"Notes":""}]
listData = {"eh": 11, "eh!": 11}

canadianness = (args, cb) ->
  spellingData = args['spelling']
  wordsData = args['words']
  # debugging [optional]
  debug = args['debug'] or false
  contentData = args['content']

  loader = new noflo.ComponentLoader baseDir
  # project name / graph or component name
  loader.load 'canadianness/Canadianness', (err, instance) ->
    throw err if err

    if debug
      # instantiate our Tracer
      tracer = new trace.Tracer()

    instance.once 'ready', ->
      if debug
        tracer.attach instance.network

      instance.start()

      # outPorts
      score = noflo.internalSocket.createSocket()
      emotion = noflo.internalSocket.createSocket()

      # inPorts
      spelling = noflo.internalSocket.createSocket()
      words = noflo.internalSocket.createSocket()
      content = noflo.internalSocket.createSocket()

      # attach them
      instance.inPorts.content.attach content
      instance.inPorts.spelling.attach spelling
      instance.inPorts.words.attach words
      instance.outPorts.score.attach score
      instance.outPorts.emotion.attach emotion

      # scoped variables since we don't know which data comes in first
      scoreData = null
      emotionData = null

      # when we listen for data, we can call this
      # to check if both have received data
      # when they have, call the callback
      # and then, if we are debugging, write the trace
      # and log where we wrote it to
      finished = ->
        return unless scoreData? and emotionData?
        cb emotionData, scoreData

        if debug
          tracer.dumpFile null, (err, f) ->
            throw err if err
            console.log 'Wrote flowtrace to', f

      # listen for data
      score.on 'data', (data) ->
        scoreData = data
        finished()

      emotion.on 'data', (data) ->
        emotionData = data
        finished()

      # send the data
      words.send wordsData
      spelling.send spellingData
      content.send contentData

canadianness {spelling: spellingData, words: listData, content: 'eh', debug: true}, (score, emotion) ->
  console.log score, emotion
