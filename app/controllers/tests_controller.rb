class TestsController < ApiController
  def hello
    render json: {msg: 'hello world'}
  end
end
