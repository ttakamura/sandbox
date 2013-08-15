require 'ffi'
require 'pp'

module Faces
  extend FFI::Library
  ffi_lib './libfaces.so'

  attach_function :detect_faces, [:string, :string, :double, :int], :string

  def self.faces_in image_path, output_path = nil
    points = detect_faces(image_path, output_path, 1.2, 2)
    points.split("\n").map do |e|
      vals = e.split(";").map(&:to_i)
      Hash[ [:x, :y, :width, :height].zip(vals) ]
    end
  end
end

input_file = ARGV.shift
pp Faces.faces_in(input_file, input_file.gsub(/jpg/, '_out.jpg'))
