class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    dist = 0
    len = 0
    if other_strand.length < @strand.length
      len = other_strand.length
    else
      len = @strand.length
    end
    len.times do |i|
      dist += 1 unless @strand[i] == other_strand[i]
    end
    dist
  end
end
