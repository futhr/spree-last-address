guard "rspec", cli: "--format Fuubar", all_on_start: false, all_after_pass: false do
  watch("spec/spec_helper.rb")                        { "spec" }
  watch(%r{^spec/(.+)_spec\.rb$})                     { |m| "spec/#{m[1]}_spec.rb"}
  watch(%r{^app/(.+)_decorator\.rb$})                 { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb" }
end
