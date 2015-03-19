class TeachersImporter

  def initialize(filename=File.dirname(__FILE__) + "/../db/data/teachers.csv")
    @filename = filename
  end

  def import
    field_names = ['name', 'email', 'phone', 'address']

    print "Importing teachers from #{@filename}: "
    failure_count = 0

    Teacher.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        begin
          teacher = Teacher.create!(attribute_hash)
          print "."; STDOUT.flush
        rescue ActiveRecord::UnknownAttributeError
          print "!"; STDOUT.flush
          failure_count += 1
        end
      end
    end
    failures = "(failed to create #{failure_count} teacher records)" if failure_count > 0
    puts "\nDONE #{failures}\n\n"
  end

end