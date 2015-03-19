
length 	= 8
name	= "chapter"
puts Dir.pwd
Dir.chdir "../"
for i in 1..length do 
	Dir::mkdir("#{name+i.to_s}") unless File.exists?("#{name+i.to_s}")
end