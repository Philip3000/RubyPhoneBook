class Contact
    attr_accessor :name, :phone

    def initialize(name, phone)
        @name = name
        @phone = phone
    end
end
$phoneBook = []
def add(name, phone)
    contactToAdd = Contact.new(name, phone.to_i)
    $phoneBook << contactToAdd
    puts "Contact added to phonebook"
end
def view()
    for item in $phoneBook
        puts "Name: #{item.name}, Phone: #{item.phone}"
    end
end

def searchByName(searchName)
    puts "Searching phonebook for #{searchName}"
    for item in $phoneBook
        if item.name == searchName
            foundContact = item
            puts "Contact found: #{item.name}, #{item.phone}"
        end
    end
end

def updateNumber(searchName, updateNumber)
    for item in $phoneBook
        if item.name == searchName
            puts "Old number for #{item.name}: #{item.phone}"
            item.phone = updateNumber.to_i
            puts "New Number: #{item.phone}"
        end
    end
end

def delete(idToDelete)
    idToDelete = idToDelete.to_i
    idToDelete -= 1
    deleted = $phoneBook.delete_at(idToDelete)
end

puts "Welcome to the Phone book app"
puts 
puts ""
puts "Commands:"
puts "      add            Add a contact to the phonebook"
puts "      view           View the list of contacts"
puts "      search         Search for a contact by name"
puts "      update         Update the phone number of a contact"
puts "      delete         Delete a contact from the phonebook"
puts "      exit           Exit the application"
puts ""
loop do
    command = gets.chomp
    if command.start_with?("add")
        print "Enter name for new contact: "
        name = gets.chomp
        print "Enter phone number of new contact: "
        phone = gets.chomp
        add(name, phone)
        puts "Done"
        puts ""
    end

    if command.start_with?("view")
        puts "Contacts: "
        view()
        puts ""
    end

    if command.start_with?("search")
        print "Enter name to search for: "
        name = gets.chomp
        searchByName(name)
        puts "Done"
        puts ""
    end

    if command.start_with?("update")
        print "Enter name for contact you wish to update: "
        name = gets.chomp
        puts ""
        print "Enter new phone number for contact: "
        phone = gets.chomp
        updateNumber(name, phone)
        puts "Done"
        puts ""
    end

    if command.start_with?("delete")
        print "Enter id for contact to delete: "
        id = gets.chomp
        delete(id)
        puts "Done"
        puts ""
    end
    if command.start_with?("exit")
        exit
    end
end