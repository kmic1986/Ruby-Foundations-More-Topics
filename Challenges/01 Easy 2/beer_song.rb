class BeerSong
  def verse(v)
    case
    when v == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" +
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when v == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" +
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when v == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" +
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    when v > 2
      "#{v} bottles of beer on the wall, #{v} bottles of beer.\n" +
      "Take one down and pass it around, #{v - 1} bottles of beer on the wall.\n"
    end
  end

  def verses(v1, v2)
    counter = v1
    results = ''
    while counter >= v2
      results += verse(counter)
      counter -= 1
      results += "\n" if counter >= v2
    end
    results
  end

  def lyrics
    verses(99, 0)
  end
end
