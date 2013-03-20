class Upload < ActiveRecord::Base
  attr_accessible :title, :document
  
  has_attached_file :document
  
  validates_attachment_presence :document
  validates_attachment_size     :document, :less_than => 5.megabyte
  
  def converter(documento)
    logger.debug "Converter arquivo #{documento}"
    @doc = Upload.find(documento[:id])
    path = File.dirname(__FILE__)+"#{@doc.document.url()}"
    path1 = @doc.document.url()
    pdf = Magick::ImageList.new("#{@doc.document_file_name}")
    thumb = pdf.scale(300, 300)
    name_image = String.new
    name_image = @doc.document_file_name
    thumb.write "#{name_image.gsub(/[.pdf]/, '')}.png" 
  end  
  
  def convert(pdf_location)
    
    tmp_location = File.dirname(pdf_location)
    logger.debug "Opa tmp = #{tmp_location}"
    file_name = File.basename(pdf_location, ".pdf")
    logger.debug "Opa base = #{tmp_location}"
    coverted_jpgs = Array.new
    pdf = Magick::ImageList.new(pdf_location)
    logger.debug "afff"
  end
end
