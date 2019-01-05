module ApplicationHelper

  def my_link_to(url)
    # ^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$
    url.gsub(/https?:\/\/w{0,3}\./, "")
    # url.gsub(/trello/, "")
  end

  def limited_url(url)
    /(.*)(?=\/)/.match(url)
  end
end
