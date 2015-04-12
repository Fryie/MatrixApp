'use strict';

class MatrixApp.Models.Matrix extends Backbone.Model
  defaults: {
    matrix: []
  }

  row: (i) ->
    @get('matrix')[i]

  column: (i) ->
    @transposedArray()[i]

  numRows: ->
    @get('matrix').length

  numColumns: ->
    @transposedArray().length

  transpose: ->
    @set 'matrix', @transposedArray()

  transposedArray: ->
    _.zip.apply(_, @get('matrix'))

  clone: ->
    _.map @get('matrix'), _.clone

  exchangeRows: (row1, row2) ->
    newMatrix = @clone()
    newMatrix[row1] = @get('matrix')[row2]
    newMatrix[row2] = @get('matrix')[row1]
    @set 'matrix', newMatrix

  multiplyRow: (row, a) ->
    newMatrix = @clone()
    newMatrix[row] = _.map @get('matrix')[row], (entry) ->
      entry.clone().mul a
    @set 'matrix', newMatrix

  addRowMultiple: (row1, row2, a) ->
    newMatrix = @clone()
    newMatrix[row1] = _.map @get('matrix')[row1], (entry, i) =>
      entry.clone().add @get('matrix')[row2][i].clone().mul(a)
    @set 'matrix', newMatrix

  random: (m, n) ->
    randomEntry = ->
      number = Math.floor Math.random()*500
      new Fraction number, 1

    randomRow = ->
      randomEntry() for j in [0...n]

    (randomRow() for i in [0...m])

  setRandom: (m, n) ->
    @set 'matrix', @random(m, n)
