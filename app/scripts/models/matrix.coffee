'use strict';

class MatrixApp.Models.Matrix extends Backbone.Model
  defaults: {
    matrix: []
  }

  row: (i) ->
    @get('matrix')[i]

  column: (i) ->
    @transpose().get('matrix')[i]

  numRows: ->
    @get('matrix').length

  numColumns: ->
    @transpose().numRows()

  transpose: ->
    transposed = _.zip.apply(_, @get('matrix'))
    new Matrix matrix: transposed

  clone: ->
    _.map @get('matrix'), _.clone

  exchangeRows: (row1, row2) ->
    newMatrix = @clone()
    newMatrix[row1] = @get('matrix')[row2]
    newMatrix[row2] = @get('matrix')[row1]
    new Matrix matrix: newMatrix

  multiplyRow: (row, a) ->
    newMatrix = @clone()
    newMatrix[row] = _.map @get('matrix')[row], (entry) ->
      entry * a
    new Matrix matrix: newMatrix

  addRowMultiple: (row1, row2, a) ->
    newMatrix = @clone()
    newMatrix[row1] = _.map @get('matrix')[row1], (entry, i) =>
      entry + a * @get('matrix')[row2][i]
    new Matrix matrix: newMatrix

MatrixApp.Models.Matrix.random = (m, n) ->
  randomEntry = ->
    Math.floor Math.random()*500

  randomRow = ->
    randomEntry() for j in [0...n]

  matrix = (randomRow() for i in [0...m])
  
  new MatrixApp.Models.Matrix matrix: matrix
