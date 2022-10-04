# == Schema Information
#
# Table name: images
#
#  id         :bigint           not null, primary key
#  prompt     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Image < ApplicationRecord

  has_one_attached :generated

  after_create :generate

  protected

  def generate
    # io = Stability.generate prompt
    # generated.attach  io: artifact.binary,
    #                   filename: 'generated.png',
    #                   content_type: 'image/png'
    client = StabilitySDK::Client.new api_key: ENV['STABILITY_SDK_API_KEY'], timeout: 600
    client.generate(prompt, {}) do |answer|
      answer.artifacts.each do |artifact|
        if artifact.type == :ARTIFACT_IMAGE
          io = StringIO.new artifact.binary
          generated.attach(io: io, filename: 'generated.png', content_type: 'image/png')
        end
      end
    end
  end
end
