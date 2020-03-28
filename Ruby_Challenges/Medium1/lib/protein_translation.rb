=begin
AUG	 Methionine
UUU  UUC	Phenylalanine
UUA  UUG	Leucine
UCU  UCC, UCA, UCG	Serine
UAU  UAC	Tyrosine
UGU  UGC	Cysteine
UGG	 Tryptophan
UAA  UAG, UGA	STOP
Data Structure:
  Hash: Key: Array of Codons, Value: Amino Acid
  String: Amino Acid, Codon
Algortithm for of_codon method:
  Given a string: codon
    - Iterate through each key-value pair of CODON -> AMINO key:
      - If the key array includes codon:
        - Return value
of_rna Method:
  Expected Behavior/Mental Model of Method:
    Take a string representing a polpeptide strand. The method
    splits the strand into it's individual codons. With the
    codons, the method will convert the codons into amino acids.
  Input:  Polypeptide Strand (string of codons)
  Output: Array of Amino Acids Representing the Codons within the Polypeptide Strand.
  Rules:
    1. Stop the test once the translation hits a stop codon.
      - This stop codon will not be echoed to the array return value
    2. Need to split the input string in groups of 3.
=end

class InvalidCodonError < StandardError; end

class Translation
  CODON_TO_AMINO = {
    ['AUG'] => 'Methionine',
    ['UUU', 'UUC'] => 'Phenylalanine',
    ['UUA', 'UUG'] => 'Leucine',
    ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
    ['UAU', 'UAC'] => 'Tyrosine',
    ['UGU', 'UGC'] => 'Cysteine',
    ['UGG'] => 'Tryptophan',
    ['UAA', 'UAG', 'UGA'] => 'STOP'
  }

  def self.of_codon(codon)
    raise InvalidCodonError unless valid_codon?(codon)
    CODON_TO_AMINO.each do |codons, amino|
      return amino if codons.include?(codon)
    end
  end

  def self.of_rna(strand)
    outcome = []
    strand.scan(/.../).each do |codon|
      amino_acid = self.of_codon(codon)
      break if amino_acid == 'STOP'

      outcome << amino_acid
    end
    outcome
  end

  private

  def self.valid_codon?(codon)
    CODON_TO_AMINO.any? do |codons, _|
      codons.include?(codon)
    end
  end
end
