# 
# Here is where you will write the method #find_quote
# 
# For more information about methods and their parameters I encourage you to 
# read some of the following:
# 
# @see http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls
# @see Programing Ruby, Chapter 6 
#

def find_quote(file_name,line_number=rand())
 
  return "Could not find a quote at this time" unless File.exist?(file_name)

  line_count = 0
  File.open(file_name) {|f| line_count = f.read.count("\n")}

  line_number = Random.rand(line_count + 1) if line_number > line_count

  text = File.open(file_name).readlines
  quote = text[line_number].chomp
end

def search_for_quote(file_name,search_criteria)
  results = []
  return results unless File.exist?(file_name)
end
