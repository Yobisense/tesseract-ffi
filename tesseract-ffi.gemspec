Gem::Specification.new do |s|
  s.name        = 'tesseract-ffi'
  s.version     = '0.0.1'
  s.date        = '2017-07-06'
  s.summary     = "FFI wrapper around tesseract c library."
  s.description = "FFI wrapper around tesseract c library."
  s.authors     = ["Tjad Clark"]
  s.email       = 'tjad.clark@yobisense.co.za'
  s.files       = [
      'lib/tesseract-ffi.rb',
      'lib/tesseract-ffi/base-api.rb'
  ]
  s.add_runtime_dependency 'ffi', '~> 1.9', '>= 1.9.18'


  s.homepage    =
      'http://rubygems.org/gems/hola'
  s.license       = 'MIT'
end