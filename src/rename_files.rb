# archive your images before renaming 
# ScreenShot001.jpg -> ScreenShot001.jpg 
# ScreenShot002.jpg -> ScreenShot003.jpg 
# ScreenShot003.jpg -> ScreenShot005.jpg 
# ScreenShot004.jpg -> ScreenShot007.jpg 
# ScreenShot005.jpg -> ScreenShot009.jpg 
# ScreenShot006.jpg -> ScreenShot011.jpg 
# ScreenShot007.jpg -> ScreenShot013.jpg 
# ScreenShot008.jpg -> ScreenShot015.jpg 
# ScreenShot009.jpg -> ScreenShot017.jpg 
# ScreenShot010.jpg -> ScreenShot019.jpg 
# ScreenShot011.jpg -> ScreenShot021.jpg 
# ScreenShot012.jpg -> ScreenShot023.jpg 
# ScreenShot013.jpg -> ScreenShot025.jpg 
# ScreenShot014.jpg -> ScreenShot027.jpg 
# ScreenShot015.jpg -> ScreenShot029.jpg 
# ScreenShot016.jpg -> ScreenShot031.jpg 
# ScreenShot017.jpg -> ScreenShot033.jpg 
# ScreenShot018.jpg -> ScreenShot035.jpg 
# ScreenShot019.jpg -> ScreenShot037.jpg 
# ScreenShot020.jpg -> ScreenShot039.jpg 
# ScreenShot021.jpg -> ScreenShot041.jpg 
# ScreenShot022.jpg -> ScreenShot043.jpg 

files = []
start_from_file=1
step=1

Dir.foreach(".") { |file| 
	if file =~ /\w.jpg/ or file =~ /\w.png/
		files << file
	end
}

def sum_string(string, number)
	len = (string.scan(/^0*/)[0]+(string.to_i+number).to_s).length - string.length
	if len > 0 then
		return string.scan(/^0*/)[0][len..-1]+(string.to_i+number).to_s	
	else
		return string.scan(/^0*/)[0]+(string.to_i+number).to_s	
	end
end

j = files.length - 1
while j != 0 
	new_name = files[j].scan(/^(.*?)0/)[0][0].to_s+sum_string(files[j].scan(/\d/).join(''), j)+"."+files[j].split(".")[-1]
	old_name = files[j]
	File.rename("#{old_name}", "#{new_name}")
	puts "#{old_name} -> #{new_name}"
	j -= 1
end

