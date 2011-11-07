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

def search_for_quote(search_hash)
  search_array = *search_hash
  file_name = search_array[0][1] 
  results = []
  search_crit_array = search_array[1]
  return results unless File.exist?(file_name)
  if search_crit_array.nil?
    File.open(file_name) do |f|
      f.each do |line|
        line.chomp!
        results << line
      end
     end
    return results
  end

  search_by = search_crit_array[0]
  search_for = search_crit_array[1]
  File.open(file_name) do |f|
    f.each do |line|
      line.chomp!
      if search_by == :include
        results << line if line.include? search_for
      elsif search_by == :start_with
        results << line if line.start_with? search_for
      elsif search_by == :end_with
        results << line if line.end_with? search_for
      end
    end 
  end
  return results
end
