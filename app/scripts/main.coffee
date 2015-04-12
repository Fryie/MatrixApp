window.MatrixApp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    'use strict'

    matrix = new MatrixApp.Models.Matrix.random 3, 3
    matrixView = new MatrixApp.Views.Matrix model: matrix
    matrixView.render()
    $('.container').html matrixView.$el
    MathJax.Hub.Queue ['Typeset', MathJax.Hub]

$ ->
  'use strict'
  MatrixApp.init();
