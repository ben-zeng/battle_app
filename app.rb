require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  before do
    @game = Game.the_game
  end

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    @game = Game.create(player_1, player_2)

    redirect '/play'
  end

  get '/' do
    erb(:index)
  end

  get '/play' do
    #@game = Game.the_game
    erb(:play)
  end

  get '/attack' do
    #@game = Game.the_game
    @prev_turn_name = @game.prev_turn.name
    @game.attack(@game.prev_turn)
    @prev_turn_hp = @game.prev_turn.hit_points
    @game.switch_turns
    if @game.player_won? == nil
      erb(:attack)
    else
      redirect '/end'
    end
    #@game.player_won? == nil ? erb(:attack) : redirect '/play'
    erb(:attack)
  end

  get '/end' do
    #@game = Game.the_game
    @winner = @game.player_won?.name
    erb(:end)
  end

  run! if app_file == $0


end
