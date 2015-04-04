line = [4]
col  = 14
insert_string = "../"
page_content = []
sub_folders = []
modify_index_files_in_subfolder = true



def modify_index_page(line, col, insert_string, page_content)
	puts col
	i = 0
	File.open("index.html").each_line do |x|
		# puts "#{i} #{x}"
		if line.include?(i) then
			x.insert(col,"#{insert_string}")
		end
		page_content << x
		i+=1
	end

	# uncomment to modify the page_content
	# File.open("index.html", "w") do |file|
	# 	file.puts(page_content)
	# end

	# Check if this is the change you want
	puts page_content
end

if modify_index_files_in_subfolder == true then
	Dir.glob("*") { |x|
		sub_folders << x if x != "\n" && File.directory?("#{x}") 
	}

	sub_folders.each { |x|
		Dir.chdir("#{x}")
		modify_index_page(line, col, insert_string, page_content)
		Dir.chdir("../")

	}
end

if modify_index_files_in_subfolder == false then
	modify_index_page(line, col, insert_string, page_content)
end
