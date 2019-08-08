#Placeholder for a model

class Article < ActiveRecord::Base
    def initialize(params)
        super
        @title = params[:title]
        @content = params[:content]
    end
end