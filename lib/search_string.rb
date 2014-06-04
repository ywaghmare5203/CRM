
# A utility class to tokenize a search string.
class SearchString
  
  # The pattern for grouped terms (Enclosed in double-quotes).
  @@group_pattern = /".*?"/
  
  def initialize(string)
    @string = string.clone
    @string.freeze
  end
  
  def to_s
    @string
  end
  
  # Tokenize this search string into an array of terms.
  def tokenize
    
    # Find a set of grouped terms.
    groups = @string.scan @@group_pattern
    
    # Create a temporary string, with all grouped terms sliced out.
    temp_string = @string.dup
    groups.each do |group|
      temp_string.slice! group
    end
       
    # Split string with a white-space delimiter.
    tokens = temp_string.split
       
    # Normalize each grouped term and add to the list of tokens.
    groups.each do |group|
      # For each group, remove double-quotes and trailing spaces.
      term = group.delete '"' 
      term.strip!
      
      # If this is a valid term, then add to the list of tokens.
      tokens << term if term.size > 0
    end
    
    return tokens
  end
end
