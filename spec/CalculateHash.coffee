noflo = require 'noflo'
unless noflo.isBrowser()
  chai = require 'chai' unless chai
  CalculateHash = require '../components/CalculateHash.coffee'
else
  CalculateHash = require 'noflo-md5/components/CalculateHash.js'

describe 'CalculateHash component', ->
  c = null
  ins = null
  out = null
  beforeEach ->
    c = CalculateHash.getComponent()
    ins = noflo.internalSocket.createSocket()
    out = noflo.internalSocket.createSocket()
    c.inPorts.in.attach ins
    c.outPorts.out.attach out

  describe 'when instantiated', ->
    it 'should have an input port', ->
      chai.expect(c.inPorts.in).to.be.an 'object'
    it 'should have an output port', ->
      chai.expect(c.outPorts.out).to.be.an 'object'
