class Game
attr_reader :player_1, :player_2, :current_turn, :prev_turn

  def self.the_game
    @game
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end


  def initialize(player_1 , player_2)
    @player_1 = player_1
    @player_2 = player_2
    @current_turn = @player_1
    @prev_turn = @player_2
  end


  def attack(player)
    player.reduce_hp

  end

  def switch_turns
    @prev_turn = @current_turn
    @current_turn == @player_1 ? @current_turn = @player_2 : @current_turn = @player_1
  end

  def player_won?
   if player_1.dead?
     player_2
   elsif player_2.dead?
     player_1
   else

   end
  end


end



