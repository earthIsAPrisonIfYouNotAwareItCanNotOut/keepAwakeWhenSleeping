## create blog template

# $ rails new blog


## the blog directory

# $ cd blog

# app/       controller model view helper mailer application
# bin/       rails script startup update deploy application
# config/    routes database and more
# config.ru  rack configuration
# db/        database schema migrations
# Gemfile    gem dependencies used by bundler gem
# Gemfile.lock
# lib/       extended moduel
# log/       log file
# public/    world can see static files compile assert
# Rakefile   locate and load tasks
# README.md
# test/      unit test fixture and other test apparatus
# tmp/       cache and pid files
# vendor/    third-party code


## connect blog application to network

# $ bin/rails server
# open a browser and navigate to http://localhost:3000
# you will see the rails default information page


## say "hello" to rails

## To create a new controller

# you will need to run the "controller" generator
# and tell it you want a controller called "Welcome" with an action called "index"
# $ bin/rails generate controller Welcome index

## add "hello" to a view

# Open the app/views/welcome/index.html.erb file, replace below code
# <h1>Hello, Rails!</h1>


## set "hello" application to home page

## edit config/routes.rb

Rails.application.routes.draw do
  get 'welcome/index' ## get controller's index page

  root 'welcome#index' ## root controller's index page
end
# stop and launch web server again (bin/rails server)


## add the article restfull resource

## add the article resource to the config/routes.rb

Rails.application.routes.draw do
  resources :articles
  root 'welcome#index'
end

## check all the article RESTful actions

# $ bin/rails routes
#       Prefix Verb   URI Pattern                  Controller#Action
#     articles GET    /articles(.:format)          articles#index
#              POST   /articles(.:format)          articles#create
#  new_article GET    /articles/new(.:format)      articles#new
# edit_article GET    /articles/:id/edit(.:format) articles#edit
#      article GET    /articles/:id(.:format)      articles#show
#              PATCH  /articles/:id(.:format)      articles#update
#              PUT    /articles/:id(.:format)      articles#update
#              DELETE /articles/:id(.:format)      articles#destroy
#         root GET    /                            welcome#index


## create controller and method for the resource

## error: Routing Error

# uninitialized constant AriticlesController

## create a controller called ArticlesController

# $ bin/rails generate controller Articles

## error: Unknown action

# the action 'new' could not be found for ArticlesController

## create a new action of controller

class ArticlesController < ApplicationController
  def new
  end
end

## error: ActionController::UnknownFormat in ArticlesController#new

# Articles Controller#new is missing a template for request...

## create a view for action

# add this to app/views/articles/new.html.erb
# <h1>New Article</h1>
# then refresh http://localhost:3000/articles/new, you'll see it in the page


## create form

## use form builder

# app/views/articles/new.html.erb
# <%= form_for :article do |f| %>
#   <p>
#     <%= f.label :title %><br>
#     <%= f.text_field :title %>
#   </p>
#
#   <p>
#     <%= f.label :text %><br>
#     <%= f.text_area :text %>
#   </p>
#
#   <p>
#     <%= f.submit %>
#   </p>
# <% end %>

## error Unknown action

# The action 'create' could not be found for ArticlesController
# need to create the _create_ action within the _ArticlesController_

## define a _create_ action

# define a _create_ action in app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  def new
  end
  def create
  end
end
# if you re-submit now, you may not see any change

## add response by using params method

def create
  render plain: params[:article].inspect
end
# This action is now displaying the parameters for the article
#   that are coming in from the form

# if you re-submit the form now, you'll see
# <ActionController::Parameters {"title"=>"First Article!",
#                                "text"=>"This is my first article."} permitted: false>

## params method

# a example

# http://www.example.com/?username=dhh&email=dhh@email.com
#                             v
#                 params[:username] equal "dhh"
#                                                  v
#                                        params[:email] equal "dhh@email.com"


## creating the Article model

# $ bin/rails generate model Article title:string text:text
# With that command we told Rails that we want an Article model
#   together with a title attribute of type string, and a text attribute of type text
