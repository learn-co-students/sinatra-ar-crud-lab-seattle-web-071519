
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/articles'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    @article = Article.new(params)
    @article.save
    redirect "/articles/#{@article.id}"
  end

  patch '/articles' do
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect "/articles/#{@article.id}"
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    erb :display_article
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    @article.delete
    redirect '/articles'
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id].to_i)
    erb :edit_article
  end

end
