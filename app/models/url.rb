class Url < ActiveRecord::Base
	validates :long_url, presence: true
	validates :short_url, presence: true
	validates :long_url, :format => URI::regexp(%w(http https))
	# before_create :check_url
	# validates_format_of :long_url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/

	# validates :long_url, format: { with: /(http://)/,
 #    message: "only allows letters" }
	# def check_url
	# 		errors.add(:short_url, "can't be blank") if Url.short_url.nil?
	# end
	def self.reterive_short_url(long_url)
		x = Url.find_by(long_url: long_url)
		if x
			x.short_url
		end
	end
end
