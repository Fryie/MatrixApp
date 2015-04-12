window.MatrixApp =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    'use strict'

    matrix = new MatrixApp.Models.Matrix
    matrix.setRandom 2, 3
    window.matrixView = new MatrixApp.Views.Matrix model: matrix
    window.matrixView.render()
    $('.container').html window.matrixView.$el
    MathJax.Hub.Queue ['Typeset', MathJax.Hub]

$ ->
  'use strict'
  MatrixApp.init();
