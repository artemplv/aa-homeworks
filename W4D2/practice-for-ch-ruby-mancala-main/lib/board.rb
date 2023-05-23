class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    @player1 = name1
    @player2 = name2
    @players_store_cups = {
      6 => name1,
      13 => name2,
    }
    
    place_stones()
  end

  def place_stones
    cups.each_with_index do |cup, i|
      if i != 6 && i != 13
        4.times { cup.push(:stone) }
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
      raise RuntimeError.new('Invalid starting cup')
    end

    if cups[start_pos].empty?
      raise RuntimeError.new('Starting cup is empty')
    end
  end

  def make_move(start_pos, current_player_name)
    selected_cup = cups[start_pos]

    i = start_pos
    while !selected_cup.empty?      
      i += 1
      
      if @players_store_cups.has_key?(i) && @players_store_cups[i] != current_player_name
        i += 1
      end
      if i == 14
        i = 0
      end

      next_stone = selected_cup.pop()
      cups[i].push(next_stone)
    end

    render()

    return :prompt if [6, 13].include?(i)
    if cups[i].empty?
      return :switch
    else
      return i
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = cups[0..5]
    side2 = cups[7..12]
    
    [side1, side2].any? { |side| side.all? { |cup| cup.empty? } }
  end

  def winner
    if cups[6].length > cups[13].length
      @player1
    elsif cups[6].length < cups[13].length
      @player2
    else
      :draw
    end
  end
end