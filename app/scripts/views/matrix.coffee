'use strict';

class MatrixApp.Views.Matrix extends Backbone.View

  template: JST['app/scripts/templates/matrix.ejs']

  tagName: 'div'

  events: {}

  initialize: () ->
    @listenTo @model, 'change', @render

  render: () ->
    @$el.html @template(matrixRows: @matrixRows())

  matrixRows: () ->
    _.map(@model.get('matrix'), (row) ->
      row.join ' && '
    ).join ' \\\\ '

