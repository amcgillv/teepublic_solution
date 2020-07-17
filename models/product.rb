require 'json'
# This class gets and interprets a product from a JSON file.
class Product

  attr_reader :id, :product_type, :options

  def self.data
    path = 'data/products.json'
    file = File.read(path)
    JSON.parse(file)
  end

  # defineOptions formats user given product type and options
  # to resemble a product from the data.
  # Input:
  #     input_type (String): the product type given by the user
  #     input_options (Set): options given by user, if any
  #     mustHaves (Hash): an empty hash to modify and return
  # Return:
  #     The hash version of the user's input, resembling a product from the data
  #     such that "product_type" and "options" map to the user's input.
  def self.defineOptions(input_type, input_options, mustHaves)
    mustHaves["product_type"] = input_type
    mustHaves["options"] = Hash.new
    if input_type.eql?("tshirt")
      for opt in input_options
        case opt
        when "male"
          mustHaves["options"]["gender"] = "male"
        when "female"
          mustHaves["options"]["gender"] = "female"
        when "red"
          mustHaves["options"]["color"] = "red"
        when "green"
          mustHaves["options"]["color"] = "green"
        when "navy"
          mustHaves["options"]["color"] = "navy"
        when "white"
          mustHaves["options"]["color"] = "white"
        when "black"
          mustHaves["options"]["color"] = "black"
        when "small"
          mustHaves["options"]["size"] = "small"
        when "medium"
          mustHaves["options"]["size"] = "medium"
        when "large"
          mustHaves["options"]["size"] = "large"
        when "extra-large"
          mustHaves["options"]["size"] = "extra-large"
        when "2x-large"
          mustHaves["options"]["size"] = "2x-large"
        else
          puts opt + " is not a valid option for tshirts"
          STDOUT.flush
        end
      end
    end
    if input_type.eql?("mug")
      for opt in input_options
        case opt
        when "coffee-mug"
          mustHaves["options"]["type"] = "coffee-mug"
        when "travel-mug"
          mustHaves["options"]["type"] = "travel-mug"
        else
          puts opt + " is not a valid option for mugs"
          STDOUT.flush
        end
      end
    end
    if input_type.eql?("sticker")
      for opt in input_options
        case opt
        when "x-small"
          mustHaves["options"]["size"] = "x-small"
        when "small"
          mustHaves["options"]["size"] = "small"
        when "medium"
          mustHaves["options"]["size"] = "medium"
        when "large"
          mustHaves["options"]["size"] = "large"
        when "x-large"
          mustHaves["options"]["size"] = "x-large"
        when "matte"
          mustHaves["options"]["style"] = "matte"
        when "glossy"
          mustHaves["options"]["style"] = "glossy"
        else
          puts opt + " is not a valid option for tshirts"
          STDOUT.flush
        end
      end
    end
    mustHaves
  end

end
