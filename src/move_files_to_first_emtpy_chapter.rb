require "FileUtils"

Dir.chdir "../"
puts Dir.pwd
folders = []
single_chapter_images = []

Dir.glob("*") { |x|
	folders << x if x != "\n" && File.directory?("#{x}") && x =~ /chapter\d+/ 
	single_chapter_images << x if x != "\n" && x =~ /ScreenShot\d+.jpg|ScreenShot\d+.png/
}

folders.sort_by! { |item| item.to_s.split(/(\d+)/).map { |e| [e.to_i, e] } }

folders.each { |x|
	if Dir["#{x}/*"].empty? then
		single_chapter_images.each { |image|
			FileUtils.move "#{image}", "#{x}"
		}
	end
}

