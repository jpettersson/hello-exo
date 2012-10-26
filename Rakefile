task :default => [:setup]

task :setup do
	path = File.dirname(__FILE__)

	# 1. Setup git submodules
	submodules = {
		:spine => "https://github.com/maccman/spine.git",
		:exo => "https://github.com/jpettersson/exo.js.git"
	}

	puts %x{git init}
	puts %x{git add .gitmodules}

	submodules.each do |sub|
		puts %x{git submodule add #{sub[1]} vendor/#{sub[0]}}
	end

	puts %x{git commit -m 'Added the spine and exo submodules'}

	# 2. Update the git remote if it's pointing to the official Github repo for the template.
	remote = %x{git config --get remote.origin.url}
	if remote == "https://github.com/jpettersson/middleman-spine-exo.git"
		
		# Prompt user to input a new origin URL
		puts "The remote URL for this repo is currently: #{remote}"
		puts "Would you like to update it? (y/n): yes"
		input = STDIN.gets.strip.downcase
		if input.length == 0 or input == 'y'
			puts "Enter the new remote URL:"
			
			# update the origin remote
			new_repo = STDIN.gets.strip
			%x{git config --unset remote.origin.url}
			%x{git config --unset remote.origin.url #{repo_url}}
		end

		puts "Finally, would you like to commit the current directory? (y/n): yes"
		input = STDIN.gets.strip.downcase
		if input.length == 0 or input == 'y'
			puts %{git add .}
			puts %{git commit -m "Added the scaffolded project"}
		end
	end
end