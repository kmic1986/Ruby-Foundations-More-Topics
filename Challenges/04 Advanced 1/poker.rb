class Poker
  def initialize(args)
    @hands = []
    args.each { |hand| @hands << Hand.new(hand) }
  end

  def best_hand
    winner = @hands[0]
    set = []
    @hands.each { |hand| winner = hand if hand.rank > winner.rank }
    @hands.each { |hand| set << hand.cards if hand.rank == winner.rank }
    set
  end
end

class Hand
  attr_reader :cards, :rank

  def initialize(cards)
    @cards = cards
    @rank = rank_hand
  end

  def suit(card)
    'hearts' if card[1] == 'H'
    'clubs' if card[1] == 'C'
    'diamonds' if card[1] == 'D'
    'spades' if card[1] == 'S'
  end

  def face(card)
    card[0]
  end

  def value(card)
    ['0', '1', '2', '3', '4',
     '5', '6', '7', '8', '9',
     'T', 'J', 'Q', 'K', 'A'].index(face(card))
  end

  def rank_hand
    if straight_flush?
      9.0 + top_card
    elsif four_of_a_kind?
      8.0 + pair_score
    elsif full_house?
      7.0 + pair_score
    elsif flush?
      6.0 + top_card
    elsif straight?
      5.0 + top_card
    elsif three_of_a_kind?
      4.0 + top_card
    elsif two_pair?
      3.0 + two_pair_score
    elsif pair?
      2.0 + pair_score
    else
      top_card
    end
  end

  def groups
    results = {}
    final = []
    @cards.each do |card|
      if results.has_key?(value(card))
        results[value(card)] << card
      else
        results[value(card)] = [card]
      end
    end
    results.each do |set|
      final << set[1]
    end
    final
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    groups[1].length == 4 ||
    groups[0].length == 4
  end

  def full_house?
    (groups[0].length == 2 && groups[1].length == 3) ||
    (groups[0].length == 3 && groups[1].length == 2)
  end

  def flush?
    @cards.map { |card| suit(card) }.uniq.length == 1
  end

  def straight?
    s = @cards.map { |card| value(card) }.sort[0]
    s == 2 ? ace = 'low' : ace = 'high'
    st = true
    @cards.map { |card| value(card) }.sort.each do |value|
      st = false unless value == s || (value == 14 && ace == 'low')
      s += 1
    end
    st
  end

  def three_of_a_kind?
    groups[2].length == 3 ||
    groups[1].length == 3 ||
    groups[0].length == 3
  end

  def two_pair?
    (groups[1].length == 2 && groups[2].length == 2) ||
    (groups[0].length == 2 && groups[2].length == 2) ||
    (groups[0].length == 2 && groups[1].length == 2)
  end

  def two_pair_score
    value(groups.sort { |g| g.length }[-2..-1]
                .sort { |g| value(g[0]) }
                .last.last).to_f / 100
  end

  def pair?
    @cards.map { |card| value(card) }.uniq.length == 4
  end

  def pair_score
    value(groups.sort { |g| g.length }.last.last).to_f / 100
  end

  def top_card
    @cards.map { |card| value(card) }.sort[4].to_f / 100
  end
end


# straight flush  9
# four of a kind  13
# full house      13
# flush           13 ^ 5
# straight        9
# three of a kind 13
# two pair        13 ^ 2
# one pair        13 ^ 2
# high card       13
