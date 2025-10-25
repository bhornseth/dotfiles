require 'irb/completion'

IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 5000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:LOAD_MODULES] = %w[json base64 uri ]

