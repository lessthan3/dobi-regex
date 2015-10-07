
# dependencies
UglifyJS = require 'uglify-js'
coffee = require 'coffee-script'
fs = require 'fs'
{spawn, exec} = require 'child_process'

# build task: compile src -> build
task 'build', ->

  # read source
  source = fs.readFileSync 'src/dobi-regex.coffee', 'utf8'

  # compile
  {js, sourceMap, v3SourceMap} = coffee.compile source, {
    sourceMap: true
  }
  fs.writeFileSync 'build/dobi-regex.js', js
  fs.writeFileSync 'build/dobi-regex.map.js', v3SourceMap

  # minified
  js = UglifyJS.minify(js, {
    fromString: true
    mangle: true
  }).code
  fs.writeFileSync 'build/dobi-regex.min.js', js

# command executor
run = (args...) ->
  for a in args
    switch typeof a
      when 'string' then command = a
      when 'object'
        if a instanceof Array then params = a
        else options = a
      when 'function' then callback = a

  command += ' ' + params.join ' ' if params?
  cmd = spawn '/bin/sh', ['-c', command], options
  cmd.stdout.on 'data', (data) -> process.stdout.write data
  cmd.stderr.on 'data', (data) -> process.stderr.write data
  process.on 'SIGHUP', -> cmd.kill()
  cmd.on 'exit', (code) -> callback() if callback? and code is 0
