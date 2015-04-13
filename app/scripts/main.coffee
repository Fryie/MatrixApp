window.MatrixApp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    'use strict'

    MatrixApp.matrix = new MatrixApp.Models.Matrix
    MatrixApp.matrix.setRandom 2, 3
    matrixView = new MatrixApp.Views.Matrix model: MatrixApp.matrix
    controlsView = new MatrixApp.Views.Controls

    $('#app').append matrixView.$el
    $('#app').append controlsView.$el
    matrixView.render()
    controlsView.render()

$ ->
  'use strict'
  MatrixApp.init();
