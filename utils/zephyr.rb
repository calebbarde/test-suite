require 'rest-client'

class Zephyr
  def get_latest_release
    @response = RestClient::Request.execute(
      method: :post,
      url: build_url(url)
    )
  end
end
