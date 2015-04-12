# global beforeEach, describe, it, assert, expect
"use strict"

describe 'Matrix Model', ->
  beforeEach ->
    @MatrixModel = new MatrixApp.Models.Matrix();
