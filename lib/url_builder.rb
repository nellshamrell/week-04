

# 
# Here is where you will write the #url_builder method that are defined in the 
# associated specifications file.
# 
# For more information about methods and their parameters I encourage you to 
# read some of the following:
# 
# @see http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls
# @see Programing Ruby, Chapter 6 
#


def url_builder(url,*parameters)
  params = parameters
  built_url = url + "?"
  params_hash = Hash[*params.flatten]
  default_url = built_url + "results=10"
  return default_url if params.empty? 

  params_hash = Hash[*params.flatten]

  params_string = ""
  params_hash.each_with_index do |(key,value), index|
    if index == params_hash.length - 1
      built_url = built_url + "#{key}=#{value}" 
    else
      built_url = built_url + "#{key}=#{value}&"
    end
  end
  return built_url
end
