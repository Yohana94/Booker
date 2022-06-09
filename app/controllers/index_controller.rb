class IndexController < ApplicationController
  def show
    @index = Index.all
  end

  def edit
  end

  def destroy
  end
end
