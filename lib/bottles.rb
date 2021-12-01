class Bottles
  def verse(count)
    "#{current_bottle(count)} of beer on the wall, " +
      "#{current_bottle(count, lowercase: true)} of beer.\n" +
      action(count) +
      "#{next_bottle(count)} of beer on the wall.\n"
  end

  def verses(*counts)
    counts[0].downto(counts[1]).map do |count|
      verse(count)
    end.join("\n")
  end

  def song
    verses(99, 0)
  end

  def current_bottle(count, lowercase: false)
    word = count == 1 ? 'bottle' : 'bottles'
    "#{count} #{word}"

    case count
    when 1
      '1 bottle'
    when 0
      lowercase ? 'no more bottles' : 'No more bottles'
    else
      "#{count} bottles"
    end
  end

  def action(count)
    case count
    when 1
      'Take it down and pass it around, '
    when 0
      'Go to the store and buy some more, '
    else
      'Take one down and pass it around, '
    end
  end

  def next_bottle(count)
    next_count = count.zero? ? 99 : count - 1
    case next_count
    when 1
      '1 bottle'
    when 0
      'no more bottles'
    else
      "#{next_count} bottles"
    end
  end
end
