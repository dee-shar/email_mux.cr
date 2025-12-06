require "json"
require "http/client"

class EmailMux
  def initialize()
    @headers = HTTP::Headers {
      "Content-Type" => "application/json",
      "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
    }
    uri = URI.parse("https://emailmux.com")
    @http_client = HTTP::Client.new(uri)
  end

  def generate_email(domains : Array(String) = ["gmail_plus", "hotmail", "googlemail", "outlook"]) : JSON::Any
    body = {"domains" => domains}.to_json
    JSON.parse(@http_client.post("/generate-email", body: body, headers: @headers).body)
  end

  def activate_email(email : String) : JSON::Any
    JSON.parse(@http_client.get("/use-email?email=#{email}", headers: @headers).body)
  end

  def get_inbox(email : String) : JSON::Any
    JSON.parse(@http_client.get("/emails?email=#{email}", headers: @headers).body)
  end
end
