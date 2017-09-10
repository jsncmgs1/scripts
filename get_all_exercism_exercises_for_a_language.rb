language = ARGV[0]
threads = []

exercises = `exercism list #{language}`.split("\n")
exercises.each do |exercise|
  break if exercise == ''

  threads << Thread.new do
    system("exercism fetch #{language} #{exercise}")
  end
end

threads.each(&:join)
