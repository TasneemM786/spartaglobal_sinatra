class PostsController < Sinatra::Base

  # sets the root as the parent-directory of the current File
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new {File.join(root, 'views')}


  configure :development do
    register Sinatra::Reloader
  end

  $posts = [{
    id:0,
    title: 'Post 1',
    post_body: 'this is the first post'
    },
    {

    id:1,
    title: 'Post 2',
    post_body: 'this is the second post'
    },
    {

    id:2,
    title: 'Post 3',
    post_body: 'this is the third post'
    },
    {

    id:3,
    title: 'Post 4',
    post_body: 'this is the fourth post'
    }]


  get "/posts" do
    @title = "Blog Posts"

    @posts = $posts

    erb :'posts/index'
  end

  get '/posts/new' do
    @title = 'new post'
    @post = {
    id: "",
    title: "",
    post_body: "",
  }
  erb :'posts/new'
  end

  get "/posts/:id" do
    id = params[:id].to_i
    @post = $posts[id]
    @title = 'posts'
    erb :'posts/show'
  end

  post "/posts/" do

    new_post = {
      id: $posts.length,
      title: params[:title],
      post_body: params[:post_body]
    }

    $posts.push(new_post)

    redirect "/posts"
  end

  put "/posts/:id" do
    id = params[:id].to_i
    post = $posts[id]
    post[:title] = params[:title]
    post[:post_body] = params[:post_body]
    $posts[id] = post
    redirect '/posts'
  end

  delete "/posts/:id" do
    id = params[:id].to_i
    $posts.delete_at(id)
    redirect "/posts"
  end

  get "/posts/:id/edit" do
    @title = "edit post"
    id = params[:id].to_i
    @post = $posts[id]
    erb :"posts/edit"
  end

 # _________________________

 $cars = [{
   id:0,
   title: 'car 1',
   car_body: 'this is the first car',
   image: ""
   },
   {

   id:1,
   title: 'car 2',
   car_body: 'this is the second car',
   image: ""
   },
   {

   id:2,
   title: 'car 3',
   car_body: 'this is the third car',
   image: ""
   },
   {

   id:3,
   title: 'car 4',
   car_body: 'this is the fourth car',
   image: ""
   }]



    get "/cars" do
      @title = "list of cars"

      @cars = $cars

      erb :'cars/index'
    end

    get '/cars/new' do
      @title = 'new car'
      @car = {
      id: "",
      title: "",
      car_body: "",
    }
    erb :'cars/new'
    end

    post "/cars/" do

      new_car = {
        id: $cars.length,
        title: params[:title],
        car_body: params[:car_body]
      }

      $cars.push(new_car)

      redirect "/cars"
    end


    get "/cars/:id" do
      id = params[:id].to_i
      @car = $cars[id]
      @title = 'cars'
      erb :'cars/show'
    end

    get "/cars/:id/edit" do
      @title = "edit car"
      id = params[:id].to_i
      @car = $cars[id]
      erb :"cars/edit"
    end

    put "/cars/:id" do
      id = params[:id].to_i
      car = $cars[id]
      car[:title] = params[:title]
      car[:car_body] = params[:car_body]
      $cars[id] = car
      redirect '/cars'
    end

    delete "/cars/:id" do
      id = params[:id].to_i
      $cars.delete_at(id)
      redirect "/cars"
    end





end
