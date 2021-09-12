class ApiController < ApplicationController
  protect_from_forgery unless: -> { true }

  def success
    render status: 200, json: {success: true}.to_json
  end

  def timestamp
    response.headers['Retry-After'] = 30.minutes.from_now.utc.iso8601
    render status: 429, json: {success: false}.to_json
  end

  def seconds
    response.headers['Retry-After'] = 120
    render status: 429, json: {success: false}.to_json
  end

  def no_retry
    render status: 429, json: {success: false}.to_json
  end

  def error
    render status: 500, json: {success: false}.to_json
  end

  def notes
    img = "https://chop.imgix.net/production/e276997e-1c1c-423c-a79e-5c1820e93342/notes/1623156929170.jpg"
    @html = "<b><p>The Best Service Ever Title</p></b><figure class='image'><img height=100 width=100 src='#{img}'></figure><p>11:15am</p><p>Freedom Church</p><hr /><h1>Yay Notes!</h1>"
    @css = File.open("app/assets/stylesheets/notes.css").read

    html = clean(@html, @css)
    pdf = WickedPdf.new.pdf_from_string(html)

    send_data pdf, filename: 'notes.pdf', type: :pdf

#    respond_to do |format|
#      format.pdf do
#        render pdf: "notes"   # Excluding ".pdf" extension.
#      end
#    end
  end

  def clean(html, css)
    html = html.gsub('—', '&ndash;')
    html = html.gsub('…', '&hellip;')
    "<head><style>#{css}</style></head><body><div>#{html}</div></body>"
  end

  def test
    @author = Author.includes(:posts).first
#
#    author = Author.first
#    json = {author: author, posts: [author.posts]}
#
#    render status: 200, json: json.to_json
  end

end
