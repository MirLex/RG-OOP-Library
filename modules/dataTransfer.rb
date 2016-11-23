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
      service = method.casecmp('serialize').zero? ? Marshal : YAML
      File.open(file_path, 'w') { |f| f.write(service.dump(self)) }

      file_path
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
