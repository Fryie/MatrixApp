'use strict';

class MatrixApp.Views.Controls extends Backbone.View

  template: JST['app/scripts/templates/controls.ejs']

  events: {
    'click #new-random-matrix button' : 'newRandomMatrix'
    'click #exchange-rows button' : 'exchangeRows'
    'click #multiply-row button' : 'multiplyRow'
    'click #add-row-multiple button' : 'addRowMultiple'
  }

  newRandomMatrix: ->
    m = $('#new-random-matrix-m').val()
    n = $('#new-random-matrix-n').val()
    MatrixApp.matrix.setRandom m, n
    $('#new-random-matrix input').val ''
    false

  exchangeRows: ->
    a = $('#exchange-rows-a').val() - 1
    b = $('#exchange-rows-b').val() - 1
    MatrixApp.matrix.exchangeRows a, b
    $('#exchange-rows input').val ''
    false

  multiplyRow: ->
    row = $('#multiply-row-row').val() - 1
    factor = $('#multiply-row-factor').val()
    MatrixApp.matrix.multiplyRow row, factor
    $('#multiply-row input').val ''
    false

  addRowMultiple: ->
    a = $('#add-row-multiple-a').val() - 1
    b = $('#add-row-multiple-b').val() - 1
    factor = $('#add-row-multiple-factor').val()
    MatrixApp.matrix.addRowMultiple a, b, factor
    $('#add-row-multiple input').val ''
    false

  render: ->
    @$el.html @template()
