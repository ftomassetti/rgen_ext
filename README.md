# RGen-Ext

We love RGen and use it over and over. Sometimes we feel there are some operations we implement ourself in different projects.
The maintainers of RGen want to keep the gem essential, so this project want to pack these common extensions which do not fit directly in RGen.

## Examples

### Comparison

There are two kinds of Comparator: a ShallowComparator (considering only attributes) and a DeepComparator (which considers also references, recursively).
You can use them like that:

    include RGen::Ext::Comparison

    ShallowComparator.eql?(ferrari_enzo,ferrari_superenzo)
    DeepComparator.eql?(ferrari_enzo,ferrari_superenzo)
    
### Navigation

Do you feel that the RGen objects should be able to give a list of all their children (direct and indirect)?
In RGen-ext you do that in this way:

    class AddressBook < RGen::MetamodelBuilder::MMBase
      include RGen::Ext::NavigationExtensions
      contains_many_uni 'entries', AddressBookEntry
    end
    
    jones_address_book.all_children # this returnes all entries
    jones_address_book.all_children_deep # this returns all entries and all the children of all entries and so on
    
It is also possible to iterate among all the children and the children of the children and so on. Quite handy when you have to traverse a tree:

   jones_address_book.traverse {|n| puts "Traversing #{n}" }
   
You have to add the extension only on the classes on which you want to invoke these methods directly, not necessarily on all the classes of the hierarchy.

### Other stuff

For that I am looking for YOUR contributions!

## Installation

Add this line to your application's Gemfile:

    gem 'rgen_ext'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rgen_ext

## Contributing

I am really open to contributions and I would revise them fast and include them even faster, so just start write them.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
