window.MatrixApp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    'use strict'

    matrix = new MatrixApp.Models.Matrix
    matrix.setRandom 2, 3
    MatrixApp.matrixView = new MatrixApp.Views.Matrix model: matrix
    $('.container').html MatrixApp.matrixView.$el
    MatrixApp.matrixView.render()

$ ->
  'use strict'
  MatrixApp.init();
