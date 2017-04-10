class InvalidCodonError < StandardError
end

class Translation
  CODONS = {'AUG' => 0, 'UUU' => 1, 'UUC' => 1, 'UUA' => 2,
            'UUG' => 2, 'UCU' => 3, 'UCC' => 3, 'UCA' => 3,
            'UCG' => 3, 'UAU' => 4, 'UAC' => 4, 'UGU' => 5,
            'UGC' => 5, 'UGG' => 6, 'UAA' => 7, 'UAG' => 7,
            'UGA' => 7}
  ACIDS = ['Methionine', 'Phenylalanine', 'Leucine', 'Serine',
           'Tyrosine', 'Cysteine', 'Tryptophan', 'STOP']

  def self.of_codon(codon)
    if CODONS[codon] != nil
      ACIDS[CODONS[codon]]
    else
      raise InvalidCodonError
    end
  end

  def self.of_rna(strand)
    results = []
    strand.scan(/.{3}/).each do |codon|
      break if of_codon(codon) == 'STOP'
      results << of_codon(codon)
    end
    results
  end
end
