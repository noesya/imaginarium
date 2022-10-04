class Stability

  def self.generate(prompt, options = {})
    client.generate(prompt, options) do |answer|
      answer.artifacts.each do |artifact|
        return artifact if artifact.type == :ARTIFACT_IMAGE
      end
    end
  end

  protected

  def self.client
    @@client ||= StabilitySDK::Client.new api_key: ENV['STABILITY_SDK_API_KEY'], timeout: 600
  end
end