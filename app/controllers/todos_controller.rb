class TodosController < ApplicationController
  def new
    todo = Hash.new
    todo["ingaveDatum"] = params[:ingaveDatum]
    todo["eindDatum"] = params[:eindDatum]
    todo["prioriteit"] = params[:prioriteit]
    todo["beschrijving"] = params[:beschrijving]
    todo["status"] = params[:status]
    @todo = Todo.new(todo)
    @todo.save

    @db = CouchRest.database(ENV['CouchDB'])
    @db.save_doc(todo)
    redirect_to @todo
  end
  def show
    @todo = Todo.find(params[:id])
    render :json => @todo
  end
  def filter
    @todos = Todo.where(prioriteit: params[:filter])
    render :json => @todos
  end
end
