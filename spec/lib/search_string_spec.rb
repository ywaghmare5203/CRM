require 'spec_helper'
require 'search_string'

describe "SearchString tokenization" do

  it "use white space as delimiter" do
    tokens = (SearchString.new "lorem ipsum dolor sit amet").tokenize
    tokens.should include "lorem"
    tokens.should include "amet"
  end
  
  it "group double-quoted strings" do
    tokens = (SearchString.new "\"lorem ipsum\" \"dolor sit amet\"").tokenize
    tokens.should include "lorem ipsum"
    tokens.should include "dolor sit amet"
  end
end
