# encoding: utf-8
module Babosa
  module Transliterator
    class Vietnamese < Latin
      APPROXIMATIONS = {
        "à" => "a",
        "ö" => "oe",
        "ü" => "ue",
        "Ä" => "Ae",
       
        "Ü" => "Ue"
      }
    end
  end
end