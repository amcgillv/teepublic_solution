# TeePublic Solution

## Installation and Getting Started

##### Using Git
1. In the terminal, navigate to a folder where in you'd like to have the program stored.
2. Clone the repo using the following command: `clone https://github.com/amcgillv/teepublic_solution.git`
3. Now you are ready to run the program. The default run command is the following:
`ruby models/cli.rb`
This command will open a CLI where you can enter a product type `tshirt`, `sticker`, or `mug` along with options associated with the product. An example of input with options might be `sticker small`.

##### Downloading Compressed File
1. Unzip file in a folder where you would like to store the program.
2. In the terminal, navigate to the folder where you've unzipped the file.
3. Now you are ready to run the program. The default run command is the following:
`ruby models/cli.rb`
This command will open a CLI where you can enter a product type `tshirt`, `sticker`, or `mug` along with options associated with the product.

## Running Test Locally
Tests are in `spec/inventory_spec.rb`. You can run these with `bundle exec rspec`. Run individual sections of the test with `bundle exec rspec -t getOptions` and `bundle exec rspec -t parseInventory`.

## Invalid Inputs Handling
If you input a product type that is not in the data, you'll receive a `No product of that type` as the response.

If you input product options that aren't available for the given product type, the program responds with appropriate available options along with a message that *x* product option is not a valid product option. For example, `tshirt itsy-bitsy red` will return
```
itsy-bitsy is not a valid option for tshirts
gender:  male, female
size:  small, medium, large, extra-large, 2x-large
```
## Potential for Improvements to Solution
I imagine an ideal solution would reformat the user input to create a mask that could be AND-ed across the product data, filtering out products and options that do not align with the input. Then, the program would return the option types not given by the user.

It might be more in-line with best practice to use variables throughout a class instead of hardcoding them throughout a class. For example, `"product_type"` might be `@product_type`.

## Feedback
The problem itself is relatively straightforward. The difficult part for me was resolving Ruby language issues with my Windows PC. Since there's no `homebrew` or `curl`, resolving version issues takes more time. Because Ruby as a language evolves pretty quickly there tends to be version issue or new built-in methods or depreciation issues whenever I work on a new project in Ruby, which can be pretty time consuming to untangle. I understand the value in having a solution in the language used for the Jr. Full Stack role, and being given multiple days to work on it makes tackling that issue more accessible. That said, an option for a language agnostic approach might be worth considering.
