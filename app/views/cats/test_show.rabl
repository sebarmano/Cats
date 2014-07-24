object :@cat
attributes :name, :bio, :breed, :catchphrase
node(:image) { |image| image_url(image) }