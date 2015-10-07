(function() {
  if (window.dobi == null) {
    window.dobi = {};
  }

  dobi.regex = {
    alphabetic: /^[a-zA-Z]+$/,
    alphanumeric: /^[a-zA-Z0-9]+$/,
    digit: /^[0-9]+$/,
    emoji: /([\ud800-\udbff])([\udc00-\udfff])/g,
    email: /^(?!.*([.])\1)[^.\s][^@\s]+[^@.\s]@[^\s@.]+\.[^\s@]+$/,
    hex: /^\#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/,
    url: /^((ftp|git|https?):\/\/)?[a-z0-9][a-z0-9\.\-]+\.[a-z]{2,6}(:\d{1,5})?(\/([\w\.\/\-&\?=\#]?)+)?$/,
    dailymotion_playlist: /(dailymotion.com)\/playlist\/([0-9a-z]+?)(_(.*))?(\/|$|\?)/,
    dailymotion_video: /(dailymotion.com)\/video\/([0-9a-z]+?)(_(.*))?(\/|$|\?)/,
    instagram_post: /(instagram.com)\/p\/([0-9a-zA-Z-_]+)/,
    livestream_stream: /(livestream\.com)\/(.+)/,
    twitch_channel: /(twitch.tv\/)([^\#\&\?\/]*)/,
    twitch_video: /(twitch.tv\/.+\/)([c|v])\/([0-9]+)(\/|$|\?)/,
    twitter_status: /(twitter.com)\/([A-Za-z0-9_]+)\/(status)\/([0-9]+)(\/|$|\?)/,
    ustream_channel: /(ustream.tv\/channel\/)([^\#\&\?\/]*)/,
    ustream_video: /(ustream.tv\/recorded\/)([0-9]+)/,
    vine_video: /(vine.co)\/v\/([0-9a-zA-Z]+)/,
    youku_video: /(youku\.com\/v_show\/id_)([A-Za-z-0-9]+)(\.html)?(\/|$|\?)/,
    youtube_playlist: /(youtube.com)\/(watch\?|playlist\?|p\/|view_play_list\?)(v=[^\#\&\?]*&?)?(p=|list=)?([^\#\&\?]*)/i,
    youtube_video: /(youtube.com|youtu\.be)\/(watch\?|embed\/|v\/|e\/|)(.*v=)?([^\#\&\?]*)/i,
    is: function(target, regex_name) {
      var _ref;
      if (regex_name) {
        return (_ref = $.regex[regex_name]) != null ? _ref.test(target) : void 0;
      } else {
        return {
          a: function(name) {
            var _ref1;
            return (_ref1 = $.regex[name]) != null ? _ref1.test(target) : void 0;
          },
          an: function(name) {
            var _ref1;
            return (_ref1 = $.regex[name]) != null ? _ref1.test(target) : void 0;
          }
        };
      }
    },
    version: '1.3.0'
  };

}).call(this);
