window.dobi ?= {}
dobi.regex =

  alphabetic: /^[a-zA-Z]+$/

  alphanumeric: /^[a-zA-Z0-9]+$/

  digit: /^[0-9]+$/

  emoji: /([\ud800-\udbff])([\udc00-\udfff])/g

  email: ///
    ^                 # start of line
    (?!.*([.])\1)     # prevent duplicate period character
    [^.\s]            # cannot start with a period
    [^@\s]+           # any character except @
    [^@.\s]            # last character before @ cannot be a period
    @                 # @ symbol
    [^\s@.]+           # one or more non-space or @ symbol
    \.                 # a period
    [^\s@]+           # one or more non-space or @ symbol
    $                 # end of line
  ///

  hex: ///
    ^                 # start of line
    \#                # start with a #
    (
      [A-Fa-f0-9]{6}  # 6 character hex values
      |
      [A-Fa-f0-9]{3}  # 3 character hex values
    )
    $                 # end of line
  ///

  url: ///
    ^                         # start of line
    ((ftp|git|https?):\/\/)?  # protocol
    [a-z0-9]                  # any character or digit
    [a-z0-9\.\-]+             # any character, digit, period and dash
    \.                        # period
    [a-z]{2,6}                # 2 to 6 top-level domain
    (:\d{1,5})?               # optional 1 to 5 digit port
    (\/([\w\.\/\-&\?=\#]?)+)? # optional character, period, &, ?, =, #
    $                         # end of line
  ///

  # http://www.dailymotion.com/playlist/x3gkwj_TigerTimpani_dance-bands-jazz-4/
  # http://www.dailymotion.com/playlist/324-bands-jazz-4/1#video=x19h7oo
  dailymotion_playlist: ///
   (dailymotion.com)\/                    # dailymotion domain
   playlist\/                             # playlist check
   ([0-9a-z]+?)                           # playlist id
   (_(.*))?                               # optional underscore then slug
   (\/|$|\?)                              # end with / or query or end of string
  ///

  # http://www.dailymotion.com/video/x2d7qsv_acura-nsx-sneak-peek-video_auto
  dailymotion_video: ///
   (dailymotion.com)\/                    # dailymotion domain
   video\/                                # video check
   ([0-9a-z]+?)                           # video id
   (_(.*))?                               # optional underscore then slug
   (\/|$|\?)                              # end with / or query or end of string
  ///

  # http://instagram.com/p/mrOtidmScU
  instagram_post: ///
    (instagram.com)\/                     # instagram domain
    p\/                                   # post check
    ([0-9a-zA-Z-_]+)                      # post id
  ///

  # http://www.livestream.com/necn_live
  livestream_stream: ///
    (livestream\.com)\/                   # livestream domain
    (.+)                                  # video id
  ///

  twitch_channel: ///
    (twitch.tv\/)                         # twitch domain
    ([^\#\&\?\/]*)                        # channel name
  ///

  # http://www.twitch.tv/twitch/c/6055863
  # http://www.twitch.tv/summit1g/v/3734696
  # http://www.twitch.tv/ezekiel_iii/v/3795378
  twitch_video: ///
    (twitch.tv\/.+\/)                     # twitch domain
    ([c|v])\/                             # first id part
    ([0-9]+)                              # video id
    (\/|$|\?)                             # end with / or query or end of string
  ///

  # http://twitter.com/allWPthemes/status/2040410213974016
  # http://twitter.com/#!/allWPthemes/status/2040410213974016
  # playlist_id = re.exec(url)[4]
  twitter_status: ///
    (twitter.com)\/                       # twitter domain
    ([A-Za-z0-9_]+)\/                     # username
    (status)\/                            # status
    ([0-9]+)                              # tweet id
    (\/|$|\?)                             # end with / or query or end of string
  ///

  ustream_channel: ///
    (ustream.tv\/channel\/)               # ustream domain
    ([^\#\&\?\/]*)                        # channel name
  ///

  ustream_video: ///
    (ustream.tv\/recorded\/)              # ustream domain and forward slash
    ([0-9]+)                              # video id
  ///

  # https://vine.co/v/MgBWtqVBuuY
  vine_video: ///
    (vine.co)\/                           # vine domain
    v\/                                   # video check
    ([0-9a-zA-Z]+)                        # video id
  ///

  # http://v.youku.com/v_show/id_XODk1ODY5MDAw
  # http://v.youku.com/v_show/id_XODk1ODY5MDAw.html
  youku_video: ///
    (youku\.com\/v_show\/id_)             # youku domain
    ([A-Za-z-0-9]+)                       # video id
    (\.html)?                             # optional .html
    (\/|$|\?)                             # end with / or query or end of string
  ///

  # https://www.youtube.com/watch?v=-ijQzUI4D5o&list=PLD7F507AC8565F2F9
  # https://www.youtube.com/playlist?list=PLD7F507AC8565F2F9
  # https://www.youtube.com/p/19B0B5CCFEF1C0C9
  # https://www.youtube.com/view_play_list?p=19B0B5CCFEF1C0C9
  # playlist_id = re.exec(url)[5]
  youtube_playlist: ///
    (youtube.com)                             # youtube domain
    \/                                        # forward slash
    (watch\?|playlist\?|p\/|view_play_list\?) # potential routes
    (v=[^\#\&\?]*&?)?                         # optional v=video_id
    (p=|list=)?                               # optional p= or list=
    ([^\#\&\?]*)                              # the playlist id
  ///i

  # https://www.youtube.com/watch?v=SLjQ1hHZPMU
  # https://www.youtube.com/embed/SLjQ1hHZPMU
  # https://www.youtube.com/v/SLjQ1hHZPMU
  # https://www.youtube.com/e/SLjQ1hHZPMU
  # http://youtu.be/SLjQ1hHZPMU
  # http://www.youtube.com/watch?feature=player_embedded&v=l488AjVjowg
  # video_id = re.exec(url)[4]
  youtube_video: ///
    (youtube.com|youtu\.be)               # youtube domain
    \/                                    # forward slash
    (watch\?|embed\/|v\/|e\/|)            # potential routes
    (.*v=)?                               # optional v=
    ([^\#\&\?]*)                          # the video id
  ///i

  is: (target, regex_name) ->
    if regex_name
      $.regex[regex_name]?.test target
    else
      return {
        a: (name) ->
          $.regex[name]?.test target
        an: (name) ->
          $.regex[name]?.test target
      }

  version: '1.3.0'
