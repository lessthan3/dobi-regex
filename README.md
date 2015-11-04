# dobi-regex

A powerful regular expression toolkit for front-end web developers.

### Usage

**Regular Expression Access**
All regular expressions can be accessed by passing in the key of your desired test to `dobi.`

**String Testing**
`dobi.regex.is(<string>).a(<regexp key>)`
`dobi.regex.is(<string>).an(<regexp key>)`

##### Simple Examples
```js
// grab a youtube video id
var youtube_url = "https://www.youtube.com/watch?v=SLjQ1hHZPMU";
var youtube_video_id = dobi.regex.youtube_video.exec(youtube_url)[4];

// check to see if string is an email
var invalid_email = "invalid_email@domain";
var is_email = dobi.regex.is(invalid_email).an.('email'); // returns false

// check to see if a hex is valid
var is_hex = dobi.regex.is('#FFFFFF').a.('hex'); // returns true

// get twitter_status regular expression
var twitter_status = "http://twitter.com/#!/allWPthemes/status/2040410213974016";
var twitter_regexp = dobi.regex.twitter_status;
var twitter_id = twitter_regexp.exec(status)
```

### Regular Expression Map

| key | Example |
| ---- | ---- |
| alphabetic | asdfASFDasdf |
| alphanumeric |  asdf123ASDF123  |
| dailymotion_playlist |  http://www.dailymotion.com/playlist/x3gkwj_TigerTimpani_dance-bands-jazz-4/  |
| dailymotion_video |  http://www.dailymotion.com/video/x2d7qsv_acura-nsx-sneak-peek-video_auto  |
| digit |  123  |
| email |  my_email@address.org  |
| emoji |  😬  |
| hex |  #BBB  |
| instagram_post |  http://instagram.com/p/mrOtidmScU  |
| livestream_stream |  http://www.livestream.com/necn_live  |
| twitch_channel |  http://www.twitch.com/deadmau5  |
| twitch_video | http://www.twitch.tv/ezekiel_iii/v/3795378 |
| twitter_status | http://twitter.com/#!/allWPthemes/status/2040410213974016 |
| url |  https://www.examples.com/page?params=true  |
| ustream_channel |  http://www.ustream.tv/channel/wv-wildlife  |
| ustream_video |  http://www.ustream.tv/recorded/3371638  |
| vine_video |  https://vine.co/v/MgBWtqVBuuY  |
| youku_video |  http://v.youku.com/v_show/id_XODk1ODY5MDAw  |
| youtube_playlist | https://www.youtube.com/p/19B0B5CCFEF1C0C9 |
| youtube_video |  https://www.youtube.com/e/SLjQ1hHZPMU  |

### Installation

Include the plugin:
```
<script src="build/dobi-regex.min.js"></script>
```

### License

The MIT License (MIT)

dobi-regex: Copyright (c) 2015 Maestro.io

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
