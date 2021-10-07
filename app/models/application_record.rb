class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def friendly_params
      Digest::SHA1.hexdigest([Time.now, rand].join).truncate(9)
  end

end
