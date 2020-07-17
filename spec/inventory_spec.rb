require './models/inventory.rb'
require './models/product.rb'

describe Inventory, type: :model do

let(:product_data) {
    JSON.parse('[
      {
        "id": 1,
        "product_type": "tshirt",
        "options": {
          "gender": "male",
          "color": "red",
          "size": "small"
        }
      },
      {
        "id": 2,
        "product_type": "tshirt",
        "options": {
          "gender": "male",
          "color": "red",
          "size": "medium"
        }
      },
      {
        "id": 28,
        "product_type": "tshirt",
        "options": {
          "gender": "female",
          "color": "red",
          "size": "large"
        }
      },
      {
        "id": 29,
        "product_type": "tshirt",
        "options": {
          "gender": "female",
          "color": "green",
          "size": "extra-large"
        }
      },
      {
        "id": 54,
        "product_type": "sticker",
        "options": {
          "size": "small",
          "style": "matte"
        }
      },
      {
        "id": 57,
        "product_type": "sticker",
        "options": {
          "size": "x-large",
          "style": "matte"
        }
      },
      {
        "id": 58,
        "product_type": "sticker",
        "options": {
          "size": "medium",
          "style": "glossy"
        }
      },
      {
        "id": 59,
        "product_type": "sticker",
        "options": {
          "size": "large",
          "style": "glossy"
        }
      },
      {
        "id": 60,
        "product_type": "sticker",
        "options": {
          "size": "x-large",
          "style": "glossy"
        }
      },
      {
        "id": 51,
        "product_type": "mug",
        "options": {
          "type": "coffee-mug"
        }
      }
      ]')
 }

 let(:parsed_inventory) {
   {
       "tshirt" => {
         "gender": Set["male", "female"],
         "color": Set["red", "green"],
         "size": Set["small", "medium", "large", "extra-large"]
     },
       "sticker" => {
         "size": Set["small", "medium", "large", "x-large"],
         "style": Set["red", "green"]
     },
       "mug" => {
         "type": Set["coffee-mug"]
       }
   }
 }

 before { allow(Product).to receive(:data).and_return(product_data) }
 before { inventory_instance.instance_variable_set(:@productToOptions, parsed_inventory) }

 let(:inventory_instance) { Inventory.new() }
 let(:product_instance) { Product.new() }

 describe "Get options for given product type", :getOptions do
    describe "Inventory#getOptions" do

      it "should only return option for sticker style" do
        expect(inventory_instance.getOptions("sticker", Set["small"]))
          .to eq({"style" => Set["matte"]})
      end

      it "should handle multiple options" do
        expect(inventory_instance.getOptions("tshirt", Set["female", "red"]))
          .to eq({"size" => Set["large"]})
      end

      it "should return all sticker options" do
        expect(inventory_instance.getOptions("sticker", Set.new))
          .to eq({"style" => Set["matte", "glossy"],
             "size" => Set["small", "medium", "large", "x-large"]})
      end

      it "should return empty when given invalid product type" do
        expect(inventory_instance.getOptions("melon", Set.new))
          .to eq(Hash.new)
      end
    end
  end

  describe "Returns all products and all options", :parseInventory do
     describe "Inventory#parseInventory" do
       it "should map of products to the available options" do
         expect(inventory_instance.parseInventory)
           .to eq(parsed_inventory)
       end
     end
   end

end
