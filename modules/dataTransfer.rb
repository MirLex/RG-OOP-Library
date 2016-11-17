module DataTransfer
  module ClassMethods
    def import(file_path, method = 'YAML')
      if File.file?(file_path)
        obj = if method.casecmp('serialize').zero?
                Marshal.load(File.read(file_path))
              else
                YAML.load(File.read(file_path))
              end
      end

      obj.class == self ? obj : (raise ArgumentError, 'Incorrect file')
    end
  end

  module InstanceMethods
    def export(file_path, method = 'YAML')
      if method.casecmp('serialize').zero?
        File.open(file_path, 'w') { |f| f.write(Marshal.dump(self)) }
      else
        File.open(file_path, 'w') { |f| f.write(YAML.dump(self)) }
      end
      file_path
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
