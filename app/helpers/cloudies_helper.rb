module CloudiesHelper
  def cloudy_lists(cloudies)
    html = ''
    cloudies.each do |cloudy|
      html += render(partial: "cloudy", locals: { cloudy: cloudy })
    end
    return raw(html)
  end  
end
