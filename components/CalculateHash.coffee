noflo = require 'noflo'
md5 = require '../vendor/md5.min.js'

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'cog'
  c.description = 'Calculates a MD5 hash to a given string'

  c.inPorts.add 'in',
    datatype: 'string'
    process: (event, payload) ->
      return unless event is 'data'
      return unless c.outPorts.hash.isAttached()
      c.outPorts.hash.send md5.md5 payload

  c.outPorts.add 'hash',
    datatype: 'string'

  c
