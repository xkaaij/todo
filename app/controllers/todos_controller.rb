class TodosController < ApplicationController

  def index
  	@todos = Todo.all
  end

  def new
  	@todo = Todo.new
  end

  def create
  	@todo = Todo.create(:name => params[:todo][:name])
    redirect_to todos_path, :notice => "Todo created succesfully"
  end	

  def destroy
  	Todo.find(params[:id]).destroy
    redirect_to todos_path, :notice => "Todo deleted succesfully"
  end
end