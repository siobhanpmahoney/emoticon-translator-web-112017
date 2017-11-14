require "yaml"
require "pry"

def load_library(path)
  return_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  y_lib = YAML.load_file(path)
  y_lib.each do |key, value|
    return_hash["get_meaning"][value[1]] = key
    return_hash["get_emoticon"][value[0]] = value[1]
  end
  return_hash
end

def get_japanese_emoticon(path, eng_emoticon)
  emo_lookup = load_library(path)["get_emoticon"][eng_emoticon]
  if emo_lookup != nil
    emo_lookup
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, japanese_emoticon)
  j_emo_lookup = load_library(path)["get_meaning"][japanese_emoticon]
  if j_emo_lookup != nil
    j_emo_lookup
  else
    "Sorry, that emoticon was not found"
  end 
end
