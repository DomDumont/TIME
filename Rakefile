desc 'Configure, build, and test TIME project'
task :ci do
  if ENV['LINUX'] 
    print "This is a linux build\n"; $stdout.flush   # Flush the standard output 
  end

  $build_options = "-DWIN32=#{ENV['WINDOWS']}" if ENV['WINDOWS']
  $build_options = "-DTE_64BITS=#{ENV['TE_64BITS']}" if ENV['TE_64BITS']

  makefile_ci

end


def makefile_ci
	print "======== Function makefile_ci ==========\n"
	system "./cmake_generic.sh ../Build #{$build_options}"
	system "cd ../Build && make" or abort 'Failed to build TIME Engine'
end
