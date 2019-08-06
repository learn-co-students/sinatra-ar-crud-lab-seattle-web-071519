
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #have to set this because the index should display a list of all articles
  get '/' do
    redirect to ('/articles')
  end

  #displays the list of articles from the database
  get '/articles' do
    @articles = Article.all
    erb :index
  end


  #new article instance set up using the form
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  #create the article and save to the database using the input from the form
  post '/articles' do
    @article = Article.create(params)
    redirect to ("/articles/#{@article.id}")
  end

  # display the article that was created based on their id
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #update
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  #get the input from the edit form - 
  patch '/articles/:id' do
    # binding.pry
    @article = Article.update(params[:article])

    # @article.save
    redirect to ("/articles/#{@article.id}")
  end

  #delete stuff
  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    Article.all.delete(@article.id)
  end





end
