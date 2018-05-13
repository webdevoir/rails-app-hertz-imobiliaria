SparkPostRails.configure do |c|
  c.sandbox = true                                # default: false
  c.track_opens = true                            # default: false
  # c.track_clicks = true                           # default: false
  # c.return_path = 'BOUNCE-EMAIL@YOUR-DOMAIN.COM'  # default: nil
  c.transactional = true                          # default: false
  c.inline_css = true                             # default: false
  c.html_content_only = true                      # default: false
end
