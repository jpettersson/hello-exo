task :setup => 'setup:default'

namespace :setup do

	task :default do
		Rake::Task['git:init'].execute
		Rake::Task['git:add_submodules'].execute
		Rake::Task['git:update_remote'].execute
		Rake::Task['git:initial_commit'].execute
	end

end

namespace :git do

	task :init do
		# Set up git repository
		puts %x{git init}
	end

	task :add_submodules => ['git:init'] do
		submodules = {
			:spine => "https://github.com/maccman/spine.git",
			:exo => "https://github.com/jpettersson/exo.js.git"
		}

		submodules.each do |sub|
			puts %x{git submodule add #{sub[1]} vendor/#{sub[0]}}
		end

		# Symlink the coffeescript src from spine & exo into the project source folder.
		cmd = [	
			"cd source/javascripts/vendor", 
			"ln -s ../../../vendor/spine/src _spine", 
			"ln -s ../../../vendor/exo/src _exo"	
		].join(' && ')
		
		puts %x{#{cmd}}
	end

	task :update_remote => ['git:init'] do
		# 2. Update the git remote if it's pointing to the official Github repo for the template.
		remote = %x{git config --get remote.origin.url}
		if remote.include? "jpettersson/middleman-spine-exo.git"
			
			# Prompt user to input a new origin URL
			puts "The remote URL for this repo is currently: #{remote}"
			puts "Would you like to update it? (y/n): yes"
			input = STDIN.gets.strip.downcase
			if input.length == 0 or input == 'y'
				puts "Enter the new remote URL:"
				
				# update the origin remote
				new_repo = STDIN.gets.strip
				%x{git config --unset remote.origin.url}
				%x{git config --unset remote.origin.url #{new_repo}}
			end

			# puts "Finally, would you like to commit the current directory? (y/n): yes"
			# input = STDIN.gets.strip.downcase
			# if input.length == 0 or input == 'y'
			# 	Rake::Task['git:add_project'].execute
			# end
		end
	end

	# task :add_project do
	# 	puts %{git add .}
	# end

	task :initial_commit do
		puts %{git commit -m "Added the scaffolded middleman project"}
	end
	
end