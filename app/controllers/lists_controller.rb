class ListsController < ApplicationController
  def index
    lists = Repository.for(:list).all
    render json: ListsWithSideloadSerializer.new(lists)
  end

  def create
    list = CreateList.new(params[:name])
    render json: ListSerializer.new(list)
  end
end
