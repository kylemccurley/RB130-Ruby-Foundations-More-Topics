=begin
  Algorithm for recite() method: 
    Generate a paragraph from multiple lines in a nested array:
    Generate a rhyme out of the generated paragraphs.
    
    Initialize a local variable: paragraph = []
    Iterate from the last element (-1).downto the first element: |index|
      IF index is -1
        APPEND 'This is ' + pieces[index] to paragraph
      ELSE:
        APPEND pieces[index][-1] + ' ' + pieces[index][0] to paragraph
      END
    RETURN paragraph.join(' ') (Returns a string of words)
=end

class House

  def self.recite
    outcome = ""
    (1..pieces.size).each do |lines|
      outcome += combine_pieces(pieces.last(lines)) + "\n"
      outcome += "\n" unless lines == pieces.size
    end
    outcome
  end

  def self.combine_pieces(pieces)
    line = "This is "
    pieces.each do |piece|
      line += piece[0]
      line += "\n" if piece[1]
      line += (piece[1] + ' ') if piece[1]
    end
    line + '.'
  end

  def self.pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
=begin
This is the cow with the crumpled horn
that tossed the dog # Tossed <= Dog
that worried the cat # Worried <= Cat
that killed the rat # Killed <= Rat
that ate the malt # Ate <= Malt
that lay in the house that Jack built.

Key-Words: NESTED ARRAY: Quantitatively Reference The Difference
  between two words:

  malt => ate
  rat => killed
  cat => worried
  dog => tossed
  cow with the crumpled horn => milked
  maiden all forlorn => kissed
  man all tattered and torn => married
  priest all shaven and shorn => woke
  rooster that crowed in the morn => kept
  farmer sowing his corn => belonged to
  horse and the hound and the horn

Data Structure:
  Keywords: Nested Array
=end
