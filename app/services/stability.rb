class Stability

  def self.generate(prompt, options = {})
    client.generate(prompt, options) do |answer|
      answer.artifacts.each do |artifact|
        if artifact.type == :ARTIFACT_IMAGE
          io = StringIO.new artifact.binary
          return io 
        end
      end
    end
  end

  protected

  def self.client
    @@client ||= StabilitySDK::Client.new api_key: ENV['STABILITY_SDK_API_KEY'], timeout: 600
  end
end