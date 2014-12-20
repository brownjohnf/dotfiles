require "awesome_print"
require "irb/completion"

AwesomePrint.irb!

def cls
  system("clear")
end

IRB.conf.merge!({
  :AUTO_INDENT => true,
  :USE_READLINE => true,
  :VERBOSE => true,
  :SAVE_HISTORY => 9999,
})

puts "--> .irbrc loaded successfully."

