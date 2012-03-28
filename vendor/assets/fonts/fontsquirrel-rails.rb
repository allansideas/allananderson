#!/usr/bin/env ruby
#Extracts files to current dir, substitutes url( for font_url( and appends stylesheet to fonts.css.scss
completed_files = Array.new
current_directory = Dir.getwd
Dir.mkdir("#{current_directory}/generated_files") unless File.directory?('generated_files')
File.open("#{current_directory}/generated_files/fonts.css.scss", "w") {}
File.open("#{current_directory}/generated_files/fonts_demo.css.scss", "w") {}
File.open("#{current_directory}/generated_files/fonts_demo.html.haml", "w") {}
Dir.foreach(current_directory) do |file_name|
  if (file_name.include?(".zip") && !completed_files.include?(file_name))
    system("unzip -o #{file_name}") 
    completed_files << file_name
    style = File.read('stylesheet.css')
    style = style.gsub(/url\(/, "font_url(")
    File.open("#{current_directory}/generated_files/fonts.css.scss", "a") do |f|
      f << style 
    end
    css_class_names = style.scan(/font-family:\s\'(.*)\'/)
    File.open("#{current_directory}/generated_files/fonts_demo.html.haml", "a") do |f|
      css_class_names.each do |css_class_name|
        css_class_name = css_class_name[0].to_s
        f << ".#{css_class_name} \n"
        f << "  %h1 #{css_class_name} \n"
        f << "  %h2 #{css_class_name} \n"
        f << "  %h3 #{css_class_name} \n"
        f << "  %p The quick brown fox jumps over the lazy dog. \n"
        f << "  %p Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n"
      end
    end
    File.open("#{current_directory}/generated_files/fonts_demo.css.scss", "a") do |f|
      css_class_names.each do |css_class_name|
        css_class_name = css_class_name[0].to_s
        f << ".#{css_class_name} { font-family: #{css_class_name}; } \n"
        f << ".#{css_class_name} h1{ border: solid 1px #ccc; } \n"
      end
    end
  end
end
