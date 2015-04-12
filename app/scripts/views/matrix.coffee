'use strict';

class MatrixApp.Views.Matrix extends Backbone.View

  template: JST['app/scripts/templates/matrix.ejs']

  tagName: 'div'

  events: {}

  initialize: () ->
    @listenTo @model, 'change', @render

  render: () ->
    @$el.html @template(matrixRows: @matrixRows())
    MathJax.Hub.Queue ['Typeset', MathJax.Hub]

  matrixRows: () ->
    _.map(@model.get('matrix'), (row) ->
      _.map(row, (entry) ->
        entry.toLatex().replace /\f/g, '\\f'
      ).join ' && '
    ).join ' \\\\ '

