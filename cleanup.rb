# This file opens space seperated files
def get_first_columns_from_file(files, separator=' ')
  puts "Processing: #{files.join(", ")}"

  files.each do |file|
    File.foreach(file) { |line|
      #puts "Before: #{line}"
      #puts "After: #{line.split(" ")[0]}" 
      puts line.split(separator)[0]
    }
    #puts "clean_#{file}"
  end
end

# Run this file only if it's been provided a parameter.
get_first_columns_from_file(ARGV) if ARGV.length > 0
