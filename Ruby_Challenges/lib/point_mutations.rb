=begin
Write a program that can calculate the Hamming distance between two DNA strands.

A mutation is simply a mistake that occurs during the creation or copying of 
a nucleic acid, in particular DNA. Because nucleic acids are vital to cellular
functions, mutations tend to cause a ripple effect throughout the cell. 
Although mutations are technically mistakes, a very rare mutation may 
\equip the cell with a beneficial attribute. In fact, the macro effects of 
evolution are attributable by the accumulated result of beneficial microscopic
mutations over many generations.

The simplest and most common type of nucleic acid mutation is a point mutation,
which replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands
taken from different genomes with a common ancestor, 
we get a measure of the minimum number of point mutations 
that could have occurred on the evolutionary path between the two strands.

This is called the 'Hamming distance': Number of differences between two homologous
DNA strands.

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length.
If you have two sequences of unequal length, 
you should compute the Hamming distance over the shorter length.
-----------------------------------------------------------------
What is the Hamming distance:
  - Number of differences between two DNA strands
  - If the two sizes of the DNA strands are different.
    - Compute the distance over the SHORTER length

Implicit Requirements:
  - Will need to compare the two strand lengths
    - Assign some kind of "string to be compared" variable
  - If the strings are of equal length:
    - Set the "string to be compared" to the first string

Calculating the Hamming Distance:

  - Calculate the hamming_string:
    - If strings are of different length (str1.size != str2.size)
      - Set the control string to the smallest string
    - Otherwise:
      - Set the control_string to the first string
  - Initialize a local variable: hamming_distance -> 0
  - Iterate through each character of the control string (String#chars#each_with_index)
    - Compare the element with the element at the index of the other string
      - If true:
        - Iterate the hamming_distance up by 1
  - Return the hamming_distance
    
  Behaviors:
    - How do I keep track of the control string?
      - Creating a 'control_string' variable
=end

class DNA
  def initialize(dna)
    @dna1 = dna
  end
  
  def hamming_distance(dna)
    hamming_distance = 0
    @dna2 = dna
    @dna_to_be_compared = select_dna_to_be_compared(dna)

    @dna_to_be_compared.chars.each_with_index do |el, idx|
      hamming_distance += 1 unless el == other_dna[idx] 
    end

    hamming_distance
  end

  private
  
  def select_dna_to_be_compared(other_dna)
    if @dna1.size < other_dna.size
      @dna1
    else
      other_dna
    end
  end
  
  def other_dna
    @dna_to_be_compared == @dna1 ? @dna2 : @dna1
  end
end
