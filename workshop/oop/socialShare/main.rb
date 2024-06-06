class SocialShare
  @@platforms = {
    facebook: 'https://www.facebook.com/sharer/sharer.php?u=%<url>s',
    x: 'https://x.com/intent/tweet?text=%<url>s %<title>s',
    linkedin: 'http://www.linkedin.com/shareArticles?mini=true&url=%<url>s&title=%<title>s&summary=%<summary>s&source=Recognize'
  }

  def initialize(platform, title, url, summary = '')
    @platform = platform.to_sym
    @share_url = url
    @title = title
    @summary = summary
  end

  def generate_url
    @@platforms[format(@platform, title: @title, url: @share_url, summary: @summary)]
  end

  def url
    @url ||= generate_url
  end
end
