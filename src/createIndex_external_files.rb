Dir.chdir ".."
stack = []
full_stack = []

Dir.glob("*") { |x|
	full_stack << x if x != "\n"
}

def single_folder(stack)
	Dir.foreach(".") { |file| 
	  if file =~ /\w.jpg/ or file =~ /\w.png/
		stack.push "#{file}"
	  end
	}
end

def multiple_folders(stack)
	Dir.foreach(".") { |file| 
	  if file =~ /\w.jpg/ or file =~ /\w.png/
		stack.push "#{file}"
	  end
	  if file =~ /chapter\d+/ then
	  	Dir.chdir "#{file}"
	  	Dir.foreach(".") { |file| 
	  	  if file =~ /\w.jpg/ or file =~ /\w.png/
			stack.push "#{file}"
		  end
	  	}
	  	generate_index_html(stack)
	  	Dir.chdir ".."
	  	stack = []
	  end
	}
end


def generate_index_html(stack)
  stack.sort!
  File.open("index.html","w") do |x|

		x.puts "<!DOCTYPE html>"
		x.puts "<html>"
		x.puts "	<head>"
		x.puts "		<link rel=\"stylesheet\" type=\"text/css\" href=\"../src/style.css\">"
		x.puts "		<script src=\"http://code.jquery.com/jquery-latest.js\"></script>"
		x.puts "		<script src=\"../src/pages.js\"></script>"
		
		x.puts "	</head>"
		x.puts "	<body>"
 		x.puts "		<div id=\"wrapper\">"
		stack.length.times { |j|
		x.puts " 	       <img src=\"#{stack[j]}\">"
		}	
		x.puts "		</div>"
		x.puts "	</body>"
		x.puts "</html>"
  end	
end

def generate_index_page(stack)
	stack.delete("src")
	puts Dir.pwd
	File.open("index.html","w") do |x|

		x.puts "<!DOCTYPE html>"
		x.puts "<html>"
		x.puts "	<head>"
		x.puts "		<link rel=\"stylesheet\" type=\"text/css\" href=\"src/style.css\">"
		x.puts "		<script src=\"http://code.jquery.com/jquery-latest.js\"></script>"
		x.puts "		<script src=\"src/pages.js\"></script>"
		
		x.puts "	</head>"
		x.puts "	<body>"
 	
		x.puts " <div id=\"chapters_content\">"
		x.puts " 	<div id=\"chapters\">"
		x.puts "		<span> Book Title </span>"
		x.puts "        </br>"

		
		stack.map.with_index { |e, i|
			x.puts "    <a href=\"#{e}/index.html\" class=\"click#{i}\"> #{i}: </a>" 
			x.puts "        <br> <br>"
		}

		x.puts "	</div>"
		x.puts "</div>"
		x.puts "	</body>"
		x.puts "</html>"
  end	
end

# if executed from the src folder
# and files are in ../chapter1 folder
# Dir.chdir ".."
multiple_folders(stack)
generate_index_page(full_stack)

