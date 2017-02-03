class TestsController < ApplicationController
  def hello
    {msg: 'hello world'}.to_json
  end
end
