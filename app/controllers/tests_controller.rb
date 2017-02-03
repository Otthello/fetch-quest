class TestsController < ApplicationController
  def hello
    render json: {msg: 'hello world'}
  end
end
